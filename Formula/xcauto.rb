class Xcauto < Formula
  desc "Native iOS Simulator automation tool for HID input and accessibility"
  homepage "https://github.com/appgram/xcauto"
  version "1.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://api.github.com/repos/AppGram/xcauto/releases/assets/337445771",
          headers: ["Accept: application/octet-stream",
                   "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}"],
          using: :nounzip
      sha256 "496e94a7ce256371dea9377bc38db4aba39f79367cc4bec635f05cc4fa59ed9c"
    end
  end

  depends_on :macos
  depends_on macos: :ventura

  def install
    system "tar", "-xzf", "xcauto-v1.2.1-darwin-arm64.tar.gz"
    bin.install "xcauto"
    (lib/"xcauto").install "Frameworks"
  end

  def caveats
    <<~EOS
      xcauto is from a private repository.
      Ensure HOMEBREW_GITHUB_API_TOKEN is set with repo access:

        export HOMEBREW_GITHUB_API_TOKEN=<your-github-token>

      To use xcauto, add the following to your shell profile:

        export DYLD_FRAMEWORK_PATH="#{lib}/xcauto/Frameworks:$DYLD_FRAMEWORK_PATH"

      Then restart your terminal or run:

        source ~/.zshrc  # or ~/.bashrc
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xcauto --version")
  end
end
