class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.11"

  on_linux do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-aarch64.tar.gz"
      sha256 "3168f39355e7d9dcd0591fec7923de00c6c3a3dd9f1909c06770ec0ea52dadbc"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-x86_64.tar.gz"
      sha256 "37f8609993266edb75c24e66efde9da53413db4ca64234b1b2b48d09f7bb34df"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-arm64.tar.gz"
      sha256 "41da414011ff83d57ddd1ab1fb3b2663785d7d0f49f40b29465ca6384c5c3764"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-x86_64.tar.gz"
      sha256 "7a7136650dc5c537e981b6f639bd0d0d959483aeefd34757a1c6182b7b5f556f"
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
