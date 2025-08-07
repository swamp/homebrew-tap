class Swampd < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.3"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-arm64.tar.gz"
			sha256 "f1ae32a520e0a707161d7e54e530c9f6b3dfdcc21120e8459b637d8ecdd823ac"
		end

		on_intel do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-x86_64.tar.gz"
			sha256 "a6bada23a89fcb6e9dedfb387f3c779f90d86d600f1b3114bb0fd7554d3a20ad"
		end
	end

  def install
  	bin.install "swampd" #Dir["swampd"]

		# Remove any quarantine extended attribute so the binaries can run on macOS. Sad that you have to do this.
		system "xattr", "-cr", bin/"swampd"
  end


	test do
    assert_match "swampd", shell_output("#{bin}/swampd --help")
  end

end
