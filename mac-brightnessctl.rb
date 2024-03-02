class MacBrightnessctl < Formula
  desc "CLI tool for controlling keyboard backlight brightness on Mac"
  homepage "https://github.com/rakalex/mac-brightnessctl"
  url "https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/0.1.tar.gz"
  sha256 "d1e9e3fa81af7d3ff566953e5f42ccad384457c63285996cda7aa14a0c1688d0"
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
