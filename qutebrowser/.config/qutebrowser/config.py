# Qutebrowser configuration file
# This file configures qutebrowser with custom key bindings

# Load existing configuration
config.load_autoconfig()

# Invert J and K key bindings for tab navigation
# By default: J = next tab, K = previous tab
# After inversion: J = previous tab, K = next tab
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
