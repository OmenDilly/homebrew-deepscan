class Deepscan < Formula
  desc "Fast macOS disk forensics — reclaimable space + leak detection"
  homepage "https://github.com/OmenDilly/deepscan"
  url "https://github.com/OmenDilly/deepscan/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "0c2ac30d62bdb02d344445be12f67724c7f90e9a166f16e2bafa1081a983d0f5"
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
