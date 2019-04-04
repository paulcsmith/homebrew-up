class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.4.tar.gz"
  sha256 "0b8f4410f6edb812a3e426568d65e12e0c1388fd77d51ff5cb7d290d1f3813f4"
  version "0.1.4"
  depends_on "crystal-lang"

  def install
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
