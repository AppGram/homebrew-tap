cask "agentnotch" do
  version "1.1.1"
  sha256 "b682716958817189fa86c8026b0cffafceef5d34c0871f465fcb6f4910576dcc"

  url "https://github.com/AppGram/agentnotch/releases/download/v1.1.1/AgentNotch.zip"
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
