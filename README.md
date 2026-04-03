# Homebrew Tap for Flashcards MCP

Official Homebrew tap for [flashcards-mcp](https://github.com/zcsabbagh/flashcards-mcp) — a spaced repetition flashcard system with FSRS-5 algorithm.

## Installation

```bash
brew tap zcsabbagh/tap
brew install flashcards-mcp
```

## Usage

After installing, add this to your `~/.claude/.mcp.json`:

```json
{
  "mcpServers": {
    "flashcards": {
      "command": "flashcards-mcp"
    }
  }
}
```

Then restart Claude and try:
- **"create a deck called Algorithms"** — creates a new deck
- **"add a card: What is Big O? / A notation for algorithm time complexity"** — adds a card
- **"get due cards"** — opens the interactive flashcard UI

### Optional: Text-to-Speech

Add your ElevenLabs API key to enable voiceover:

```json
{
  "mcpServers": {
    "flashcards": {
      "command": "flashcards-mcp",
      "env": {
        "ELEVENLABS_API_KEY": "sk_..."
      }
    }
  }
}
```

## License

MIT — See [flashcards-mcp](https://github.com/zcsabbagh/flashcards-mcp) for details.
