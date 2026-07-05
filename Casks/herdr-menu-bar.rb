cask "herdr-menu-bar" do
  version "0.1.0"
  sha256 "10e88c989d505ed516bec936591b1b04f9f92569368a1ac0c03b5950c2ad229f"

  url "https://github.com/npenkov/herdr-menu-bar/releases/download/v#{version}/herdr-menu-bar-#{version}.zip"
  name "herdr menubar"
  desc "Menu-bar app showing the status of AI agents running in herdr"
  homepage "https://github.com/npenkov/herdr-menu-bar"

  depends_on macos: :ventura

  app "herdr-menu-bar.app"

  caveats <<~EOS
    herdr-menu-bar is ad-hoc signed, not notarized. On first launch macOS will warn
    about an unidentified developer. Either right-click the app in /Applications and
    choose "Open", or clear the quarantine attribute after installing:

      xattr -dr com.apple.quarantine "#{appdir}/herdr-menu-bar.app"

    Requires herdr (https://herdr.dev) — default path /opt/homebrew/bin/herdr,
    override with the HERDR_BIN environment variable.
  EOS
end
