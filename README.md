# scripts-linux

<!-- toc -->

- [Starship Cross-shell Prompt](#starship-cross-shell-prompt)
- [The Fuck](#the-fuck)

<!-- tocstop -->

## Starship Cross-shell Prompt

[Starship Cross-shell Prompt](https://starship.rs/)

> The minimal, blazing-fast, and infinitely customizable prompt for any shell! 

1. Install
   ```bash
   curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/starship-install.sh | /bin/bash
   ```
1. Configure your shell's startup script (NOTE, if using bash or zsh this has already been done for you):
   ```bash
   eval "$(starship init bash)" # Add to ~/.bashrc
   eval "$(starship init zsh)"  # Add to ~/.zshrc
   ```
   For other shells look [here](https://starship.rs/guide/#step-2-setup-your-shell-to-use-starship).
1. Store your configuration in `~/config/starship.toml`. Details [here](https://starship.rs/guide/#step-3-configure-starship).

## The Fuck

[The Fuck](https://github.com/nvbn/thefuck)

> The Fuck is a magnificent app, inspired by a @liamosaur tweet, that corrects errors in previous console commands.

1. Install The Fuck
    ```bash
    curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/thefuck-install.sh | /bin/bash
    ```
1. Place this command in your `.bash_profile`, `.bashrc`, `.zshrc` or other startup script (NOTE, if you are using bash or zsh this is already done for you):
    ```bash
    eval $(thefuck --alias)
    ```
1. Reload the startup scripts by logging out and back in or:
   ```bash
   source ~/.bashrc     # or appropriate file for your shell
   ```
