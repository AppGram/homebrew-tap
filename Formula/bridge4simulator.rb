# typed: false
# frozen_string_literal: true

class Bridge4simulator < Formula
  desc "iOS Simulator MCP Bridge for AI Agents"
  homepage "https://github.com/appgram/bridge4simulator"
  version "1.0.2"
  license "MIT"

  # Skip ad-hoc signing for pre-signed frameworks in libexec
  skip_clean "libexec"

  on_macos do
    on_arm do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.2/bridge4simulator-darwin-arm64.zip"
      sha256 "cd62e298bfb2e4cd04d85cb36628cc2137701b309c26d72bde18d0dc97b0672b"
    end

    on_intel do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.2/bridge4simulator-darwin-amd64.zip"
      sha256 "c97752f963b3ab230068259c76ebf7989d336fa693fa0ef6924d2da3e4ed6a60"
    end
  end

  def install
    bin.install "bridge4simulator"
    bin.install "ocr" if File.exist?("ocr")
    # Install bundled tools (axe and Frameworks)
    if File.directory?("tools")
      (libexec/"tools").install Dir["tools/*"]
    end
  end

  def caveats
    <<~EOS
      To use bridge4simulator as an MCP server, run:
        bridge4simulator mcp

      For Claude Desktop, add to your config:
        {
          "mcpServers": {
            "bridge4simulator": {
              "command": "#{HOMEBREW_PREFIX}/bin/bridge4simulator",
              "args": ["mcp"]
            }
          }
        }
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bridge4simulator --version")
  end
end
