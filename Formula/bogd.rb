class Bogd < Formula
  desc "Bogd server"
  homepage "https://github.com/bogd-32/bogd"

  version "0.0.1"

  on_macos do
    on_arm do
      url "https://bogd.net/download/bogd-#{version}-macos-arm64.tar.gz"
      sha256 "1b9826d91738e25cc60bfbe6351917958e6313b936c1bd5fbc29047fec20b573"
    end

    on_intel do
      url "https://bogd.net/download/bogd-#{version}-macos-x86_64.tar.gz"
      sha256 "642ce0b2b8c2d76c74e38f1961d607f464ab4445786c2206e357b4ff695dfab7"
    end
  end

  on_linux do
    on_intel do
      url "https://bogd.net/download/bogd-#{version}-linux-x86_64.tar.gz"
      sha256 "8a3e64540cbb0003370eebe3d5eb175f1f02ac3b459d9177e06f6cebf1a4f66b"
    end
  end

def install
    os = OS.mac? ? "macos" : "linux"

    arch = Hardware::CPU.arm? ? (OS.mac? ? "arm64" : "aarch64") : "x86_64"

    bin.install "bogd-#{os}-#{arch}" => "bogd"
  end

  #test do
    # verify the version of the binary
  #  assert_match "bogd v#{version}", shell_output("#{bin}/bogd help")
  #end
end