class Swampd < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.7"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-arm64.tar.gz"
			sha256 "07761ba7a2b745c694ddf22df5a01201e3bdca87b8bdaf7272f1664de3732bbd"
		end

		on_intel do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-x86_64.tar.gz"
			sha256 "5082badf4edb3065cf079882aa6a566918227034a74a1c9059447cd5fc81256f"
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
