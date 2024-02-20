test_that("Caching works", {

    skip_if_offline(host = "retrosheet.org")

    # With caching
    schedule_1 <- get_retrosheet("schedule", 1995, cache = "testdata")
    schedule_1a <- get_retrosheet("schedule", 1995, cache = "testdata/") # Test with trailing slash
    roster_1 <- get_retrosheet("roster", 1995, cache = "testdata")
    game_1 <- get_retrosheet("game", 2012, cache = "testdata")
    play_1 <- get_retrosheet("play", 2012, "SFN", cache = "testdata")

    # Without caching
    schedule_2 <- get_retrosheet("schedule", 1995)
    roster_2 <- get_retrosheet("roster", 1995)
    game_2 <- get_retrosheet("game", 2012)
    play_2 <- get_retrosheet("play", 2012, "SFN")

    # With and without caching should always give you the same thing
    expect_equal(schedule_1, schedule_2)
    expect_equal(schedule_1, schedule_1a)
    expect_equal(roster_1, roster_2)
    expect_equal(game_1, game_2)
    expect_equal(play_1, play_2)

    # Re-using cached data should give a message about using a local cache
    expect_message(get_retrosheet("schedule", 1995, cache = "testdata"), "Using local cache: testdata/schedule/1995SKED.zip")

})

test_that("Schedule downloading works", {

    skip_if_offline(host = "retrosheet.org")

    schedule <- get_retrosheet(type = "schedule", year = 1995, cache = "testdata")
    schedule_unnamed <- get_retrosheet("schedule", 1995, cache = "testdata")
    schedule_splits <- get_retrosheet(type = "schedule", year = 1995, schedSplit = "TimeOfDay")
    schedule_splits_some_named <- get_retrosheet("schedule", 1995, schedSplit = "TimeOfDay")

    # In 1995, each of the 28 teams played 72 games
    expect_equal(nrow(schedule), 28 * 72)

    # Schedules should be the same, regardless of whether we used named params
    expect_equal(schedule_splits, schedule_splits_some_named)

    # There are three different splits, (D)ay, (E)vening, and (Night)
    expect_equal(length(schedule_splits), 3)

    # In 1995, there were 1355 (N)ight games
    expect_equal(nrow(schedule_splits$N), 1355)

    # There should be the same number of games in the split and unsplit schedules
    expect_equal(sum(unlist(lapply(schedule_splits, nrow), recursive = TRUE)), nrow(schedule))

    # Confirm that using named and unnamed arguments returns the same thing
    expect_equal(schedule, schedule_unnamed)

})

test_that("Roster downloading works", {

    skip_if_offline(host = "retrosheet.org")

    roster <- get_retrosheet("roster", 1995, cache = "testdata")

    # In 1995, there should be 28 regular teams
    # The two All Star teams (NLS + ALS) are no longer included in these data
    expect_equal(length(roster), 28)

    # In 1995, 39 different players played for TOR
    expect_equal(nrow(roster$TOR), 39)

})

test_that("Game downloading works", {

    skip_if_offline(host = "retrosheet.org")

    game <- get_retrosheet("game", 2012, cache = "testdata")

    # Confirm the returned dataframe has the correct dimensions
    expect_equal(dim(game), c(2430, 161))

})

test_that("Play downloading works", {

    skip_if_offline(host = "retrosheet.org")

    play <- get_retrosheet("play", 2012, "SFN", cache = "testdata")

    # There were 81 different SFN home games in 2012
    expect_equal(length(play), 81)

    # There were 68 different plays in the first game of the year
    expect_equal(nrow(play[[1]]$play), 68)

    # There were 4 different substitutions in the first game of the year
    expect_equal(nrow(play[[1]]$sub), 4)

    # There were 18 different starters in the first game of the year
    # (because it's a pre-DL NL game, there are always 18 different starters)
    expect_equal(nrow(play[[1]]$start), 18)

    # There are 26 different bits of "info" associated with that game00
    expect_equal(nrow(play[[1]]$info), 26)

})

test_that("Data is cleaned up as expected", {

    skip_if_offline(host = "retrosheet.org")

    game <- get_retrosheet("game", 2012, cache = "testdata")

    expect_true("data.frame" %in% class(game))
    expect_equal(class(game$Date), "Date")  # Dates are correct data type
    expect_false(any(game$Completion == "", na.rm = TRUE))  # Confirm that empty strings are converted to NAs
    expect_false(any(game$Forfeit == "", na.rm = TRUE))  # Confirm that empty strings are converted to NAs
    expect_false(any(game$Protest == "", na.rm = TRUE))  # Confirm that empty strings are converted to NAs

    schedule <- get_retrosheet(type = "schedule", year = 1995, cache = "testdata")
    expect_true("data.frame" %in% class(schedule))
    expect_equal(class(schedule$Date), "Date")  # Confirm that dates are Dates
    expect_equal(class(schedule$GameNo), "integer")  # Confirm that simple data (esp game numbers) are integers

    # Warn if trying to use stringsAsFactors
    expect_warning(
        get_retrosheet("schedule", 1995, schedSplit = "TimeOfDay", stringsAsFactors = TRUE, cache = "testdata")
        )
})

# Delete any previously cached data
unlink("testdata", recursive = TRUE)

