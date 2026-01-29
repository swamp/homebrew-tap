class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.5"

  on_linux do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-aarch64.tar.gz"
      sha256 "3af9853f52b071ef8d42bee6bd771d7532c0093e5405963821fe798ebfe4cfb8"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-x86_64.tar.gz"
      sha256 "c83f6970ab3204839d14325165911e6bb6176f8fc23417915b228be30e43957d"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-arm64.tar.gz"
      sha256 "046b8ffca2c2d2765e4bc41a03be764ede7c6d794cc9d2d110cd3122105a8642"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-x86_64.tar.gz"
      sha256 "9fd9f6c1b17eda0030c694bb4b83d7c36f7d52ae7c24856b35286ad8b37044a3"
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
