cask "agentnotch" do
  version "1.1.0"
  sha256 "4b524d5bb220c63c4f36bf496098358fcfa2884804cae10fd023a265d3f44f80"

  url "https://github.com/AppGram/agentnotch/releases/download/v#{version}/AgentNotch.zip"
  name "AgentNotch"
  desc "Real-time AI coding assistant telemetry in your Mac's notch"
  homepage "https://github.com/AppGram/agentnotch"

  depends_on macos: ">= :sonoma"

  app "AgentNotch.app"

  zap trash: [
    "~/Library/Preferences/com.nedimfakic.AgentNotch.plist",
  ]
end
