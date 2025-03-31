class Celerbuild < Formula
  desc "A lightweight, self-hosted deployment system for individuals and teams"
  homepage "https://celerbuild.com"
  version "0.8.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/celerbuild/download/refs/heads/main/celerbuild-0.8.8-darwin-arm64.tar.gz"
      sha256 "ced9d5cd65659b10c9933050623085083dd96808a0cab6b58a41e9b0aa01ccf2"
    else
      url "https://raw.githubusercontent.com/celerbuild/download/refs/heads/main/celerbuild-0.8.8-darwin-amd64.tar.gz"
      sha256 "e2f606cbf9028b3f717f07d2e690ce372200c72bfccecaadfa32d239151359f2"
    end
  end

  def install
    celerbuild_file = Dir["celerbuild-*"].first
    mv celerbuild_file, "celerbuild"
    bin.install "celerbuild"

    # Creating a configuration Directory
    (etc/"celerbuild").mkpath

    # Create log directory
    (var/"log/celerbuild").mkpath
  end

  service do
    run [opt_bin/"celerbuild"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/celerbuild/celerbuild.log"
    error_log_path var/"log/celerbuild/error.log"

    # Setting environment variables
    environment_variables PATH: std_service_path_env
  end

  test do
    system "#{bin}/celerbuild", "-version"
  end
end