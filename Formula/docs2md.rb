class Docs2md < Formula
  desc "Fetch, clean, and optimize HTML documentation for LLM usage"
  homepage "https://github.com/AppGram/docs2md"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-arm64.tar.gz"
      sha256 "fca0b6fc2c8d9ac5bd324f69f420055220a0992c910cc80af19a957f54991c22"
    elsif Hardware::CPU.intel?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-x64.tar.gz"
      sha256 "4f70de8c69efdcf9a19008a182c0087543bf0adacf4d0f5fcf7001a0f17483a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-linux-arm64.tar.gz"
      sha256 "a34abedc84daac6b257e3541704611581c782ed70d6a3e1685681b68b616e196"
    elsif Hardware::CPU.intel?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-linux-x64.tar.gz"
      sha256 "a2b1c2075e8b9beb277b4f798656af30047cb3775195c9a03fb95cc1dbaf552f"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "docs2md-darwin-arm64" => "docs2md"
      elsif Hardware::CPU.intel?
        bin.install "docs2md-darwin-x64" => "docs2md"
      end
    elsif OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "docs2md-linux-arm64" => "docs2md"
      elsif Hardware::CPU.intel?
        bin.install "docs2md-linux-x64" => "docs2md"
      end
    end
  end

  test do
    assert_match "docs2md", shell_output("#{bin}/docs2md --version").strip
  end
end
