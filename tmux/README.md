# Guide

```bash
# Install oh my tmux
# Visit # https://github.com/gpakosz/.tmux
curl -fsSL "https://github.com/gpakosz/.tmux/raw/refs/heads/master/install.sh#$(date +%s)" | bash
ln -sf /Users/chfa/dev/settings/tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local
```

```bash
export ZSH_TMUX_AUTOSTART=false # change to true if needed
export ZSH_TMUX_CONFIG=$HOME/tmux.conf # update the path if needed

plugins=(tmux)
```
