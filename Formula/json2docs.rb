# typed: false
# frozen_string_literal: true

class Json2docs < Formula
  desc "Convert docc2json SDK output into Markdown/MDX documentation files"
  homepage "https://github.com/AppGram/docc2json"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AppGram/docc2json/releases/download/v1.2.0/json2docs_1.2.0_darwin_arm64.tar.gz"
      sha256 "3f07df4f0351367795107f087b9feebfb67ee4e89843bcedffbd352680a5a4ff"

      def install
        bin.install "json2docs-darwin-arm64" => "json2docs"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AppGram/docc2json/releases/download/v1.2.0/json2docs_1.2.0_darwin_amd64.tar.gz"
      sha256 "d7796cd35d24da9aa2ecfbabb92ed369bdfe087fc4e931ca6fe527092313cfe4"

      def install
        bin.install "json2docs-darwin-amd64" => "json2docs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AppGram/docc2json/releases/download/v1.2.0/json2docs_1.2.0_linux_arm64.tar.gz"
      sha256 "893f9aa45b7b3fb25278db9a0bb6ee8ffdf771e56095cda20ddb50c4a43359b6"

      def install
        bin.install "json2docs-linux-arm64" => "json2docs"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AppGram/docc2json/releases/download/v1.2.0/json2docs_1.2.0_linux_amd64.tar.gz"
      sha256 "607e772e69d961217c717f528101b20afd9cb4de9fccfb797af2f1289f82a8d3"

      def install
        bin.install "json2docs-linux-amd64" => "json2docs"
      end
    end
  end

  test do
    assert_match "json2docs", shell_output("#{bin}/json2docs --help 2>&1")
  end
end
