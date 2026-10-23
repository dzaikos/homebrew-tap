cask "alt-tab" do
  version "11.10.1"
  sha256 "d9780cd6cdcf5cbaf2484a70c0cdfe049d3239e1198ae7a889c0e69e22eafb49"

  url "https://github.com/dzaikos/alt-tab-macos/releases/download/v#{version}/AltTab-#{version}.zip"
  name "AltTab"
  desc "Enable Windows-like alt-tab"
  homepage "https://github.com/dzaikos/alt-tab-macos"

  auto_updates false
  depends_on macos: :monterey

  app "AltTab.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/AltTab.app"]
  end

  caveats <<~EOS
    Upgrading alt-tab may result in permission issues. You can reset permissions manually:
      tccutil reset Accessibility com.lwouis.alt-tab-macos
      tccutil reset ScreenCapture com.lwouis.alt-tab-macos
  EOS

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
