class MacBrightnessctl < Formula
  desc "CLI tool for controlling keyboard backlight brightness on Mac"
  homepage "https://github.com/rakalex/mac-brightnessctl"
  url "https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/0.2.tar.gz"
  sha256 "635d88c2e07a4f08ce90d518a352af80042edd95d746920556098816b4a06304"
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
