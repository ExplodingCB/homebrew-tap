cask "atoll-efficient" do
  version "2.3.3-e1"
  sha256 "4ddc1a77b4f31de5c5af93f1d0c2c82a102f7130fe2e122b1c7b3be3e0eb2020"

  url "https://github.com/ExplodingCB/atoll-efficient/releases/download/v#{version}/Atoll-Efficient-#{version}.zip"
  name "Atoll Efficient"
  desc "Lower-power, lower-memory fork of the Atoll notch app"
  homepage "https://github.com/ExplodingCB/atoll-efficient"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+-e\d+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Atoll Efficient.app"

  # The app is ad-hoc signed (no paid Apple Developer account), so it is not notarized.
  # Clear the quarantine flag Homebrew's download picked up, or macOS refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Atoll Efficient.app"],
        writable_paths: ["Atoll Efficient.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.chaseculbertson.AtollEfficient"

  zap trash: [
    "~/Library/Caches/com.chaseculbertson.AtollEfficient",
    "~/Library/HTTPStorages/com.chaseculbertson.AtollEfficient",
    "~/Library/Preferences/com.chaseculbertson.AtollEfficient.plist",
    "~/Library/Saved Application State/com.chaseculbertson.AtollEfficient.savedState",
  ]

  caveats <<~EOS
    Atoll Efficient is an unofficial fork of Atoll. Quit upstream Atoll
    before opening it; running both draws two notches.

    macOS asks for Bluetooth and Accessibility access again after each
    upgrade, because the app is ad-hoc signed. Atoll waits on the Bluetooth
    prompt at launch, so answer it before expecting the notch to appear.
  EOS
end
