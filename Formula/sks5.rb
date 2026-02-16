class Sks5 < Formula
  desc "Lightweight SSH server with SOCKS5 proxy, shell emulation, and ACL"
  homepage "https://github.com/galti3r/sks5"
  url "https://github.com/galti3r/sks5/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "ad1e776f50d9abf6efad63447f70748c7926c95df8945aac02696d0c7403b6ff"
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
