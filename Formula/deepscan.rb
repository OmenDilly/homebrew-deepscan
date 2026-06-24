class Deepscan < Formula
  desc "Fast macOS disk forensics — reclaimable space + leak detection"
  homepage "https://github.com/OmenDilly/deepscan"
  url "https://github.com/OmenDilly/deepscan/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "f1591bed939a8ce8dd42f05efe9a8b52f6e00fd80bc60b23c3bb5144fdbcf846"
  license "MIT"
  head "https://github.com/OmenDilly/deepscan.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/deepscan-cli")
  end

  test do
    assert_match "deepscan", shell_output("#{bin}/deepscan --version")
  end
end
