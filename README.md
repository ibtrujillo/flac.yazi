# flac.yazi

Yazi previewer for FLAC files: shows the embedded cover art, extracted with
`ffmpeg` and cached by Yazi.

## Requirements

- Yazi 26.5.6 or newer
- `ffmpeg`

## Installation

```sh
ya pkg add ibtrujillo/flac
```

## Usage

```toml
# yazi.toml
[plugin]
prepend_previewers = [
  { url = "*.flac", run = "flac" },
]
```
