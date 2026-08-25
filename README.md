# litmus-zsh-theme

A color-reactive Zsh theme sensing local or SSH connections.

![litmus-zsh-theme screenshot](img/screenshot.svg)

## Features

- **Connection-aware colors**: prompt turns **cyan** on local sessions and **magenta** over SSH, so you always know where you are.
- **Timestamps**: bold blue `[YYYY-MM-DD HH:MM:SS]` on every prompt line.
- **Git integration**: current branch displayed in the right prompt with a **blue ✔** (clean) or **green ✗** (dirty) indicator.
- **Root indicator**: prompt symbol switches from `$` to `#` when running as root.
- **Error highlight**: prompt and working-directory text turn bold on non-zero exit status.
- **Right prompt**: shows `[user@host:~/path]` alongside git info for full context without clutter on the left.

## Themes

- `litmus.zsh`: standalone theme for Zsh without a framework.
- `litmus.zsh-theme`: Oh My Zsh theme using its Git prompt helpers.

## Requirements

- [Zsh](https://www.zsh.org/)
- [Git](https://git-scm.com/) for Git prompt information
- [Oh My Zsh](https://ohmyz.sh/) only when using `litmus.zsh-theme`

## Installation

### Standalone Zsh

Clone the repository and source `litmus.zsh` from `~/.zshrc`:

```sh
git clone https://github.com/dceoy/litmus-zsh-theme.git ~/.config/litmus-zsh-theme
printf '%s\n' 'source ~/.config/litmus-zsh-theme/litmus.zsh' >> ~/.zshrc
source ~/.zshrc
```

### Oh My Zsh

1. Clone the repository into the Oh My Zsh custom themes directory:

   ```sh
   git clone https://github.com/dceoy/litmus-zsh-theme.git \
     "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/litmus-zsh-theme"
   ```

2. Symlink the theme file:

   ```sh
   ln -sf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/litmus-zsh-theme/litmus.zsh-theme" \
     "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/litmus.zsh-theme"
   ```

3. Set the theme in `~/.zshrc`:

   ```sh
   ZSH_THEME="litmus"
   ```

4. Reload your shell:

   ```sh
   source ~/.zshrc
   ```

## Prompt Layout

```
[2026-04-03 14:32:07] $                          main✔ [user@host:~/project]
├── timestamp (blue) ──┘ └── symbol (cyan/magenta)  └── git + cwd (right prompt)
```

| Element                 | Description                         |
| ----------------------- | ----------------------------------- |
| `[YYYY-MM-DD HH:MM:SS]` | Bold blue timestamp                 |
| `$` / `#`               | Prompt symbol (normal user / root)  |
| `main✔`                 | Git branch + clean status (blue ✔)  |
| `dev✗`                  | Git branch + dirty status (green ✗) |
| `[user@host:~/path]`    | Working directory in right prompt   |

## Color Reference

| Context       | Color     |
| ------------- | --------- |
| Local session | Cyan      |
| SSH session   | Magenta   |
| Timestamp     | Bold blue |
| Git clean     | Blue ✔    |
| Git dirty     | Green ✗   |

## License

[MIT](LICENSE)
