class GitWorktreeRefresh < Formula
  desc "Scan directories for git repos, fetch remotes in parallel, show worktree status"
  homepage "https://github.com/npenkov/git-worktree-refresh"
  url "https://github.com/npenkov/git-worktree-refresh/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0ecb4612a2446ecf159affc5e16afbb1640a8dcca4d0843328aaf6c985adaf91"
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
