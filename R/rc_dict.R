#' Export a REDCap Data Dictionary from REDCap
#' 
#' Talk to REDCap and get your data dictionary.
#' 
#' @param url The url for your REDCap project.
#' @param token API token (character string).
#' @param certificate Certificate file (with path) containing REDCap security
#' @param friendly Logical (default=TRUE); Should the results be converted to a 
#'   data frame.
#' @param verbose Logical (default = FALSE). Verbose output from the posting.
#' @return If friendly = TRUE, then a data frame containing the data dictionary.
#'   If friendly = FALSE then a Large Character object containing the data
#'   dictionary (you probably don't want this).
rc_dict <- function(url, certificate, token, friendly = TRUE, verbose = FALSE) {
  out <- post_rc(url, certificate, verbose = verbose,
                 token = token,
                 content = "metadata",
                 format = "csv")
  
  if (friendly) friendify(rc_raw = out) else out
}
