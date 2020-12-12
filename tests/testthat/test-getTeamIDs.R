test_that("getTeamIDs returns the right number of teams", {

    teamids_2012 <- getTeamIDs(2012)
    # In 2012, there were 30 different teams
    expect_mapequal(
        teamids_2012,
        c(Angels = "ANA", Orioles = "BAL", `Red Sox` = "BOS", `White Sox` = "CHA",
          Indians = "CLE", Tigers = "DET", Royals = "KCA", Twins = "MIN",
          Yankees = "NYA", Athletics = "OAK", Mariners = "SEA", Rays = "TBA",
          Rangers = "TEX", `Blue Jays` = "TOR", Diamondbacks = "ARI", Braves = "ATL",
          Cubs = "CHN", Reds = "CIN", Rockies = "COL", Astros = "HOU",
          Dodgers = "LAN", Marlins = "MIA", Brewers = "MIL", Mets = "NYN",
          Phillies = "PHI", Pirates = "PIT", Padres = "SDN", Giants = "SFN",
          Cardinals = "SLN", Nationals = "WAS"))

    # In 1954, there were 16 teams
    teamids_1954 <- getTeamIDs(1954)
    expect_mapequal(
        teamids_1954,
        c(Orioles = "BAL", `Red Sox` = "BOS", `White Sox` = "CHA", Indians = "CLE",
          Tigers = "DET", Yankees = "NYA", Athletics = "PHA", Senators = "WS1",
          Dodgers = "BRO", Cubs = "CHN", Reds = "CIN", Braves = "MLN",
          Giants = "NY1", Phillies = "PHI", Pirates = "PIT", Cardinals = "SLN"
        ))
})
