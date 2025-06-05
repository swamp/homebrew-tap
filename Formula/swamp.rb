class Swamp < Formula
  desc "Swamp (Unsigned)"
  homepage "https://github.com/swamp/swamp"
  version "0.1.17-alpha.1"

	on_arm do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
    sha256 "e6eb67db8430046b91c37768bc808108c0b98c6ae25aad96fc827025b9697c63"
  end

  on_intel do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
    sha256 "4843400d1942f418af265f2764999dc85cc14321be1d34a770cab0290ff4e2f6"
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
