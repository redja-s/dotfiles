# NeoVim Configuration

## Migrate `nvim` config
1. Clone repo somewhere in a code dir
2. Symlink the nvim folder to your .config using `ln -s $(pwd)/path_to_cloned_repo/nvim ~/.config/nvim`

Use `$(pwd)` to use the **fully qualified path name** when linking. Not using this will cause issues with the symlink.

## Dependencies to install

### Telescope 

- ripgrep - https://github.com/BurntSushi/ripgrep
- fd - https://github.com/BurntSushi/ripgrep

