class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.8"

  on_linux do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-aarch64.tar.gz"
      sha256 "753755b2a94aa7a022c677f0bf81fa08c6991a6cd6610181841751a82874326c"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-x86_64.tar.gz"
      sha256 "46040112e26a32a0919d911cf5db9f617ded89174c4c2c53512aa3ad1d4cef0b"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-arm64.tar.gz"
      sha256 "fa6d44280e9cf9e4ae89a9c1c154d8ffc525319b360da76fa8ad8baa9919e153"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-x86_64.tar.gz"
      sha256 "1cb4821916d6c2474fe4904f447f6478c90501f21f189cd6fe12485d4ebd3fad"
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
