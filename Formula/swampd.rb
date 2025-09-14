class Swampd < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.8"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-arm64.tar.gz"
			sha256 "cb7d308156a68fd3aebb34203dd73795d8dba07c08fa4b2dfc460c0eb73ae0ec"
		end

		on_intel do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-x86_64.tar.gz"
			sha256 "b2308ed2b6e1ba1682c3175de17f701838ca13220f67f68c20e7148a76bc322f"
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
