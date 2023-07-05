test_that("Caching works", {

    # Delete any previously cached data
    unlink("testdata", recursive = TRUE)

    # With caching
    schedule_1 <- getRetrosheet("schedule", 1995, cache = "testdata")
    schedule_1a <- getRetrosheet("schedule", 1995, cache = "testdata/") # Test with trailing slash
    roster_1 <- getRetrosheet("roster", 1995, cache = "testdata")
    game_1 <- getRetrosheet("game", 2012, cache = "testdata")
    play_1 <- getRetrosheet("play", 2012, "SFN", cache = "testdata")

    # Without caching
    schedule_2 <- getRetrosheet("schedule", 1995)
    roster_2 <- getRetrosheet("roster", 1995)
    game_2 <- getRetrosheet("game", 2012)
    play_2 <- getRetrosheet("play", 2012, "SFN")

    expect_equal(schedule_1, schedule_2)
    expect_equal(schedule_1, schedule_1a)
    expect_equal(roster_1, roster_2)
    expect_equal(game_1, game_2)
    expect_equal(play_1, play_2)

    # Re-using cached data should give a message about using a local cache
    expect_message(getRetrosheet("schedule", 1995, cache = "testdata"), "Using local cache: testdata/schedule/1995SKED.ZIP")

})

test_that("Schedule downloading works", {

    schedule <- getRetrosheet("schedule", 1995, cache = "testdata")
    schedule_splits <- getRetrosheet("schedule", 1995, schedSplit = "TimeOfDay")

    # In 1995, there were 28 teams, each team played a 144 game schedule
    expect_equal(nrow(schedule), 28 * 144 / 2)

    # There were 601 day games, 60 evening games, and 1355 night games
    expect_equal(sapply(schedule_splits, nrow), c(D = 601L, E = 60L, N = 1355L))

})

test_that("Roster downloading works", {

    roster <- getRetrosheet("roster", 1995, cache = "testdata")

    # In 1995, there should be 28 regular teams plus All Star teams (NLS + ALS)
    expect_equal(length(roster), 28 + 2)

    # Toronto has 39 players on their roster
    expect_equal(nrow(roster$TOR), 39)

})

test_that("Game downloading works", {

    game <- getRetrosheet("game", 2012, cache = "testdata")

    # Each "game" has 161 different attributes
    expect_equal(length(game), 161)

    # In 2012, there were 30 teams, each played 162 games (and each game has two teams)
    expect_equal(nrow(game), 30 * 162 / 2)

})

test_that("Play downloading works", {

    play <- getRetrosheet("play", 2012, "SFN", cache = "testdata")

    # SFN played 81 games in 2012
    expect_equal(length(play), 81)

    # In the first game of the year, there were...
    expect_equal(nrow(play[[1]]$play), 68)     # 68 plays
    expect_equal(nrow(play[[1]]$sub), 4)       # 4 substitutions
    expect_equal(nrow(play[[1]]$start), 2 * 9) # 18 starters

})

# Delete any previously cached data
unlink("testdata", recursive = TRUE)
