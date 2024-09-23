# My dotfiles

## Index

1. [Set up dotfiles](#set-up-dotfiles)
   
   1.1 [Install Fonts](#fonts)

   1.2 [Install and configure ZSH](#zsh)

   1.3 [LunarVim](#lunarvim)

   1.4 [FZF](#fzf)

   1.5 [Alacritty](#alacritty)

   1.6 [Asus Linux](#asus-linux)

   1.7 [Set up GRUB & theming](#grub)

2. [Tips for Windows Dual Boot](#tips-for-windows-dual-boot)

   2.1 [The clock problem](#the-clock-problem)

   2.2 [Disable fast startup](#disable-fast-startup)

3. [Tips for Windows](#tips-for-windows)
   
   3.1 [Disable cpu boost on laptop](#disable-cpu-boost-on-laptop)

   3.2 [Consent Prompt in Windows](#changing-the-consent-prompt-behavior-in-windows)

   3.3 [Windows Subsystem for Linux (WSL)](#windows-subsystem-for-linux-wsl)

**Warning**: Don’t blindly use my settings unless you know what that entails. Use at your own risk!

# Set up dotfiles

1. **First clone the repository**

   ```bash
   git clone https://github.com/alexborrazasm/dotfiles.git
   ```

## Fonts

I use Cousune from [Nerd Fonts](https://www.nerdfonts.com/) 

How to install:

1. **Download the fonts .zip from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)**

2. **Copy to fonts**

   ```bash
   sudo mv ~/Downloads/Cousine.zip /usr/share/fonts/
   ```

3. **Unpack the fonts**
   
   ```bash
   cd /usr/share/fonts
   sudo unzip Cousine.zip -d Cousine
   sudo rm Cousine.zip # Remove .zip
   ```

## Zsh

Zsh is a powerful command-line shell for Unix systems.

To install Zsh, follow these steps:

1. **Install Zsh **:

   On Red Hat/CentOS/Fedora:
   ```bash
   sudo dnf upgrade
   sudo dnf install zsh wget bat lsd
   ```
   On Debian/Ubuntu/Mint
   ```bash
   sudo apt update
   sudo apt upgrade
   sudo apt install zsh wget bat lsd
   ```

2. **Change default SHELL**

   ```bash
   chsh -s $(which zsh)
   ```

3. **You can check the default SHELL**

   ```bash
   echo $SHELL
   ```

3. **Install plugins**:
   
   On Red Hat/CentOS/Fedora:
   ```bash
   sudo dnf install zsh-syntax-highlighting zsh-autosuggestions
   ```
   On Debian/Ubuntu/Mint
   ```
   sudo apt install zsh-syntax-highlighting zsh-autosuggestions
   ```

4. **The [SUDO](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) plugin**

   ```bash
   sudo mkdir /usr/share/zsh-sudo
   cd /usr/share/zsh-sudo
   sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
   cd
   ```

5. **Theme**

   Install [p10k](https://github.com/romkatv/powerlevel10k) theme.

6. **Copy .zshrc && .p10k.zsh**

   ```bash
   cp -f ~/dotfiles/zsh/.zshrc ~/.zshrc
   cp -f ~/dotfiles/p10k/.p10k.zsh ~/.p10k.zsh
   ```
   Note for Debian/Ubuntu/Mint Users:

   On Debian-based distributions, the bat command might be aliased to batcat. You need to update the alias in your .zshrc file. To do this:

   1. Open the .zshrc file in a text editor:

      ```bash
      nano ~/.zshrc
      ```
   2. Make these changes

      ```bash
      #alias cat='bat'
      alias cat ='batcat'
      #alias catp='bat -p' #plain text
      alias catp='batcat -p' #plain text
      ```
   
   3. Save the changes and exit the text editor (Ctrl + X, then Y to confirm, then Enter).

Once you've completed these steps:

- For shell changes to take effect, it may be necessary to restart your session or computer.

- Restart your terminal or source your .zshrc to apply the changes (source ~/.zshrc).
   
- Your Zsh shell should now be configured with plugins like syntax highlighting, autosuggestions, and the sudo plugin, along with the Powerlevel10k theme.

### Linking Zsh Configuration to Root User

You can link your configuration to that of the root user.

1. **Login as root**

   ```bash
   sudo su
   ```

2. **Link the configs**

   ```bash
   cd
   ln -s /home/<yourusername>/.zshrc /root/.zshrc
   ln -s /home/<yourusername>/.p10k.zsh /root/.p10k.zsh
   ln -s /home/<yourusername>/powerlevel10k /root/powerlevel10k
   ```

These commands create symbolic links (ln -s) from the original files in /home/`<yourusername>`/ to your root user's home directory (/root/). This allows the root user to use the same configuration files as your regular user.

3. **Change default SHELL**

   ```bash
   chsh -s $(which zsh)
   ```

Now, when you log in as root and start a new Zsh session, it should use the Powerlevel10k theme with the configurations you've set up.

### Note
- [LSD](https://github.com/lsd-rs/lsd) (LSDeluxe) is a modern replacement for the traditional ls command, designed to enhance the way you view directory contents.
- [BAT](https://github.com/sharkdp/bat) is a cat clone with syntax highlighting and Git integration.

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

   On Red Hat/CentOS/Fedora:

1. **Install Zsh**:

   ```bash
   sudo dnf upgrade
   sudo dnf install alacritty
   ```

2. **Copy config**

   ```bash
   mkdir -p .config/alacritty
   cp dotfiles/alacritty/* .config/alacritty
   ```

## Asus Linux

[Asus Linux](https://asus-linux.org/)

## GRUB

[Minimal ROG theme](https://github.com/hotaru-hspr/rog-grub)

Follow these steps:

1. **Install theme**:
   
   ```bash
   git clone https://github.com/hotaru-hspr/rog-grub
   cd rog-grub
   sudo chmod +x install.sh
   sudo ./install.sh -s 2k
   ````

2. **Remove repo**:

   ```bash
   cd ..
   rm -rf rog-grub
   ```

3. **GRUB saved last choice**

    ```bash
    sudo nano /etc/default/grub
    ```

4. **Add to file /etc/default/grub**

    ```bash 
    GRUB_DEFAULT=saved
    GRUB_SAVEDEFAULT=true
    ```

5. **Update grub files**
    On Red Hat/CentOS/Fedora:
    ```bash
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    ```

# Tips for Windows Dual Boot

Classic problems when using both systems

## The clock problem
Windows and Linux use two different approaches to keep track of time.
### The problem
- Linux assumes that your computer hardware clock is set to UTC (Coordinated Universal Time) and adjusts time by adding an offset to UTC. 
- Windows assumes the hardware clock is set to Local and doesn’t adjust time by adding an offset.
### The solution
- Change Windows to UTC.
- Change Linux to Local time.

### Fix in Windows

1. Open the Registry editor by pressing **Win + R** and entering the `regedit` command.

2. In the Registry editor, navigate to the following key:

   ```
   HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation
   ```

3. Create a new value with the DWORD type and the name RealTimeIsUniversal.

4. Double-click the created RealTimeIsUniversal value and set the value to 1.

5. Restart your computer for the changes to take effect.

It may be necessary to resynchronize the clock in settings.

### Note:
Changing registry settings can affect system stability and security. Proceed with caution and make sure to follow the steps accurately.

### Fix in Linux

   ```bash
   timedatectl set-local-rtc 1
   ````

   This command sets the system clock to interpret the hardware clock as set to local time (1), ensuring correct synchronization between Linux and Windows in dual-boot configurations.

   `Note`, in my last installation of Fedora 40 it already came in localtime, in this case if you want you want to put it in UTC:

   ```bash
   timedatectl set-local-rtc 0
   ```

   `Extra`, you can check if your linux is in localtime or not:

   ```bash
   ❯ timedatectl
                  Local time: Sat 2024-08-31 03:36:53 CEST
              Universal time: Sat 2024-08-31 01:36:53 UTC
                    RTC time: Sat 2024-08-31 01:36:52
                   Time zone: Europe/Madrid (CEST, +0200)
   System clock synchronized: yes
                 NTP service: active
             RTC in local TZ: no  # <--- no = UTC | yes = localtime
   ```

## Disable fast startup
Fast Startup works by hibernating the kernel session instead of fully shutting down and restarting the system. This can lead to issues with file system integrity, especially when accessing shared partitions (like NTFS partitions) from Linux. Disabling Fast Startup ensures that partitions are properly unmounted and any changes made are correctly written to disk.

1. Open the Power Options editor by pressing **Win + R** and entering the `powercfg.cpl` command.

2. On the left sidebar of the Power Options window, click on "Choose what the power buttons do".

3. Uncheck **Turn on fast start-up (recomended)**.

# Tips for Windows

## Disable cpu boost on laptop

This can significantly reduce temperatures, and in many cases, such as during gaming, you may not notice a loss in performance.

### Steps to Disable Processor Performance Boost Mode:

#### Using Power Options:

1. Open the Power Options editor by pressing **Win + R** and entering the `powercfg.cpl` command.

2. Find and click on "Change plan settings" for your selected power plan.

3. Click on "Change advanced power settings".

4. In the Power Options window, locate and expand "Processor Power Management".

5. Under it, find "Processor performance boost mode".

6. Set the setting to "Disabled".

7. Click **Apply** and **OK** to save changes.

#### If Option is Not Available (Modify Registry):

1. Open the Registry editor by pressing **Win + R** and entering the `regedit` command.

2. Navigate to the following path:

   ```
   Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7
   ````

3. Find the entry named "Attributes".

4. Change its value from "1" to "0". If this does not work, try changing it to "2".

5. Reopen the Power Options window.

6. Check if the "Processor performance boost mode" option is now available.

### Note:
Changing registry settings can affect system stability and security. Proceed with caution and make sure to follow the steps accurately.

## Changing the Consent Prompt Behavior in Windows

Changing the consent prompt behavior in Windows is crucial for enhancing security and managing user authentication effectively.

### Steps to Change Consent Prompt Behavior in Windows

1. Press **Win + R** to open the "Run" dialog box.
2. Type `regedit` and press Enter. If the UAC (User Account Control) window appears, confirm to continue.

3. Navigate to the following registry path:
```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
```

4. Look for a DWORD value named `ConsentPromptBehaviorAdmin`.
- If it doesn't exist, you'll need to create it:
  - Right-click in the empty space of the right panel, select **New** -> **DWORD (32-bit) Value**, and name it `ConsentPromptBehaviorAdmin`.

5. Double-click on `ConsentPromptBehaviorAdmin` and change its value to `1` to prompt for a password. Here are the possible values and their meanings:
- **0**: Elevate without prompting.
- **1**: Prompt for credentials on the secure desktop.
- **2**: Prompt for credentials on the normal desktop.
- **3**: Prompt for consent on the secure desktop.
- **4**: Prompt for consent on the normal desktop.
- **5**: Prompt for consent from administrators on the secure desktop.
- **6**: Prompt for consent from administrators on the normal desktop.

6. Close the Registry Editor.
7. Changes should take effect immediately. You may need to log out or restart your computer for full application.

### Note:
Changing registry settings can affect system stability and security. Proceed with caution and make sure to follow the steps accurately.

##  Windows Subsystem for Linux ([WSL](https://learn.microsoft.com/en-us/windows/wsl/))
Install Linux on Windows.

Follow these steps:
1. Open a PowerShell or Command Prompt with administrator privileges.

2. Run the following command to install the desired Linux distribution. Replace `distro_name` with the name of the distribution you want to install (e.g., `ubuntu`, `kali-linux`, `debian`):
   
   ```bash
   wsl --install -d distro_name
   ```

2. **Tip**: To see a list of available Linux distributions that you can install, run the following command:
   
   ```bash
   wsl --list --online
   ```
##
