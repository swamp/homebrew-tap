class Swamp < Formula
  desc "Swamp (Unsigned)"
  homepage "https://github.com/swamp/swamp"
  version "0.1.17-alpha.9"

	on_arm do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
    sha256 "1eb5516af1f7b66dd393027fbb791992b6f4170d80a016c69738f3209d75d057"
  end

  on_intel do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
    sha256 "f8dea1f763139c39aca73d6614bcd2a7a5803ccff0cffb3baba45aa4cc48d8b7"
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
