#' Import or Deleta a file attached to a REDCap record
#' 
#' Talk to REDCap and either import or deleta a file attached 
#' to a specific record/field. You can only access record/field's file
#' at a time.
#' 
#' @param url The url for your REDCap project.
#' @param token API token (character string).
#' @param action Either import or delete
#' @param id Record id to import file to
#' @param field Field that holds the file
#' @param event The event you want the file sent to
#' @param file Your file (character string--don't forget the path)
#' @param verbose Logical (default = FALSE). Verbose output from the posting
file_rc <- function(url, token, action, id, field, file = NULL, 
                    event = NULL, verbose = FALSE) {
  if (!(action %in% c("import", "delete"))) {
    stop("action nees to be either 'import' or 'delete'")
  }
  post_rc(url, verbose = verbose,
          token = token,
          content = "file",
          action = action,
          record = id,
          field = field,
          event = event,
          file = if (action == "delete") NULL else RCurl::fileUpload(file))
}
