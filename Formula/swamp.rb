class Swamp < Formula
  desc "Swamp (Unsigned)"
  homepage "https://github.com/swamp/swamp"
  version "0.2.3"

	on_arm do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
    sha256 "ef7a687776179628a9d4995268ceb6e43c5dc04473a07f5984b64165758f3af2"
  end

  on_intel do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
    sha256 "990eaac3a9e7b3c3c7e6aa1785526cd598543c20e4dc75f4d1f05de3605c51d6"
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
