# function to print out Cronbach's Alpha in nice html tables in Rmd

print_alpha <- function(df, variable) {
  var_name <- as.character(substitute(variable))

  item_names <- df %>%
    select(all_of(variable)) %>%
    alpha() %>%
    pluck("keys") %>%
    names()

  table1 <- df %>%
    select(all_of(variable)) %>%
    alpha() %>%
    pluck("total") %>%
    mutate(caption = str_c("Reliability analysis (Cronbach’s Alpha) for ", var_name, " scale"))

  table2 <- df %>%
    select(all_of(variable)) %>%
    alpha() %>%
    pluck("alpha.drop") %>%
    mutate(caption = str_c("Reliability if an item is dropped from ", var_name, " scale"),
           item = item_names, .before = 1)

  table3 <- df %>%
    select(all_of(variable)) %>%
    alpha() %>%
    pluck("item.stats") %>%
    mutate(caption = str_c("Item statistics for ", var_name, " scale"),
           item = item_names, .before = 1)

  tables <- list(table3, table1, table2)

  for (i in tables) {
    output <- print(
      kable(x = i %>% select(-caption),
            caption = i$caption[1]) %>%
        kable_styling(full_width = T, bootstrap_options = "hover") %>%
        scroll_box(width = "100%",
                   box_css = "margin-bottom: 50px !important; padding: 10px !important;")
    )
  }
}
