class Bogd < Formula
  desc "Bogd server"
  homepage "https://github.com/bogd-32/bogd"

  version "0.0.3"

  on_linux do
    on_arm do
      url "https://bogd.net/download/bogd-#{version}-linux-aarch64.tar.gz"
      sha256 "61afe1084a150415cab5f4f3894d4648e7d2b5c11852d097cb55c7e2bd43dd8b"
    end

    on_intel do
      url "https://bogd.net/download/bogd-#{version}-linux-x86_64.tar.gz"
      sha256 "30239a5f39947f7bd149aa21bef5f85fe38840da50b08e8100ef3004ab272ad6"
    end
  end

  on_macos do
    on_arm do
      url "https://bogd.net/download/bogd-#{version}-macos-arm64.tar.gz"
      sha256 "04d4edac770a9a2d4607326c1a7a83e8ffc72b2bae1684432a79f327079b4784"
    end

    on_intel do
      url "https://bogd.net/download/bogd-#{version}-macos-x86_64.tar.gz"
      sha256 "57d4a4aece50886aa7023a68098d1e587dbf3205cf17a967fc1a98e186ac650a"
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
