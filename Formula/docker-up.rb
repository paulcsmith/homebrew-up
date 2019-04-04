class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.0.tar.gz"
  sha256 "6a676a5b4e923c8203bace1b6fe96ffcaf458916755e7ac8fd52c0fc15973fa2"
  version "0.1.0"
  depends_on "crystal-lang"

  def install
    system "ls"
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
