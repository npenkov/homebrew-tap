class GitWorktreeRefresh < Formula
  desc "Scan directories for git repos, fetch remotes in parallel, show worktree status"
  homepage "https://github.com/npenkov/git-worktree-refresh"
  url "https://github.com/npenkov/git-worktree-refresh/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "21cd5c653873ffa265f52b8cacd0db154f838c23d28853b5ce01a728e8704229"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    out_dir = Dir["target/release/build/git-worktree-refresh-*/out"].first
    man1.install "#{out_dir}/git-worktree-refresh.1"
  end

  test do
    assert_match "git-worktree-refresh", shell_output("#{bin}/git-worktree-refresh --help")
  end
end
