class Bogd < Formula
  desc "Bogd server"
  homepage "https://github.com/bogd-32/bogd"

  version "0.0.2"

  on_linux do
    on_intel do
      url "https://bogd.net/download/bogd-#{version}-linux-x86_64.tar.gz"
      sha256 "3f8e9c014659c87f741bfa3b1fb5f6dc9cbffbeecbba4809946d8c68dc39be6c"
    end
  end

  on_macos do
    on_arm do
      url "https://bogd.net/download/bogd-#{version}-macos-arm64.tar.gz"
      sha256 "b32d6cb26363e815a50d298ca8a223d653c800c704dac3c51ab5f5a7b45b23da"
    end

    on_intel do
      url "https://bogd.net/download/bogd-#{version}-macos-x86_64.tar.gz"
      sha256 "b8182f3952cefecc52d4aa59e33742e97f29c52abb2bd818b055ab557a63bd96"
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