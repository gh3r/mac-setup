# mac-setup

## requirements

* brew
* mackup
* antigen

## dotfiles quick start

```bash
brew install mackup
cp ./dotfiles/.mackup.cfg ~/
mackup restore
```

## screenshots dir

```bash
mkdir -p ~/screenshots
defaults write com.apple.screencapture location ~/screenshots
```
