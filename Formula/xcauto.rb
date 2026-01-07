class Xcauto < Formula
  desc "MCP server for iOS development automation"
  homepage "https://github.com/appgram/xcauto"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://api.github.com/repos/AppGram/xcauto/releases/assets/337456805",
          headers: ["Accept: application/octet-stream",
                   "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}"]
      sha256 "dca7fe3b5ffe5f69a2b062457b9675837f0d4319efcf1edb0e92894e3e837cfa"
    end
    on_intel do
      url "https://api.github.com/repos/AppGram/xcauto/releases/assets/337456806",
          headers: ["Accept: application/octet-stream",
                   "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}"]
      sha256 "f9ae67b38cca74b83d1a1a304704bc4208fa3e5471bd6a24ffaea5671158b2a0"
    end
  end

  depends_on :macos
  depends_on macos: :ventura

  def install
    bin.install "bridge4simulator-xcauto" => "xcauto"
    bin.install "ocr"
    (lib/"xcauto").install "tools"
  end

  def caveats
    <<~EOS
      xcauto is from a private repository.
      Ensure HOMEBREW_GITHUB_API_TOKEN is set with repo access:

        export HOMEBREW_GITHUB_API_TOKEN=<your-github-token>

      Run setup after installation:

        xcauto setup

      Configure for Claude Desktop by adding to:
        ~/Library/Application Support/Claude/claude_desktop_config.json

        {
          "mcpServers": {
            "xcauto": {
              "command": "#{bin}/xcauto",
              "args": ["mcp"]
            }
          }
        }
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcauto --version")
  end
end
