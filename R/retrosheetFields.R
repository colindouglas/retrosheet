retrosheetFields <- list(

    eventInner = list(
        NULL,
        NULL,
        c("category", "info"),
        c("retroID", "name", "team", "batPos", "fieldPos"),
        c("inning", "team", "retroID", "count", "pitches", "play"),
        NULL,
        c("retroID", "name", "team", "batPos", "fieldPos"),
        c("projCode", "retroID", "ER")
    ),

    eventOuter = c("id", "version", "info", "start", "play", "com", "sub", "data"),

    franchise = c(
        "FranchiseID", "OtherID", "Lg", "Div", "Loc",
        "Nick1", "Nick2", "GmFirst", "GmLast", "City", "State"
    ),

    game = c(
        # Game identification
        "Date", "DblHdr", "Day",
        # Teams
        "VisTm", "VisTmLg", "VisTmGNum", "HmTm", "HmTmLg", "HmTmGNum",
        # Score and game info
        "VisRuns", "HmRuns", "NumOuts", "DayNight", "Completion",
        "Forfeit", "Protest", "ParkID", "Attendance", "Duration",
        # Line scores
        "VisLine", "HmLine",
        # Visitor batting
        "VisAB", "VisH", "VisD", "VisT", "VisHR", "VisRBI",
        "VisSH", "VisSF", "VisHBP", "VisBB", "VisIBB", "VisK",
        "VisSB", "VisCS", "VisGDP", "VisCI", "VisLOB", "VisPs",
        # Visitor pitching
        "VisER", "VisTER", "VisWP", "VisBalks",
        # Visitor fielding
        "VisPO", "VisA", "VisE", "VisPassed", "VisDB", "VisTP",
        # Home batting
        "HmAB", "HmH", "HmD", "HmT", "HmHR", "HmRBI",
        "HmSH", "HmSF", "HmHBP", "HmBB", "HmIBB", "HmK",
        "HmSB", "HmCS", "HmGDP", "HmCI", "HmLOB", "HmPs",
        # Home pitching
        "HmER", "HmTER", "HmWP", "HmBalks",
        # Home fielding
        "HmPO", "HmA", "HmE", "HmPass", "HmDB", "HmTP",
        # Umpires
        "UmpHID", "UmpHNm", "Ump1BID", "Ump1BNm", "Ump2BID", "Ump2BNm",
        "Ump3BID", "Ump3BNm", "UmpLFID", "UmpLFNm", "UmpRFID", "UmpRFNm",
        # Managers
        "VisMgrID", "VisMgrNm", "HmMgrID", "HmMgrNm",
        # Pitchers of record
        "WinPID", "WinPNm", "PID", "PNAme", "SavePID", "SavePNm",
        "GWinRBIID", "GWinRBINm",
        "VisStPchID", "VisStPchNm", "HmStPchID", "HmStPchNm",
        # Visitor batting order
        "VisBat1ID", "VisBat1Nm", "VisBat1Pos",
        "VisBat2ID", "VisBat2Nm", "VisBat2Pos",
        "VisBat3ID", "VisBat3Nm", "VisBat3Pos",
        "VisBat4ID", "VisBat4Nm", "VisBat4Pos",
        "VisBat5ID", "VisBat5Nm", "VisBat5Pos",
        "VisBat6ID", "VisBat6Nm", "VisBat6Pos",
        "VisBat7ID", "VisBat7Nm", "VisBat7Pos",
        "VisBat8ID", "VisBat8Nm", "VisBat8Pos",
        "VisBat9ID", "VisBat9Nm", "VisBat9Pos",
        # Home batting order
        "HmBat1ID", "HmBat1Nm", "HmBat1Pos",
        "HmBat2ID", "HmBat2Nm", "HmBat2Pos",
        "HmBat3ID", "HmBat3Nm", "HmBat3Pos",
        "HmBat4ID", "HmBat4Nm", "HmBat4Pos",
        "HmBat5ID", "HmBat5Nm", "HmBat5Pos",
        "HmBat6ID", "HmBat6Nm", "HmBat6Pos",
        "HmBat7ID", "HmBat7Nm", "HmBat7Pos",
        "HmBat8ID", "HmBat8Nm", "HmBat8Pos",
        "HmBat9ID", "HmBat9Nm", "HmBat9Pos",
        # Misc
        "Additional", "Acquisition"
    ),

    roster = c("retroID", "Last", "First", "Bat", "Throw", "Team", "Pos"),

    schedule = c(
        "Date"      = "Date",
        "Num"       = "GameNo",
        "Day"       = "Day",
        "Visitor"   = "VisTeam",
        "League"    = "VisLg",
        "Game"      = "VisGmNo",
        "Home"      = "HmTeam",
        "League.1"  = "HmLg",
        "Game.1"    = "HmGmNo",
        "Day/Night" = "TimeOfDay",
        "Location"  = "Location",
        "Postponed" = "Postponed",
        "Makeup"    = "Makeup"
    )

)



get_column_names <- function(raw_names, type, field_map = retrosheetFields) {

    # Games don't have column names, so we just return a static vector
    # regardless of the input
    if (type %in% c("game", "roster")) {
        return(field_map[[type]])
    }

    if (type %in% c("schedule")) {
        deduped <- make.unique(raw_names, sep = ".")
        return(
            ifelse(deduped %in% names(field_map[[type]]), field_map[[type]][deduped], deduped)
        )
    }
}
