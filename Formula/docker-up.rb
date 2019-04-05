class DockerUp < Formula
  desc "Tool for local developement with Docker"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.6.tar.gz"
  sha256 "79978199e12a85430fd7351e05e7691c9a5df27ce312a6ca8c2f21d58f4faaff"
  version "0.1.6"
  depends_on "crystal-lang"

  def install
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
