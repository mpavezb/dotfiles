# Troubleshooting

## Helm initialization failed

There might be an error during initialization related to Helm. This got fixed by removing some outdated void variables:
```bash
rg "minibuffer-local-must-match-filename-map" ~/.emacs.d/
rg "browse-url-mosaic-program" ~/.emacs.d/
```


## Failed to clone repository

- Big repositories might have problems to clone due to timeout (e.g., Helm, lsp).
- Try increasing the http/https buffer sizes:

```bash
# http
git config --global http.postBuffer 500M
git config --global http.maxRequestBuffer 100M

# https
git config --global https.postBuffer 500M
git config --global https.maxRequestBuffer 100M

# compression
git config --global core.compression 0
```
