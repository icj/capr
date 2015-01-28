#' Submit an HTML Form to REDCap
#' 
#' Wrapper for \code{RCurl::postForm}. Requires a security certificate to work
#' and the inputs for the REDCap API (it will fail without them).
#' 
#' @param uri The uri for your REDCap project.
#' @param verbose Logical (default = FALSE). Verbose output from the posting.
#' @param ... REDCap API inputs to send in the post.
#' @return If inputs supplied, then a Large Character object; else an error.
post_rc <- function(uri, certificate, verbose = FALSE, ...) {
  RCurl::postForm(uri = uri,
                  ...,
                  .opts = RCurl::curlOptions(ssl.verifypeer = TRUE,
                                             forbid.reuse = TRUE,
                                             verbose = verbose))
}