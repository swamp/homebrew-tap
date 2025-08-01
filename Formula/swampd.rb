class SwampD < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.1"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
			sha256 ""
		end

		on_intel do
			url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
			sha256 ""
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
