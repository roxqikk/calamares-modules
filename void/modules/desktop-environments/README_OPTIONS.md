# Desktop environment templates now include 'options' (nvidia and services selectable)

Each desktop module.conf now supports an `options` section with:
- nvidia: false (default)
- enable_packages: list
- disable_packages: list

The installer UI should expose these options as checkboxes and pass them to the Services module or to apply-services.sh.
