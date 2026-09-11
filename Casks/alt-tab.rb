cask "alt-tab" do
  version "11.6.1"
  sha256 "e16953a66cb15e3e566b1988fe34909feae7136313090f8b96772f8cdd165ee6"

  url "https://github.com/dzaikos/alt-tab-macos/releases/download/v#{version}/AltTab-#{version}.zip"
  name "AltTab"
  desc "Enable Windows-like alt-tab"
  homepage "https://github.com/dzaikos/alt-tab-macos"

  auto_updates false
  depends_on :macos

  app "AltTab.app"

  postflight do
    system_command "tccutil", args: ["reset", "Accessibility", "com.lwouis.alt-tab-macos"], must_succeed: false
    system_command "tccutil", args: ["reset", "ScreenCapture", "com.lwouis.alt-tab-macos"], must_succeed: false
    system_command "sudo", args: ["xattr", "-cr", "#{appdir}/AltTab.app"], sudo: true
    system_command "open", args: ["#{appdir}/AltTab.app"]
  end

  uninstall quit: "com.lwouis.alt-tab-macos"

  zap trash: [
    "~/Library/Application Support/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.lwouis.alt-tab-macos",
    "~/Library/Cookies/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/LaunchAgents/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.license.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.usage.plist",
  ]
end
