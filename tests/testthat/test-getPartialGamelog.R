test_that("getPartialGamelog examples all work", {
    interesting_columns <- c("ParkID",
                             "VisHR", "VisRBI",
                             "HmHR", "HmRBI")

    example_1 <- getPartialGamelog(2012, glFields = interesting_columns)
    example_2 <- getPartialGamelog(glFields = interesting_columns, date = "20120825")

    # Expect a row for each of the 30 teams playing 81 home games
    expect_equal(nrow(example_1), 30 * 81)

    # There should be six columns - the date, and the five interesting_columns
    expect_equal(ncol(example_1), 1 + length(interesting_columns))

    # There were 15 games played on Aug 25, 2012
    expect_equal(nrow(example_2), 15)

    # There should be six columns - the date, and the five interesting_columns
    expect_equal(ncol(example_2), 1 + length(interesting_columns))
})
