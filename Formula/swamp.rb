class Swamp < Formula
  desc "Swamp (Unsigned)"
  homepage "https://github.com/swamp/swamp"
  version "0.1.17-alpha.15"

	on_arm do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-arm64.tar.gz"
    sha256 "7526a09919ad8f7c8b0703afb3345320ec0ea92b8c81438bbfc45909635802ab"
  end

  on_intel do
    url "https://github.com/swamp/swamp/releases/download/v#{version}/swamp-darwin-x86_64.tar.gz"
    sha256 "94debafe3fed555e65ed82a8978068b84c0c17e882abfcc252f60c5c97b239be"
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
