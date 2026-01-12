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
      sha256 "d489a1019bf6a86a8b4b8cc6703873193687dc32314ba721b2fcb40bd197711d"
    end

    on_intel do
      url "https://github.com/appgram/bridge4simulator/releases/download/v1.0.0/bridge4simulator-darwin-amd64.zip"
      sha256 "d36259b946ea5dc86ccc83e591c1e13eddd470a750d79d619a9a572b0857046b"
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
