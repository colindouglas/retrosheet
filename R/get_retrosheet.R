#'
#' Import single-season retrosheet data as data frames
#'
#' This function is a wrapper for getRetrosheet(). It downloads and parses data from
#' \url{http://www.retrosheet.org} for the game-log, event, (play-by-play), roster, and schedule files.
#' While getRetrosheet() returns a list of matrices, this function returns an equivalent list of dataframes.
#' It takes the same arguments, and can act as a drop-in replacement.
#'
#' @param ... Arguments passed to `getRetrosheet()`. `stringsAsFactors` argument is always FALSE, and will warn if passed as TRUE
#'
#' @return The following return values are possible for the given \code{type}
#' \itemize{
#' \item \code{game} - a data frame of gamelog data for the given year
#' \item \code{play} - a list, each element of which is a single game's play-by-play
#' data for the given team and year.  Each list element is also a list, containing
#' the play-by-play data split into individual matrices.
#' \item \code{roster} - a named list, each element containing the roster
#' for the named team for the given year, as a data frame.
#' \item \code{schedule} - a data frame containing the game schedule for the given year
#' }
#'
#' @examples
#' \donttest{
#' ## get the full 1995 season schedule
#' get_retrosheet("schedule", 1995)
#'
#' ## get the same schedule, split by time of day
#' get_retrosheet("schedule", 1995, schedSplit = "TimeOfDay")
#'
#' ## get the roster data for the 1995 season, listed by team
#' get_retrosheet("roster", 1995)
#'
#' ## get the full gamelog data for the 2012 season
#' get_retrosheet("game", 2012)
#'
#' ## get the play-by-play data for the San Francisco Giants' 2012 season
#' get_retrosheet("play", 2012, "SFN")
#' }
#'
#' @export

get_retrosheet <- function(...) {

    dots <- list(...)

    if (!is.null(dots[["stringsAsFactors"]])) {
        if (dots[["stringsAsFactors"]]) {
            warning("get_retrosheet() forces stringsAsFactors = FALSE. For stringsAsFactors = TRUE, use getRetrosheet() instead")
        }
    }

    response <- getRetrosheet(...)

    matrix_to_df <- function(x) {

        # If the response is a single matrix, convert it to a tibble
        if (is.matrix(x)) x <- as.data.frame(x, stringsAsFactors = FALSE)

        # If the response is a dataframe (or was a matrix and has been converted to a dataframe)
        if (is.data.frame(x)) {
            out <- lapply(x, type.convert, na.strings = c("", "NA"), as.is = TRUE)


            # If there's a date column, make sure it's Date-type
            if ("Date" %in% names(out)) {
                out$Date <- as.character(out$Date)
                out$Date <- as.Date(out$Date, tryFormats = c("%Y-%m-%d", "%Y%m%d"))
            }

            out <- as.data.frame(out, stringsAsFactors = FALSE)
            return(out)

        # If the response is a list of objects, re-apply this function to all of the objects in the list
        } else if (length(x) > 1) {
           lapply(x, matrix_to_df)
        } else {
            return(x) # If the response is not a list, matrix, or df, return the input
        }
    }

    matrix_to_df(response)

}
