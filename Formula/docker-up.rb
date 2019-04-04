class DockerUp < Formula
  desc "Tool for local docker developement"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.1.tar.gz"
  sha256 "d898493c0e10e442fbc83d049bbbd51bee7746e64511cb7ec127face07d6ded6"
  version "0.1.1"
  depends_on "crystal-lang"

  def install
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
