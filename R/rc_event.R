#' Export a REDCap Event Structure from REDCap
#' 
#' Talk to REDCap and get your event definitions for longitudinal projects.
#' 
#' @param url The url for your REDCap project.
#' @param token API token (character string).
#' @param certificate Certificate file (with path) containing REDCap security certificate
#' @param friendly Logical (default=TRUE); Should the results be converted to a 
#'   data frame.
#' @param verbose Logical (default = FALSE). Verbose output from the posting.
#' @return If friendly = TRUE, then a data frame containing the events.
#'   If friendly = FALSE then a Large Character object containing the events
#'   (you probably don't want this).

rc_event <- function(url, certificate, token, friendly = TRUE, verbose = FALSE) {
  out <- post_rc(url, certificate, verbose = verbose,
                 token = token,
                 content = "event",
                 format = "csv")
  
  if (friendly) friendify(rc_raw = out) else out
}
