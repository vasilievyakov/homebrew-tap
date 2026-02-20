cask "claude-sessions" do
  version "1.0.2"
  sha256 "8fb3469f7c0f5c236b96161efef2014a098615f94d49a8fc9a2359f36400ca23"

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
