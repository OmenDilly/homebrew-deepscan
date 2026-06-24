# homebrew-deepscan

Homebrew tap for [deepscan](https://github.com/OmenDilly/deepscan) — fast macOS
disk forensics.

```sh
brew install OmenDilly/deepscan/deepscan
```

Then:

```sh
deepscan scan        # reclaimable space + leak signatures (fast)
deepscan scan --tree # where did all the space go?
deepscan reclaim     # guarded cleanup (dry-run by default)
```
