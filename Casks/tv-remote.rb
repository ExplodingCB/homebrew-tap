cask "tv-remote" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/ExplodingCB/tv-remote/releases/download/v#{version}/TV-Remote-#{version}.zip"
  name "TV Remote"
  desc "Siri Remote-style controller for Apple TV"
  homepage "https://github.com/ExplodingCB/tv-remote"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  # Sets up the private Python environment that runs pyatv on first launch.
  depends_on formula: "uv"

  app "TV Remote.app"

  # The app is ad-hoc signed (no paid Apple Developer account), so it is not notarized.
  # Clear the quarantine flag Homebrew's download picked up, or macOS refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TV Remote.app"],
                   sudo: false
  end

  uninstall quit: "com.chaseculbertson.tvremote"

  zap trash: [
    "~/Library/Application Support/TV Remote",
    "~/Library/Preferences/com.chaseculbertson.tvremote.plist",
    "~/Library/Saved Application State/com.chaseculbertson.tvremote.savedState",
  ]

  caveats <<~EOS
    On first launch TV Remote spends a few seconds setting up its Apple TV
    support in ~/Library/Application Support/TV Remote. Allow Local Network
    access when macOS asks, then pick your Apple TV and enter the code it shows.
  EOS
end
