class DockerUp < Formula
  desc "Tool for local developement with Docker"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.5.tar.gz"
  sha256 "36c710c82246f899bc19ce643232325d5d46c77f69aab9fe94db1077e6a6e168"
  version "0.1.5"
  depends_on "crystal-lang"

  def install
    system "ls"
    system "echo ls"
    system "echo $PWD"
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
