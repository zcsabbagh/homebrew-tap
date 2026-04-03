class FlashcardsMcp < Formula
  desc "Spaced repetition flashcard MCP server with FSRS-5 algorithm"
  homepage "https://github.com/zcsabbagh/flashcards-mcp"
  url "https://github.com/zcsabbagh/flashcards-mcp/releases/download/v1.0.0/flashcards-mcp-1.0.0.tar.gz"
  sha256 "bdd1e6901e22bc1adb1acfedab17560f45abe168"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--production=false"
    system "npm", "run", "build"

    # Install the built artifacts
    libexec.install "dist", "node_modules", "package.json", "bin"
    (bin/"flashcards-mcp").write_env_script libexec/"bin/flashcards-mcp.js", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  def caveats
    <<~EOS
      To use with Claude, add this to ~/.claude/.mcp.json:

        {
          "mcpServers": {
            "flashcards": {
              "command": "#{opt_bin}/flashcards-mcp"
            }
          }
        }

      Then restart Claude.

      Optional: set ELEVENLABS_API_KEY in the env block for text-to-speech:

        {
          "mcpServers": {
            "flashcards": {
              "command": "#{opt_bin}/flashcards-mcp",
              "env": {
                "ELEVENLABS_API_KEY": "sk_..."
              }
            }
          }
        }
    EOS
  end

  test do
    assert_predicate bin/"flashcards-mcp", :exist?
  end
end
