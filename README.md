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

### Miniamlist

Less is more. Minimalism is the key aesthetic principle. This manifests in a variety of ways.

- Keep the colour palette small.
- Avoid visual clutter and information overload
- Only the most important details should be constantly visible, such as the clock and battery status.
- Details which are not constantly important (such as CPU usage) should not be constantly displayed. Instead, they
  could be available through a click or hover, or hidden in some other way, perhaps in the background behind all the
  windows. In some cases, they may not need to be presented at all, especially if there is an easy method for querying
  the information through the terminal.

### Styling implementation overview

The visual style of all graphical elements is centrally controlled, using a shared colour palette, to avoid replicating
colour values and other styling elements throughout multiple different configuration files.

- The theme is defined in the theme.toml file.
- Themeable applications reference the definitions from theme.toml in *.tmpl template files, using `gomplate` syntax.
- The theme-apply.nu script (executable with `nu theme-apply.nu`) applies the theme, using `gomplate` to generate all
  templated configuration files.
