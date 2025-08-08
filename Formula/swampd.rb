class Swampd < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.4"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-arm64.tar.gz"
			sha256 "4516b8ee9ac51c1f5b87796374bc034bfac7743782fcbddcffce21a94211d406"
		end

		on_intel do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-x86_64.tar.gz"
			sha256 "0c32f772cf4e0a1086ef5d84ddcad3684328702544de198bc3dc15fa1f4bb26f"
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
