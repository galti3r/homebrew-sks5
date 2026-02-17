class Sks5 < Formula
  desc "Lightweight SSH server with SOCKS5 proxy, shell emulation, and ACL"
  homepage "https://github.com/galti3r/sks5"
  url "https://github.com/galti3r/sks5/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "c65bfa6e9cbef506fd05de8295d043a5134d94d643e0c6b188efe458ab222616"
  license "MIT"
  head "https://github.com/galti3r/sks5.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    generate_completions_from_executable(bin/"sks5", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sks5 --version")
  end
end
