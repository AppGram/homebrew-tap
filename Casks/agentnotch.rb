cask "agentnotch" do
  version "1.0.0"
  sha256 "ae1f3c89df6fa1b225743bc1a64117f2917fbd1410c1b53a54e83465a82693df"

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
