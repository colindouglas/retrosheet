A patch revision that accounts for changes to the fields Retrosheet publishes in
their schedule files. The way column names are handled is now better formatted
and future-proof, so new columns should be handled automatically.

Github Issue Checklist: https://github.com/colindouglas/retrosheet/issues/4

## Test environments 

### locally via `devtools::check(remote = TRUE, manual = TRUE)`
    * Mint 22.1 Xia, R 4.5.3
        * 0 errors ✔ | 0 warnings ✔ | 1 note ✖

Note that the maintainer email has changed. Still the same person, just at a new
address, as I migrate domains.

```
❯ checking CRAN incoming feasibility ... [4s/14s] NOTE
  Maintainer: ‘Colin Douglas <retrosheet@colindougl.as>’
  
  New maintainer:
    Colin Douglas <retrosheet@colindougl.as>
  Old maintainer(s):
    Colin Douglas <colin@douglas.science>
```

### On winbuilder via `check_win_devel()`

https://win-builder.r-project.org/lVd1Q97k172T

```
Check time in seconds: 74
Status: 1 NOTE
R version 4.6.0 RC (2026-04-17 r89914 ucrt)
```

(same note as above)

### On Github Actions via 'check-standard'

    * macos-latest (release): OK
    * ubuntu-latest (devel): OK
    * windows-latest (release): OK
    * ubuntu-latest (release): OK
    * ubuntu-latest (oldrel-1): OK
    
## Downstream dependencies

None
