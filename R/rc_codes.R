#' Create a Code list for REDCap radio, checkbox and yesno fields
#' 
#' Give it your dictionary and it will create a code list
#' 
#' @param dict REDCap dictionary (data frame returned by rc_dict).
#' @return A list containing the raw codes and labels for your REDCap radio, 
#' checkbox and yesno fields
rc_codes <- function(dict) {
  choices <- dict %>%
    filter(field_type %in% c("radio", "yesno", "checkbox", "dropdown")) %>%
    select(field_name, field_type, choices = starts_with("select_")) %>%
    # Fill in for yesno fields because REDCap leaves blank
    mutate(choices = ifelse(field_type == "yesno", 
                            "1, yes | 0, no", choices)) %>%
    # Construct completion fields
    rbind(data.frame(
      field_name = paste0(unique(dict$form_name), "_complete"),
      field_type = "dropdown",
      choices = c("2, Complete | 1, Unverified | 0, Incomplete")))
  
  codes <- stringr::str_split(choices$choices, " \\| ") %>%
    lapply(stringr::str_split, ", ", 2) %>%
    lapply(do.call, what = rbind) %>%
    lapply(function(x) {
      out <- data.frame(x, stringsAsFactors = FALSE)
      names(out) <- c("raw", "label")
      out$label <- factor(out$raw, 
                          levels = out$raw,
                          labels = out$label)
      out
    })
  names(codes) <- choices$field_name
  codes
}