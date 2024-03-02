class MacBrightnessctl < Formula
  desc "CLI tool for controlling keyboard backlight brightness on Mac"
  homepage "https://github.com/rakalex/mac-brightnessctl"
  url "https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/0.1.tar.gz"
  sha256 "dd6a7a7b0e5d6a06ecdc7d47b038b307b6a3228d9d2271cabd9c273220d19850"
  license "MIT"
  head "https://github.com/rakalex/mac-brightnessctl.git", branch: "main"

  livecheck do
    url :stable
    regex(/^mac-brightnessctl[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?
      
      match[1]
    end
  end

  livecheck do
    url "https://github.com/rakalex/mac-brightnessctl.git"
    regex(/^(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  def install
    system "make"
    bin.install "mac-brightnessctl"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mac-brightnessctl --help")
  end
end