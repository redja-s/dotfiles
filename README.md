
## Migrate `nvim` config
- Clone repo somewhere in a code dir
- Symlink the nvim folder to your .config using `ln -s $(pwd)/path_to_cloned_repo/nvim ~/.config/nvim`

* Note that we use `$(pwd)` to use the **fully qualified path name** when linking. Not using this will cause issues with the symlink.
