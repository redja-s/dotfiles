# List of useful tooling

# CLI-only

- xclip [Copy to clipboard from CLI]
- Rofi [App Launcher]
- Blue light filter [Redshift]

# Dev

- jenv [Managing Java versions]

# Nerd Fonts

Nerd Fonts allow unicode icons to be used. Use the following website https://www.nerdfonts.com/#home

Example:
1. Download "Monaspice Nerd Font"
2. Unzip the files (you will have a list of `.ttf` or `.otf` or similar files)
3. Move all the unzipped files into `~/.local/share/fonts` (this is the local user-specific list of fonts)
4. To know what to refer to the font as, use something like `fc-list` (do `man fc-list` for full help)
    1. To confirm if the Font Family you refer to in files is correct, the list of styles should come up when you run `fc-list :family=<family>`
    2. If no fonts come up, it's likely the font family name is wrong
    3. List all fonts using `fc-list` and browse through the output for the correct font family

