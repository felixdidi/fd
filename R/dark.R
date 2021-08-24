# setting the theme to my custom gruvbox dark theme

dark <- function() {

  # check if theme is already installed
  check <- try(rstudioapi::applyTheme("Gruvbox Dark Custom"), silent = TRUE)

  if(class(check) == "try-error") {

    print("The theme is not installed, trying to install the Theme...")

  rstudioapi::addTheme(system.file("themes", "gruvbox_dark.rstheme", package = "fd"),
                       apply = TRUE,
                       force = TRUE)

    print("Installed and switched to Felix' custom Gruvbox Dark Theme")
  }

  else {
    print("Switched to Felix' custom Gruvbox Dark Theme")
  }
}
