class Celerbuild < Formula
  desc "CelerBuild is a lightweight, self-hosted deployment system for individuals and teams."
  homepage "https://celerbuild.com"
  version "0.8.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/celerbuild/download/refs/heads/main/celerbuild-0.8.8-darwin-arm64.tar.gz"
      sha256 "a7d7d36f8614b530ba4b6d7e610bfce3945849a0faca8931d064a7827dbc5e86"
    else
      url "https://raw.githubusercontent.com/celerbuild/download/refs/heads/main/celerbuild-0.8.8-darwin-amd64.tar.gz"
      sha256 "4b919e8f20ed602c3ac3a4aa1d3e409022eb347d3914c1492a0e6e81d0ad9875"
    end
  end

    def install
      celerbuild_file = Dir["celerbuild-*"].first
      mv celerbuild_file, "celerbuild"
      bin.install "celerbuild"
    end

  test do
    system "#{bin}/celerbuild", "--version"
  end
end
