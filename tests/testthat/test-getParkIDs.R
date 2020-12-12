test_that("getParkIDs returns the right results", {
  park_ids <- getParkIDs()

  # These are the Park IDs as of December 2020
  expected_park_ids <- c("ALB01", "ALT01", "ANA01", "ARL01", "ARL02", "ARL03", "ATL01",
                         "ATL02", "ATL03", "BAL01", "BAL02", "BAL03", "BAL04", "BAL05",
                         "BAL06", "BAL07", "BAL09", "BAL10", "BAL11", "BAL12", "BOS01",
                         "BOS02", "BOS03", "BOS04", "BOS05", "BOS06", "BOS07", "BOS08",
                         "BUF01", "BUF02", "BUF03", "BUF04", "BUF05", "CAN01", "CAN02",
                         "CHI01", "CHI02", "CHI03", "CHI04", "CHI05", "CHI06", "CHI07",
                         "CHI08", "CHI09", "CHI10", "CHI11", "CHI12", "CIN01", "CIN02",
                         "CIN03", "CIN04", "CIN05", "CIN06", "CIN07", "CIN08", "CIN09",
                         "CLE01", "CLE02", "CLE03", "CLE04", "CLE05", "CLE06", "CLE07",
                         "CLE08", "CLE09", "CLL01", "COL01", "COL02", "COL03", "COL04",
                         "COV01", "DAY01", "DEN01", "DEN02", "DET01", "DET02", "DET03",
                         "DET04", "DET05", "DOV01", "ELM01", "FOR01", "FOR02", "FOR03",
                         "FTB01", "GEA01", "GLO01", "GLO02", "GRA01", "HAR01", "HON01",
                         "HOU01", "HOU02", "HOU03", "HRT01", "HRT02", "IND01", "IND02",
                         "IND03", "IND04", "IND05", "IND06", "IND07", "IRO01", "JER01",
                         "JER02", "KAN01", "KAN02", "KAN03", "KAN04", "KAN05", "KAN06",
                         "KEO01", "LAS01", "LBV01", "LOS01", "LOS02", "LOS03", "LOU01",
                         "LOU02", "LOU03", "LOU04", "LUD01", "MAS01", "MIA01", "MIA02",
                         "MID01", "MIL01", "MIL02", "MIL03", "MIL04", "MIL05", "MIL06",
                         "MIN01", "MIN02", "MIN03", "MIN04", "MNT01", "MON01", "MON02",
                         "NEW01", "NEW02", "NEW03", "NWK01", "NYC01", "NYC02", "NYC03",
                         "NYC04", "NYC05", "NYC06", "NYC07", "NYC08", "NYC09", "NYC10",
                         "NYC11", "NYC12", "NYC13", "NYC14", "NYC15", "NYC16", "NYC17",
                         "NYC18", "NYC19", "NYC20", "NYC21", "OAK01", "PEN01", "PHI01",
                         "PHI02", "PHI03", "PHI04", "PHI05", "PHI06", "PHI07", "PHI08",
                         "PHI09", "PHI10", "PHI11", "PHI12", "PHI13", "PHI14", "PHO01",
                         "PIT01", "PIT02", "PIT03", "PIT04", "PIT05", "PIT06", "PIT07",
                         "PIT08", "PRO01", "PRO02", "RCK01", "RIC01", "RIC02", "ROC01",
                         "ROC02", "ROC03", "SAI01", "SAN01", "SAN02", "SEA01", "SEA02",
                         "SEA03", "SFO01", "SFO02", "SFO03", "SJU01", "SPR01", "STL01",
                         "STL02", "STL03", "STL04", "STL05", "STL06", "STL07", "STL08",
                         "STL09", "STL10", "STP01", "SYD01", "SYR01", "SYR02", "SYR03",
                         "THR01", "TOK01", "TOL01", "TOL02", "TOL03", "TOL04", "TOR01",
                         "TOR02", "TRO01", "TRO02", "WAR01", "WAS01", "WAS02", "WAS03",
                         "WAS04", "WAS05", "WAS06", "WAS07", "WAS08", "WAS09", "WAS10",
                         "WAS11", "WAT01", "WAV01", "WEE01", "WHE01", "WIL01", "WIL02",
                         "WNY01", "WOR01", "WOR02", "WOR03")

  expect_equal(ncol(park_ids), 2)
  expect_true(all(expected_park_ids %in% park_ids$PARKID))  # Allows for more parks to be added without failing tests
})
