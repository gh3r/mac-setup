# mac-setup

## requirements

* brew
* chezmoi
* antigen

## quick start

```bash
brew install chezmoi
chezmoi init --apply git@github.com:gh3r/mac-setup.git
```

See [docs/chezmoi.md](docs/chezmoi.md) for day-to-day commands and conventions.


## screenshots dir

```bash
mkdir -p ~/screenshots
defaults write com.apple.screencapture location ~/screenshots
```
