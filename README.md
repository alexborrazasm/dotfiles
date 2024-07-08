# My dotfiles

**Warning**: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

1. **Clone the repository**
   ```bash
   git clone https://github.com/alexborrazasm/dotfiles.git

## Fonts

I use Cousune from [Nerd Fonts](https://www.nerdfonts.com/) 

How to install:

1. **Download the fonts .zip from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)**

2. **Copy to fonts**

   ```bash
   sudo mv ~/Downloads/fontName.zip /usr/share/fonts/
3. **Unpack the fonts**
   
   ```bash
   cd /usr/share/fonts
   sudo unzip Cousine.zip -d Cousine

## Zsh

Zsh is a powerful command-line shell for Unix systems.

To install Zsh, follow these steps:

On Fedora:

1. **Install Zsh**:

   ```bash
   sudo dnf upgrade
   sudo dnf install zsh

2. **Change default SHELL**

   ```bash
   chsh -s $(which zsh)
   
3. **You can check the default SHELL**

   ```bash
   echo $SHELL

3. **Install plugins**:

   ```bash
   sudo dnf install zsh-syntax-highlighting zsh-autosuggestions

4. **The [SUDO](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) plugin**

   ```bash
   mkdir /usr/share/zsh-sudo
   cd /usr/share/zsh-sudo
   wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
   cd # return to your home dir

5. **Theme**

   Install [p10k](https://github.com/romkatv/powerlevel10k) theme.

6. **Copy .zshrc && .p10k.zsh**
   ```bash
   cp -f ~/dotfiles/zsh/.zshrc ~/.zshrc
   cp -f ~/dotfiles/p10k/.p10k.zsh ~/.p10k.zsh

## LunarVim

[LunarVim](https://www.lunarvim.org/es/) is a Neovim distribution that offers a pre-configured setup to enhance the development experience.

## FZF

[FZF](https://github.com/junegunn/fzf) is a command-line fuzzy finder that allows for fast and efficient searching in files, directories, and more.

### Basic Usage

**Interactive Fuzzy Finder:**

FZF is primarily used to interactively search and select items from a list. For example, you can search through files, command history, and more.

- **Search through command history:**
  Pressing `Ctrl + R` allows you to search through your command history interactively. As you type, FZF filters the history based on your input, making it easy to find and execute previous commands.

- **Search through files (fzf-tmux integration):**
  `Ctrl + T` launches FZF in file search mode. This lets you search for files and directories interactively from the current directory. If you are using tmux, FZF integrates seamlessly with it.

## Alacritty
 [Alacritty](https://github.com/alacritty/alacritty) is a modern, fast terminal emulator for Unix systems.

To install Alacritty, follow these steps:

   On Fedora:

1. **Install Zsh**:

   ```bash
   sudo dnf upgrade
   sudo dnf install alacritty

2. **Copy config**

   ```bash
   mkdir -p .config/alacrity
   cp dotfiles/alacritty/* .config/alacrity
