cask "overterm" do
  version "1.6.3"
  sha256 "052d4bc95d2234d98821c6ca01f5aff8296b13b60860a3e809e03a6cc34cef82"

  url "https://github.com/Overcraft-hq/overterm/releases/download/v#{version}/Overterm-#{version}.dmg"
  name "Overterm"
  desc "Terminal for working with AI agents, built on libghostty"
  homepage "https://overterm.overcraft.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Overterm.app"

  zap trash: [
    "~/Library/Application Support/Overterm",
    "~/Library/Caches/io.github.overcraft-hq.overterm",
    "~/Library/HTTPStorages/io.github.overcraft-hq.overterm",
    "~/Library/Preferences/io.github.overcraft-hq.overterm.plist",
    "~/Library/Saved Application State/io.github.overcraft-hq.overterm.savedState",
    "~/Library/WebKit/io.github.overcraft-hq.overterm",
  ]

  caveats <<~EOS
    Overterm isn't notarized yet. The first time, open it with
    right-click → Open (macOS 15: System Settings → Privacy & Security →
    Open Anyway), or run:
      xattr -dr com.apple.quarantine #{appdir}/Overterm.app
  EOS
end
