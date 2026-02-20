cask "claude-sessions" do
  version "1.0.1"
  sha256 "f57715b418b091fe596a99042e2be9567c05864658cd5b55bb32acbd081ffaf5"

  url "https://github.com/vasilievyakov/miracle-claude-sessions/releases/download/v#{version}/ClaudeSessions.app.zip"
  name "Claude Sessions"
  desc "Session browser for Claude Code with cost tracking and tool visualization"
  homepage "https://github.com/vasilievyakov/miracle-claude-sessions"

  depends_on macos: ">= :sonoma"

  app "ClaudeSessions.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "/Applications/ClaudeSessions.app"]
  end

  zap trash: [
    "~/Library/Caches/com.vasilievyakov.claudesessions",
    "~/Library/Preferences/com.vasilievyakov.claudesessions.plist",
  ]
end
