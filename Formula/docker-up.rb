class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/up/raw/master/tarballs/up-0.1.0.tar.gz"
  sha256 "5a6a10d47a6b9f22e098c3003efa3fd53529b7ca9466b3df02056017b5cf1b9a"
  version "0.1.0"
  depends_on "crystal-lang"

  def install
    system "mkdir lib"
    system "ls"
    system "mv teeplate lib/"
    system "mv lucky_cli lib/"
    system "crystal build lib/lucky_cli/src/up.cr"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
