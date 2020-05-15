#'
#' A data frame of ballpark IDs
#'
#' This function returns a two-column data frame of ballpark IDs
#' along with current stadium name
#'
#' @export
#'
#' @examples
#' \donttest{
#' getParkIDs()
#' }
#'

getParkIDs <- function() {

    path <- "http://www.retrosheet.org/parkcode.txt"

    # Make a temp file
    tmp <- tempfile()
    on.exit(unlink(tmp))

    # Get the txt from the path, write to temp file
    RETRY("GET", url = path, write_disk(tmp, overwrite=TRUE), timeout(15))

    nm <- scan(tmp, nlines = 1L, nmax = 2L, what = "", sep = ",", quiet = TRUE)
    what <- setNames(rep_len(list(""), length(nm)), nm)
    scn <- scan(tmp, skip = 1L, what = what, sep = ",", flush = TRUE,
                quote = ",", quiet = TRUE)
    attr(scn, "row.names") <- .set_row_names(length(scn[[1L]]))
    class(scn) <- "data.frame"
    scn

}
