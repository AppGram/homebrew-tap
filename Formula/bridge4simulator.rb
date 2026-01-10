# typed: false
# frozen_string_literal: true

class Bridge4simulator < Formula
  desc "iOS Simulator MCP Bridge for AI Agents"
  homepage "https://github.com/appgram/bridge4simulator"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.0/bridge4simulator-darwin-arm64.zip"
      sha256 "f3c283cb5912faf0022b9c8406bf5a5e9b2c98f51e41b2a2c56a5ac34db66310"
    end

    on_intel do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.0/bridge4simulator-darwin-amd64.zip"
      sha256 "f178f238c687376137e25135c3a599841fa4999559b21c1990df885653ada2e3"
    end
  end

  def install
    bin.install "bridge4simulator"
    bin.install "ocr" if File.exist?("ocr")
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
