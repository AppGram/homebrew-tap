cask "docs2skills" do
  version "0.1.0"
  sha256 "b5d4bf09ae739083b3187ef2b8b544df25f8ac36a9e046d664e2c10b84dc8270"

  url "https://github.com/AppGram/doc2skills/releases/download/v#{version}/docs2skills_#{version}_aarch64.dmg"
  name "docs2skills"
  desc "Convert documentation into AI-ready skills"
  homepage "https://docs2skills.com"

  depends_on macos: ">= :big_sur"

  app "docs2skills.app"

  postflight do
    # Install Playwright Chromium browser (required for JS-rendered pages)
    system_command "/usr/bin/env",
                   args: ["npx", "-y", "playwright", "install", "chromium"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/docs2skills",
    "~/.docs2skills",
  ]

  caveats <<~EOS
    docs2skills requires Playwright Chromium for JavaScript-rendered pages.
    It will be installed automatically, or you can install manually:
      npx playwright install chromium

    You'll need a license key to use the app.
    Get one at: https://docs2skills.com
  EOS
end
