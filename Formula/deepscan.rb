class Deepscan < Formula
  desc "Fast macOS disk forensics — reclaimable space + leak detection"
  homepage "https://github.com/OmenDilly/deepscan"
  url "https://github.com/OmenDilly/deepscan/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "ab8f9f35e00ce3713bc4e95cd2fedfd1decb966ed458d36c3aeb42ecf1d19e90"
  license "MIT"
  head "https://github.com/OmenDilly/deepscan.git", branch: "main"

  depends_on "rust" => :build

  def install
    # rust-toolchain.toml pins an exact version for CI reproducibility, but
    # Homebrew provides its own rust — drop the pin and build with that.
    (buildpath/"rust-toolchain.toml").unlink
    system "cargo", "install", *std_cargo_args(path: "crates/deepscan-cli")
  end

  test do
    assert_match "deepscan", shell_output("#{bin}/deepscan --version")
  end
end
