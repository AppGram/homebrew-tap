class Docs2md < Formula
  desc "Fetch, clean, and optimize HTML documentation for LLM usage"
  homepage "https://github.com/AppGram/docs2md"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-arm64"
      sha256 "94b27dd15e3db549eab007ffede5dddfd60ee64807249d09d275a11d9d5e0561"
    elsif Hardware::CPU.intel?
      url "https://github.com/AppGram/docs2md/releases/download/v1.0.0/docs2md-darwin-x64"
      sha256 "7da02aa51f7909108f3301588615a48f1932850c8842686dd3de6e169c7aa92e"
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
