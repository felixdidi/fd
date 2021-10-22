# function to print out descriptives for mean index
# in a nice html table for RMarkdown

print_index <- function(df, variable) {
  var_name <- as.character(substitute(variable))

  df$index <- rowMeans(df[variable])

  df %>%
    get_summary_stats(index) %>%
    select(-variable) %>%
    kable(caption = str_c("Descriptive statistics for index of ", var_name)) %>%
    kable_styling(full_width = T, bootstrap_options = "hover") %>%
    scroll_box(width = "100%",
               box_css = "margin-bottom: 50px !important; padding: 10px !important;")
}
