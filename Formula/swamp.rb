class Swamp < Formula
  desc "Swamp (Unsigned)"
  homepage "https://github.com/swamp/swamp"
  version "0.1.17-alpha.14"

	on_arm do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
    sha256 "396b900e074737e713938e55faa55e35ea9a0916330e788d1388354c32686540"
  end

  on_intel do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
    sha256 "4d2ba01e3ea8dc21955f0fa0596c778f6fb18d055bc7e810dc3678ca6a2af9c7"
  end

  def install
  	bin.install Dir["swamp-*"]

		# Remove any quarantine extended attribute so the binaries can run on macOS. Sad that you have to do this.
		system "xattr", "-cr", prefix
  end


	test do
    assert_match "swamp-build", shell_output("#{bin}/swamp-build --help")
    assert_match "swamp-test",  shell_output("#{bin}/swamp-test --help")
  end

end
