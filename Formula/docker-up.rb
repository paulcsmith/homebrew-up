class DockerUp < Formula
  desc "Tool for local developement with Docker"
  homepage "http://github.com/paulcsmith/up"
  url "https://github.com/paulcsmith/homebrew-up/raw/master/tarballs/docker-up-0.1.7.tar.gz"
  sha256 "ccd66312180e5999d368cb4b24e193695e76fd1c0f70087371fbc408fca41f9c"
  version "0.1.7"
  depends_on "crystal-lang"

  def install
    system "crystal build lib/up/src/run.cr -o up"
    bin.install "up"
  end

  test do
    system "{bin}/up", "--help"
  end
end
