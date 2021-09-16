# retrosheet 1.1.4
  * Updated tests to skip Rmarkdown tests on CRAN. Avoids pandoc dependency issues on Solaris and MacOS CRAN package checks.

# retrosheet 1.1.3
  * Updated tests to account for `stringsAsFactors = FALSE`
  * Switched to making requests via https to align with retrosheet.org changeover
  * Updated `README.md` to account for `master` to `main` change in repo

# retrosheet 1.1.2
  * Replaced kludge-y `closeAllConnections()` with `close()` calls to specific connections ([#1](https://github.com/colindouglas/retrosheet/issues/1))
  * Added some rudimentary data cleanup to the `get_retrosheet()` wrapper function
    * Dates in retrosheet data now return date-types, everything else is converted from `chr` via the relatively aggressive `type.convert()`
  * Removed `data.table` dependency, replaced `data.table::fread()` with `base::read.csv()` calls
  * `get_retrosheet()` now returns regular old dataframes now, instead of tibbles.
  * Added better handling of HTTP requests. Failed requests are now retried up to three times via `httr::RETRY()`
    
# retrosheet 1.1.1
  * Added `get_retrosheet()`, a wrapper for `getRetrosheet()` that takes the same arguments and returns the same data, except coercing matrices into tibbles.
  * Updated tests to account for more data being added to retrosheet.org (whoops)

# retrosheet 1.1.0
  * Schedule scraping now expects a `*.zip` file instead of `*.txt` file, to accommodate change to retrosheet.org file structure
  * Added `cache` parameter to getRetrosheet(). This defaults to NA. If set to a local directory path, retrosheet data will be cached locally and re-used so as not to constantly download the same file from the retrosheet.org servers
  * Fixed parsing of substitutions in games where no substitutions occurred. This is a rare edge case.
  * Removed `RCurl` dependency (due to incompatibility with TLS > 1.0). Web data is now downloaded using `httr` functions
  * Removed `XML` dependency, replaced with `xml2` and `rvest`
