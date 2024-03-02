class MacBrightnessctl < Formula
  desc "CLI tool for controlling keyboard backlight brightness on Mac"
  homepage "https://github.com/rakalex/mac-brightnessctl"
  url "https://github.com/rakalex/mac-brightnessctl/archive/refs/tags/0.2.tar.gz"
  sha256 "5ee54f6e89137068d6dca472b4247d8bbc30b449a31b95329f51b4511436f565"
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
