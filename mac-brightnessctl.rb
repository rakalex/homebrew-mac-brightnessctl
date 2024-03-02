class MacBrightnessctl < Formula
  desc "CLI tool for controlling keyboard backlight brightness on Mac"
  homepage "https://github.com/rakalex/mac-brightnessctl"
  url "https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/0.2.1.tar.gz"
  sha256 "b9445cca0e24c5f42c85e975ea124164edadf460421263d63ee06c6f68507aa7"
  license "MIT"
  head "https://github.com/rakalex/mac-brightnessctl.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
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
