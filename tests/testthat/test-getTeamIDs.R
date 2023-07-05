test_that("getTeamIDs returns the right number of teams", {

    teamids_2012 <- getTeamIDs(2012)
    # In 2012, there were 30 different teams
    # We use `expect_in()` because Retrosheet adds the All Star teams as well
    expect_in(
        c(
            Angels = "ANA", Orioles = "BAL", `Red Sox` = "BOS", `White Sox` = "CHA",
            Indians = "CLE", Tigers = "DET", Royals = "KCA", Twins = "MIN",
            Yankees = "NYA", Athletics = "OAK", Mariners = "SEA", Rays = "TBA",
            Rangers = "TEX", `Blue Jays` = "TOR", Diamondbacks = "ARI", Braves = "ATL",
            Cubs = "CHN", Reds = "CIN", Rockies = "COL", Astros = "HOU",
            Dodgers = "LAN", Marlins = "MIA", Brewers = "MIL", Mets = "NYN",
            Phillies = "PHI", Pirates = "PIT", Padres = "SDN", Giants = "SFN",
            Cardinals = "SLN", Nationals = "WAS"
        ),
        teamids_2012
    )

    # In 1954, there were 16 teams
    # We use `expect_in()` because Retrosheet adds the All Star teams as well
    teamids_1954 <- getTeamIDs(1954)
    expect_in(
        c(
            Orioles = "BAL", `Red Sox` = "BOS", `White Sox` = "CHA", Indians = "CLE",
            Tigers = "DET", Yankees = "NYA", Athletics = "PHA", Senators = "WS1",
            Dodgers = "BRO", Cubs = "CHN", Reds = "CIN", Braves = "MLN",
            Giants = "NY1", Phillies = "PHI", Pirates = "PIT", Cardinals = "SLN"
        ),
        teamids_1954
    )
})
