# Linux Application Configuration

Configuration files for various Linux applications. Organised into directories for each application or package, for easy deployment using GNU Stow (`stow <directory-name>`).

## Philosophy

The following principles guide the selection of applications, and their configuration.

### Minimalist

Take only what is required. Elegance exists in simplicity.

- Prefer applications and packages with a specific narrow function and purpose.
- Avoid bloated applications with a wide range of features, unless most features would provide regular benefit.
- This also applies aesthetically (refer to aesthetics section below).

Examples:
- A minimalist window manager such as Hyprland is a better choice than a gloated desktop environment such as Gnome or KDE.

### Keyboard-centric operation

For ergonomics on a laptop with a trackpad, reliance on the mouse should be kept to a minimum. This is also a good
philosophy for efficiency and comfort even when working with a full-size keyboard and mouse.

- Prefer applications which provide keyboard-centric navigation and workflow.
- Consider terminal applications and user interfaces over graphical ones, particularly for less frequencly used purposes.

Examples:
- Terminal editors such as Helix or Vim are suitable options.
- Tiling window managers with good key bindings for navigation are more comfortable than a traditional mouse driven
  desktop experience.
- The vim-like navigation of qutebrowser makes it a great choice.
- Terminal UIs like impala and bluetui, for managing wireless networks and bluetooth devices respectively, may be more
  appropriate than graphical interfaces which sit in a system tray or status bar.

### Community maintained

Leverage community developed and supported solutions, to reduce the maintenance burden. Custom scripts can become a
liability as the tool with which they integrate evolve, are abandoned, or become obsolete.

- Seek for an installable package to satisfy a requirement, even a small one.
- Avoid all but the simplest of custom scripts.

Examples:
- I had hoped to be able to use hyprshot to take a screenshot, imv to preview it, and then present an option to save
  the image if desired. However, composing these tools together proved much more complex than anticipated, and so I
  decided to abandon the attempt and settle for the basic behaviour of hyprshot to copy a screenshot to the clipboard.

## Aesthetics

The visual style of all graphical elements should be centrally controlled, using a shared colour palette, to avoid
copying colour values throughout multiple different configuration files.
