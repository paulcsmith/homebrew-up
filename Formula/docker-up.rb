class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.4.tar.gz"
  sha256 "29a08b29ba8526493d7feb3814f4e73d213194c27161d85e570479f824c7f0fe"
  version "0.1.4"
  depends_on "crystal-lang"

  def install
    system "ls"
    system "mkdir lib"
    system "ls"
    system "cp . lib"
    system "ls"
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
