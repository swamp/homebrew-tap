class SwampBeta < Formula
  desc "Swamp CLI"
  homepage "https://github.com/swamp/swamp"
  license "MIT"

  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos_arm64.tar.gz"
      sha256 "940a93dcc279880680e446f4279c52b2214845f12d7afaddecb6bf1b2d702c79"
    end

    on_intel do
      url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-#{version}-macos_x86_64.tar.gz"
      sha256 "48826aca30bdeb65c0404d567c4a094ea5599116f7111c2b5c2fc29059e76e9f"
    end
  end

  def install
    os_arch = Hardware::CPU.arm? ? "arm64" : "x86_64"

    # version is not part of the executable inside the .tar.gz
    binary_name = "swamp-macos_#{os_arch}"

    bin.install binary_name => "swamp"
  end

  test do
    # verify the version of the binary
    assert_match "Swamp v#{version}", shell_output("#{bin}/swamp help")
  end
end
