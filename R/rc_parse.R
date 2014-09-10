#' Parse Data Frame t0 REDCap Format
#' 
#' REDCap needs a "Bizarro" format for reimporting records. This puts it in that
#' format. Note that this was taken from 
#' https://github.com/etb/my-R-code/blob/master/R-pull-and-push-from-and-to-REDCap.R
#' 
#' @param rc_data Your REDCap data that has been conditoned appropriately.
#' @return a Large Character object containing the data frame in the new
#'   "Bizarro" format required for a REDCap import.
rc_parse <- function(rc_data) {
  ## Separately build header and table body, then suture them together 
  l1 <- paste(names(rc_data), collapse = ",")
  l2 <- capture.output(write.table(rc_data, 
                                   sep = ",", 
                                   na = "",
                                   col.names = FALSE, 
                                   row.names = FALSE))
  out <- paste0(c(l1, l2, ""), collapse = "\n")
  out
}