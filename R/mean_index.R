# function to easily calculate a mean index

mean_index <- function(df, index_name, var_names) {

  cat(crayon::yellow("Creating a mean index for", index_name, "... \n"))

  df_temp <- df %>%
    dplyr::select(all_of(var_names))

  index <- rowMeans(df_temp)

  df <- df %>%
    dplyr::mutate("{index_name}" := index)

  return(df)

}
