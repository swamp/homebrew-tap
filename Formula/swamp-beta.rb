class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.6"

  on_linux do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-aarch64.tar.gz"
      sha256 "fb1870bea63f9692d79b66bf55951b6df2b4a6ed495171a5d172016ef92bb835"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-linux-x86_64.tar.gz"
      sha256 "a64faae72b761a538a633aa37f85623bdfec90020f928bc950e9f00d4b44e8be"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-arm64.tar.gz"
      sha256 "226291ac045b386515b3a2605ace714f966d21a37b635bf3bbb4ea308a54828b"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos-x86_64.tar.gz"
      sha256 "ce6d4034cd76380974717521d5b48f13344bd9f954f2a1297f31eb90598841a2"
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
