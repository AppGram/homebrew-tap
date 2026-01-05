cask "agentnotch" do
  version "1.0.0"
  sha256 "df9c424ef4ace053b92b2ae8b4ef4578c571a93b8576dcfeeae481b4c9b67bc4"

  url "https://github.com/AppGram/agentnotch/releases/download/v#{version}/AgentNotch-#{version}.zip"
  name "AgentNotch"
  desc "Real-time AI coding assistant telemetry in your Mac's notch"
  homepage "https://github.com/AppGram/agentnotch"

  depends_on macos: ">= :sonoma"

  app "AgentNotch.app"

  zap trash: [
    "~/Library/Preferences/com.xcbuildassistent.agentnotch.plist",
  ]
end
