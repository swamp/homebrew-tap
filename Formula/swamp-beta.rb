class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.12"

  on_linux do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-aarch64.tar.gz"
      sha256 "354a2d8aed725dd1376808ac053ad430b859de551461e2c2d330abf76aa10f0b"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-x86_64.tar.gz"
      sha256 "0c1d8ecfd7c501e9991451af3ce44b5b8ad2763eb2556313a0b3df6808fdc9b9"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-arm64.tar.gz"
      sha256 "951ee746caeec9ad9e185bdeef9b34bd0542ed953f8f0d430d9a6a00fbcf8090"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-x86_64.tar.gz"
      sha256 "cd1a3f03087a0d4a7c053bdd63a56b11c0bf97de34ab6598eea68508016344be"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"

    arch = Hardware::CPU.arm? ? (OS.mac? ? "arm64" : "aarch64") : "x86_64"

    # version is not part of the executable inside the .tar.gz
    binary_name = "swamp-#{os}-#{arch}"

    bin.install binary_name => "swamp-beta"
  end

  test do
    # verify the version of the binary
    assert_match "Swamp v#{version}", shell_output("#{bin}/swamp-beta help")
  end
end
