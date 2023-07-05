test_that("getFileNames() returns the right result", {

    skip_if_offline(host = "retrosheet.org")

    result <- getFileNames()

    # There are at least three different types of files available
    expect_in(c("event", "gamelog", "schedule"), names(result))

    # Event files start in 1913, so there should be at least 2022 - 1913 files
    expect_gte(length(result$event), 2022 - 1913)

    # Game logs go back to 1871, so there should be at least 2022 - 1871 files
    expect_gte(length(result$gamelog), 2022 - 1871)

    # Schedules go back to 1877, so there should be at least 2022 - 1877 files
    expect_gte(length(result$schedule), 2022 - 1877)
})
