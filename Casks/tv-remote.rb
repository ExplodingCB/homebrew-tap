cask "tv-remote" do
  version "1.0.1"
  sha256 "049a5909b1f03bf4017ae2f06ce9f5cfb03c967d415b84824a1585b393ed0610"

  url "https://github.com/ExplodingCB/tv-remote/releases/download/v#{version}/TV-Remote-#{version}.zip"
  name "TV Remote"
  desc "Siri Remote-style controller for Apple TV"
  homepage "https://github.com/ExplodingCB/tv-remote"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Sets up the private Python environment that runs pyatv on first launch.
  depends_on formula: "uv"
  depends_on macos: :sequoia

  app "TV Remote.app"

  # The app is ad-hoc signed (no paid Apple Developer account), so it is not notarized.
  # Clear the quarantine flag Homebrew's download picked up, or macOS refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/TV Remote.app"],
        writable_paths: ["TV Remote.app"],
        writable_base:  :appdir
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
