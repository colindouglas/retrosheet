#'
#' Import single-season retrosheet data as tibbles
#'
#' This function is a wrapper for getRetrosheet(). It downloads and parses data from
#' \url{http://www.retrosheet.org} for the game-log, event, (play-by-play), roster, and schedule files.
#' While getRetrosheet() returns a list of matrices, this function returns an otherwise-identical list of tibbles.
#' It takes the same arguments, and can act as a drop-in replacement.
#'
#' @param ... Arguments passed to `getRetrosheet()`
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
#' @importFrom purrr map map_dfc
#' @importFrom tibble as_tibble
#' @importFrom lubridate ymd
#' @export

get_retrosheet <- function(...) {

    response <- getRetrosheet(...)

    matrix_to_tibble <- function(x) {

        # If the response is a single matrix, convert it to a tibble
        if (is.matrix(x)) x <- as_tibble(x)

        # If the response is a dataframe (or was a matrix and has been converted to a dataframe)
        if (is.data.frame(x)) {
            x <- as_tibble(x)
            x[x == ""] <- NA  # Convert the empty strings to NA
            out <- map_dfc(x, ~ type.convert(., as.is = TRUE))  # Make a reasonable guess at each column type

            # Make the Date column date-type
            if ("Date" %in% colnames(out)) {
                out$Date <- ymd(out$Date)
            }
            return(out)

        # If the response is a list of objects, re-apply this function to all of the objects in the list
        } else if (length(x) > 1) {
            map(x, matrix_to_tibble)
        } else {
            return(x) # If the response is not a list, matrix, or df, return the input
        }
    }

    matrix_to_tibble(response)

}
