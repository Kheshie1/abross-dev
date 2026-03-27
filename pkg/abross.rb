# Homebrew Formula for Abross AI Terminal
class Abross < Formula
  desc "Agentic Development Environment - AI-powered terminal"
  homepage "https://abross.dev"
  url "https://github.com/abross/abross-ai-terminal/archive/v1.0.0.tar.gz"
  sha256 "YOUR_SHA256_HERE"
  license "MIT"
  head "https://github.com/abross/abross-ai-terminal.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Abross AI Terminal", shell_output("#{bin}/abross --version")
  end
end
