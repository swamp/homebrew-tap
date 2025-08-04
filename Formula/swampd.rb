class Swampd < Formula
  desc "Swampd (Unsigned)"
  homepage "https://github.com/swamp/swampd"
  version "0.0.2"

	on_macos do
		on_arm do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-arm64.tar.gz"
			sha256 "d0a788d2f101b0bef5a22bf9aaf104c8827ad4cfd41b4e290bbf5effab261b04"
		end

		on_intel do
			url "https://github.com/swamp/swampd/releases/download/v#{version}/swampd-darwin-x86_64.tar.gz"
			sha256 "5b08da6eb3bfcde09751d856aad0cf2f78417d273e76710db994174ee7e4f166"
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
