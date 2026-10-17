# mirrors

This directory can contain recommended mirror lists, mirror configuration examples and notes for Void-related repositories.

Example: add a third-party repository config in /etc/xbps.d/:

```bash
# example: d77void repo
echo "repository=https://sourceforge.net/projects/d77void/files/d77void-repo" >> /etc/xbps.d/d77void.conf
```

If you need recommended mirrors for Void, add a file here listing them (one per line) or a script to switch mirrors.
