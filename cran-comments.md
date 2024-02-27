A minor revision to resolve CRAN Package Check note 'lost braces in \\itemize',
as per change noted in second item: https://developer.r-project.org/blosxom.cgi/R-devel/NEWS/2023/10/11

Additionally, a remote path has been updated to reflect changed location of source data.


## Test environments 
* locally
    * Mint 21.1 Vera, R 4.3.2
        * 0 errors ✓ | 0 warnings ✓ | 0 notes ✓

* via winbuilder
    * Windows Server 2022 x64, R Under development (unstable) (2024-02-19 r85946 ucrt)
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

* On Windows R-devel: 
    * NOTE 1: `Found the following files/directories: ''NULL''`
    * NOTE 2: `Found the following files/directories: 'lastMiKTeXException'`
    * Both notes seem to be related to bugs in R-Hub and can safely be ignored
        * Note 1 issue: https://github.com/r-hub/rhub/issues/560
        * Note 2 issue: https://github.com/r-hub/rhub/issues/503
* On Ubuntu R-release and Fedora R-devel:
    * NOTE: `Skipping checking HTML validation: no command 'tidy' found`
        * This is an issue with R-Hub (I cannot add `tidy` to their path)
        * Issue: https://github.com/r-hub/rhub/issues/548

## Downstream dependencies
None
