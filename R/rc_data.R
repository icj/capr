#' Export REDCap Data (Records) from REDCap
#' 
#' Talk to REDCap and get your data (records).
#' 
#' @param url The url for your REDCap project.
#' @param token API token (character string).
#' @param verbose Logical (default = FALSE). Verbose output from the posting.
#' @param format Currently only handles "csv"
#' @param type Can use "eav" (which is long format) or "flat" (which is wide format).
#' @param raw_or_label Use either "raw" or "label" for the kind of data you want
#' @param ids Character vector of the record ids you want
#' @param fields Character vector of the fields you want
#' @param forms Character vector of the forms you want
#' @param events Character vector of the events you want
#' @param friendly Logical (default=TRUE); Should the results be converted to a 
#'   data frame.
#' @param ... Extra inputs to pass to REDCap (see REDCap API documentation)
#' @return If friendly = TRUE, then a data frame containing the requested data.
#'   If friendly = FALSE then a Large Character object containing the data
#'   (you probably don't want this).
rc_data <- function(url, token, verbose = FALSE,
                    format = "csv", type = "eav",
                    raw_or_label = "raw", ids = NULL, fields = NULL, 
                    forms = NULL, events = NULL, friendly = TRUE, ...) {
  out <- post_rc(url, verbose = verbose,
                 token = token,
                 content = "record",
                 format = format,
                 type = type,
                 rawOrLabel = raw_or_label,
                 records = paste(ids, collapse = ", "),
                 fields = paste(fields, collapse = ", "),
                 forms = paste(forms, collapse = ", "),
                 events = paste(events, collapse = ", "),
                 ...)
  
  if (friendly) friendify(rc_raw = out) else out
}
