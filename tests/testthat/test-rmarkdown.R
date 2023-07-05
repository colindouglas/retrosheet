library(rmarkdown)
test_that("Can be used in rmarkdown", {

    skip_if_offline(host = "retrosheet.org")

    # This test fails on systems without recent versions of Pandoc
    # Thus it fails on the MacOS and Solaris CRAN check systems unless we skip this test
    skip_on_cran()

    # Borrowed from: https://stackoverflow.com/questions/32310399/testing-code-chunks-of-a-markdown-script

    runAllChunks <- function(rmd, envir=globalenv()){
        tempR <- tempfile(tmpdir = ".", fileext = ".R")
        on.exit(unlink(tempR))
        rmarkdown::render(rmd, output_file = tempR, quiet = TRUE)
    }

    # Test that the file can be run without throwing any errors
    expect_error(
        runAllChunks("test-rmarkdown.Rmd"),
        NA)
})
