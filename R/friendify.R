#' Convert REDCap API exports into a friendly data frame
#' 
#' Creates a text connection to the raw REDCAP export and uses \code{read.table}
#' to make a friendly data frame.
#' 
#' @param rc_raw Raw data from the export
#' @return Friendly data frame containing your REDCap export
friendify <- function(rc_raw) {
  read.table(file = textConnection(rc_raw), 
             header = TRUE, 
             sep = ",", 
             na.strings = "", 
             stringsAsFactors = FALSE)
}