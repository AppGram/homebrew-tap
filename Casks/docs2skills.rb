cask "docs2skills" do
  version "0.1.0"

  on_arm do
    sha256 "5e7f827b9a419d497e998aeb5c82b5fb029c0b09eaa989f109ac08abc21c4355"
    url "https://github.com/AppGram/doc2skills/releases/download/v#{version}/docs2skills_#{version}_arm64.dmg"
  end

  on_intel do
    sha256 :no_check
    url "https://github.com/AppGram/doc2skills/releases/download/v#{version}/docs2skills_#{version}_x64.dmg"
  end

  name "docs2skills"
  desc "Transform documentation into AI-optimized skills"
  homepage "https://docs2skills.com"

  app "docs2skills.app"

  binary "#{appdir}/docs2skills.app/Contents/Resources/bin/docs2md", target: "docs2skills"

  postflight do
    system_command "/opt/homebrew/bin/npm", args: ["install", "-g", "playwright", "--force"], sudo: false rescue nil
    system_command "/opt/homebrew/bin/npx", args: ["playwright", "install", "chromium"], sudo: false rescue nil
  end

  zap trash: [
    "~/Library/Application Support/docs2skills",
    "~/Library/Caches/docs2skills",
    "~/Library/Preferences/com.appgram.docs2skills.plist",
    "~/.config/docs2skills",
  ]

  caveats <<~EOS
    After installation, authenticate with your license key:
      docs2skills auth ds_your_license_key

    Get a license at https://docs2skills.com
  EOS
end
