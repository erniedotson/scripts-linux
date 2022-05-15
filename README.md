# scripts-linux

<!-- toc -->

- [Starship Cross-shell Prompt](#starship-cross-shell-prompt)
  * [Step 1: Install Starship](#step-1-install-starship)
  * [Step 2: Setup your shell to use Starship](#step-2-setup-your-shell-to-use-starship)
  * [Step 3: Configure Starship](#step-3-configure-starship)

<!-- tocstop -->

## Starship Cross-shell Prompt

[Starship Cross-shell Prompt](https://starship.rs/)

> The minimal, blazing-fast, and infinitely customizable prompt for any shell! 

### Step 1: Install Starship

`curl -Lks https://raw.githubusercontent.com/erniedotson/scripts-linux/master/starship-install.sh | /bin/bash`

Starship is now installed and `~/.bashrc` and `~/.zshrc` files have been updated.

### Step 2: Setup your shell to use Starship

The script above already updated your `~/.bashrc` and `~/.zshrc` scripts. If you use a different shell refer to the instructions [here](https://starship.rs/guide/#step-2-setup-your-shell-to-use-starship).

### Step 3: Configure Starship

Store your configuration in `~/config/starship.toml`. Details [here](https://starship.rs/guide/#step-3-configure-starship).
