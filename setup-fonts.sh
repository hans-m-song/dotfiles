FONT_DIR=$HOME/.fonts
if [[ -d $HOME/Library ]]; then
  FONT_DIR=$HOME/Library/Fonts
fi

mkdir -p "$FONT_DIR"

fonts=(JetBrainsMono FiraCode)

for font in "${fonts[@]}"; do
  curl -sSfLO "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz" \
    | tar -xzf - --directory "$FONT_DIR" --include '*.ttf'
done

if command -v fc-cache; then
  fc-cache -f -v
else
  echo "please manually install fonts"
fi

