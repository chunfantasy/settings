## Link .vimrc

```bash
// Link .vimrc
# cd settings/vim/
ln -s (absolute path to)/.vimrc ~/.vimrc

# Install vim-plug for managing plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Install plugins in vim
# vim
:PlugInstall
```
