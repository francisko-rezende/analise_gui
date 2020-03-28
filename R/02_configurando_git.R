install.packages("usethis")

library(usethis)

usethis::edit_r_environ("project")


usethis::git_sitrep()


usethis::use_git_config(user.name = "Francisko de Moraes Rezende",
                        user.email = "francisko.rezende@gmail.com")

usethis::git_vaccinate()

usethis::edit_git_ignore()

use_git_ignore()
