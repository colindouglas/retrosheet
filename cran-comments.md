A minor revision to resolve CRAN Package Check errors arising from changes to 
the structure of the source data. Package now also includes resource checks to
ensure that tests 'fail gracefully' if retrosheet.org is not available.

I have also updated the three URLs in the README with HTTP status codes >= 300.

There are three unique NOTEs when building this package on R-Hub. My 
understanding is that all three are related to issues with R-Hub, not the
package. To be sure, I've also added testing via Github Actions to confirm.
All five builds via Github Actions come back OK.

## Test environments 
* locally
    * Mint 21.1 Vera, R 4.3.1
        * 0 errors ✓ | 0 warnings ✓ | 0 notes ✓

* via winbuilder
    * Windows Server 2022 x64, R Under development (unstable) (2023-07-05 r84643 ucrt)
        * Status: OK

* via R-Hub
    * Windows Server 2022, R-devel, 64 bit
        * Status: 2 NOTEs
    * Ubuntu Linux 20.04.1 LTS, R-release, GCC 
        * Status: 1 NOTE
    * Fedora Linux, R-devel, clang, gfortran
        * Status: 1 NOTE

* via Github Actions
    * macos-latest (release)
        * Status: OK
    * windows-latest (release)
        * Status: OK
    * ubuntu-latest (devel)
        * Status: OK
    * ubuntu-latest (release)
        * Status: OK
    * ubuntu-latest (oldrel-1)
        * Status: OK

## R-Hub Notes:

* only on Windows R-devel: 
    * NOTE 1: `Found the following files/directories: ''NULL''`
    * NOTE 2: `Found the following files/directories: 'lastMiKTeXException'`
    * Both notes seem to be related to a bug in R-Hub and can safely be ignored
        * Note 1 Issue: https://github.com/r-hub/rhub/issues/560
        * Note 2 Issue: https://github.com/r-hub/rhub/issues/503
* On Ubuntu R-release and Fedora R-devel:
    * NOTE: `Skipping checking HTML validation: no command 'tidy' found`
    * I believe this to be an issue with R-Hub, I cannot add `tidy` to their PATH

## Downstream dependencies
None
