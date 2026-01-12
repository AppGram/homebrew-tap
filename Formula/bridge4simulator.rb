# typed: false
# frozen_string_literal: true

class Bridge4simulator < Formula
  desc "iOS Simulator MCP Bridge for AI Agents"
  homepage "https://github.com/appgram/bridge4simulator"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.1/bridge4simulator-darwin-arm64.zip"
      sha256 "5453f07c2932163fa572fa02ff2608c2c6a3b9d1afcae63636c09a09e77c3bb2"
    end

    on_intel do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.1/bridge4simulator-darwin-amd64.zip"
      sha256 "526a98287c48789464ec1e4e5803b53a14e3d899e710a9439f1f502a4061a3f7"
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
