class Docs2md < Formula
  desc "Fetch, clean, and optimize HTML documentation for LLM usage"
  homepage "https://github.com/AppGram/docs2md"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-macos-arm64"
      sha256 "122a13691903c046948698fb2ea1b72f693dc104a2e5c75f638804563c3f787d"
    elsif Hardware::CPU.intel?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-macos-x64"
      sha256 "0481c0843020411498424651ae7ca42a6206ff7afa9d0dbebb9b0a2c6f150e6e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.arm64?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-linux-arm64"
      sha256 "55e55133a3d4f575dec50b41e50f9ecf5c0d53d02e0666462f378e91922d937f"
    elsif Hardware::CPU.intel? || Hardware::CPU.amd64?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-linux-x64"
      sha256 "2c0bfab48e6af111cdabde507f09ec0ca818738afcadc44b735a665dee8a8723"
    end
  end
  
  def install
    bin.install "docs2md-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}" => "docs2md"
  end
  
  test do
    assert_match "docs2md", shell_output("#{bin}/docs2md --version")
  end
end
