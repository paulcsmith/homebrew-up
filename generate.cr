require "colorize"
require "ecr/macros"
require "file_utils"
require "./lib/up/src/version"

class UpRelease
  def self.generate
    new.generate
  end

  def generate
    generate_tarball

    puts "Writing new formula"
    generate_new_formula

    puts "\nAll done!".colorize(:green)
  end

  private def generate_tarball
    run_command "tar -czf #{tarball_path} lib"
  end

  def tarball_path
    "tarballs/docker-up-#{version}.tar.gz"
  end

  private def generate_new_formula
    formula = String.build do |formula|
      ECR.embed "./Formula/docker-up.rb.ecr", formula
    end

    File.write("./Formula/docker-up.rb", formula)
  end

  private def url
    "https://github.com/paulcsmith/homebrew-up/raw/master/#{tarball_path}"
  end

  private def binary_sha
    extract_sha get_result_from("shasum -a 256 #{tarball_path}")
  end

  private def version
    Up::VERSION
  end

  private def run_command(command)
    puts command.colorize.dim
    process_result = Process.run \
      command,
      shell: true,
      output: STDOUT,
      error: STDERR
    process_result.success? || exit(1)
  end

  private def get_result_from(command)
    puts command.colorize.dim
    result = IO::Memory.new
    process_result = Process.run \
      command,
      shell: true,
      output: result,
      error: STDERR
    process_result.success? || exit(1)
    result.to_s
  end

  private def extract_sha(result)
    result.split(" ").first
  end
end

UpRelease.generate
