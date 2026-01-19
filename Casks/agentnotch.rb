cask "agentnotch" do
  version "1.1.2"
  sha256 "d5ef71d5632065bca4a42dfe005b8bf1991b2b01b077c53b007e13d375c4541c"

  url "https://github.com/AppGram/agentnotch/releases/download/v1.1.2/AgentNotch.zip"
  name "AgentNotch"
  desc "macOS menu bar app for AI coding assistant telemetry"
  homepage "https://github.com/AppGram/agentnotch"

  depends_on macos: ">= :ventura"

  app "AgentNotch.app"

  zap trash: [
    "~/Library/Preferences/com.appgram.AgentNotch.plist",
    "~/Library/Application Support/AgentNotch",
  ]
end
