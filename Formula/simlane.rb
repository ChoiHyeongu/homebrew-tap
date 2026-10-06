class Simlane < Formula
  desc "One iOS simulator + Metro lane per git worktree for parallel React Native work"
  homepage "https://github.com/ChoiHyeongu/simlane"
  url "https://github.com/ChoiHyeongu/simlane/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7ee811441c3dd65056667455d3c236283a542c86dfb3204d6c16b589ce48b62e"
  license "MIT"

  depends_on "jq"
  depends_on :macos
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/simlane"
  end

  def caveats
    <<~EOS
      Link the Claude Code skill and register the session hooks:
        simlane setup --hooks
      To remove them later: rm ~/.claude/skills/simlane, and delete the
      "simlane claude-hook" entries from ~/.claude/settings.json.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/simlane --version").strip
  end
end
