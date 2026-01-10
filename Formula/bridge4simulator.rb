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
      sha256 "a313875a8490e9e57231604d4eb65486ab78a4bc26901e706488962e413dd3b3"
    end

    on_intel do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.0/bridge4simulator-darwin-amd64.zip"
      sha256 "57b6c2f915833e7122b9a4b43e3fdc6f1c3618253f121f89bbf95edf541fa3f5"
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
