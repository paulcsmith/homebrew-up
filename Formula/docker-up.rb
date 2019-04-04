class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.3.tar.gz"
  sha256 "bcb3fab4065a53a069b8de0b51e41d96fe6c2aa66c2ef7f9dd2de6f681463617"
  version "0.1.3"
  depends_on "crystal-lang"

  def install
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
