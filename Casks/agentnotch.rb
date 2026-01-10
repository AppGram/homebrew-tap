cask "agentnotch" do
  version "1.1.1"
  sha256 "6a5c0bf8ed6dd2fac018d02b584e3d7f53bac9fd61c3794d1fdccad665c63708"

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
