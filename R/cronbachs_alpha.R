# function to print out Cronbach's Alpha in nice html tables in Rmd

cronbachs_alpha <- function(df, index_name, var_names) {

  cat(crayon::yellow("Outputting Cronbach's alpha tables for",
                     index_name,
                     "... \n"))

  item_names <- df %>%
    dplyr::select(all_of(var_names)) %>%
    psych::alpha() %>%
    purrr::pluck("keys") %>%
    names()

  table1 <- df %>%
    dplyr::select(all_of(var_names)) %>%
    psych::alpha() %>%
    purrr::pluck("total") %>%
    dplyr::mutate(caption = str_c("Reliability analysis (Cronbach’s Alpha) for ",
                                  index_name,
                                  " scale"))

  table2 <- df %>%
    dplyr::select(all_of(var_names)) %>%
    psych::alpha() %>%
    purrr::pluck("alpha.drop") %>%
    dplyr::mutate(caption = str_c("Reliability if an item is dropped from ",
                                  index_name,
                                  " scale"),
                  item = item_names, .before = 1)

  table3 <- df %>%
    dplyr::select(all_of(var_names)) %>%
    psych::alpha() %>%
    purrr::pluck("item.stats") %>%
    dplyr::mutate(caption = str_c("Item statistics for ", index_name, " scale"),
                  item = item_names, .before = 1)

  tables <- list(table3, table1, table2)

  purrr::map(tables, ~ insight::display(.x %>%
                                          dplyr::select(-caption),
                                        caption = .x$caption,
                                        zap_small = TRUE))
}
