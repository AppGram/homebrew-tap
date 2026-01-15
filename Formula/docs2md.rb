class Docs2md < Formula
  desc "Fetch, clean, and optimize HTML documentation for LLM usage"
  homepage "https://github.com/AppGram/docs2md"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-arm64.tar.gz"
      sha256 "62aebf61596ba899673ba76c018f3abaeabe4a66abf52bc8c63968e4692a9319"
    elsif Hardware::CPU.intel?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-x64.tar.gz"
      sha256 "7da02aa51f7909108f3301588615a48f1932850c8842686dd3de6e169c7aa92e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "docs2md-darwin-arm64" => "docs2md"
    elsif Hardware::CPU.intel?
      bin.install "docs2md-darwin-x64" => "docs2md"
    end
  end

  test do
    assert_match "docs2md", shell_output("#{bin}/docs2md --version").strip
  end
end
