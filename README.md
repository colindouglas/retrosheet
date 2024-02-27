
# retrosheet

<!-- badges: start -->

[![R-CMD-check](https://github.com/colindouglas/retrosheet/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/colindouglas/retrosheet/actions/workflows/R-CMD-check.yaml)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/retrosheet)](https://cran.r-project.org/package=retrosheet)
[![License: GPL
2.0](https://img.shields.io/badge/license-GPL%20(%3E%3D%202)-blue.svg)](https://opensource.org/license/gpl-2-0)
[![GitHub
commit](https://img.shields.io/github/last-commit/colindouglas/retrosheet)](https://github.com/colindouglas/retrosheet/commit/main)
[![Downloads](https://cranlogs.r-pkg.org/badges/last-week/retrosheet)](https://cran.r-project.org/package=retrosheet)
<!-- badges: end --> Import Retrosheet data as a structured R object

`retrosheet` is an R package that downloads and parses the single-season
event, gamelog, roster, and schedule files from
[retrosheet.org](https://www.retrosheet.org/) into structured R objects
for further analysis.

**Note:** As of retrosheet 1.1.0, this repo contains the version
available on CRAN. Older versions can be found
[here](https://github.com/rmscriven/retrosheet).

## Installation

`retrosheet` can be installed from CRAN, or development versions
installed from Github.

``` r
# Install from CRAN
install.packages("retrosheet")

# Install development version from Github
# install.packages("devtools")
devtools::install_github("colindouglas/retrosheet")
```

## Usage

- `getRetrosheet()` - This workhorse function returns the full seasonal
  data associated with the user-entered arguments
  - Use the `cache` argument to save a local cache and avoid stressing
    retrosheet.org
  - Use `get_retrosheet()` as a drop-in replacement to return tibbles
    instead of matrices
- `getPartialGamelog()` - An alternative to returning the full gamelog
  files. This function allows the user to choose the columns and date.
  Column names are made available by the global object `gamelogFields`

Also included are convenience functions

- `getFileNames()` - for obtaining a list of all zip files currently
  available for use by this package
- `getTeamIDs()` - for providing the team ID value to be used in the
  `team` argument of `getRetrosheet()`
- `getParkIDs()` - for ballpark ID and name information
