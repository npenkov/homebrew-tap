class GitSubstatus < Formula
  desc "Interactive TUI to view git status across many repos at once"
  homepage "https://github.com/npenkov/git-substatus"
  url "https://github.com/npenkov/git-substatus/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "87fcfbcb3673a8e0fb693957a792213fa4f7e11a41d728930c3a0f776a7067c4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "git-substatus", shell_output("#{bin}/git-substatus --help")
  end
end
