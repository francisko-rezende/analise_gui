# tentando fazer umas ANOVAS pro gui
# Francisko de Moraes Rezende, francisko.rezende@gmail.com, 2020-03-26


# carregando os pacotes ---------------------------------------------------

# pacotes_para_instalar <- c("tidyverse",
#                            "readxl",
#                            "here",
#                            "lme4",
#                            "janitor",
#                            "broom")
# 
# install.packages(pacotes_para_instalar)

library(tidyverse)
library(readxl)
library(here)
library(lme4)
library(janitor)
library(ggbeeswarm)
library(broom)


# carregando os dados -----------------------------------------------------

mp <-
  readxl::read_xlsx(here::here("dados", "MP, UI e Angle - p Chikao.xlsx"),
                    sheet = "MP") %>% 
  janitor::clean_names()

ui <-
  readxl::read_xlsx(here::here("dados", "MP, UI e Angle - p Chikao.xlsx"),
                    sheet = "UI") %>% 
  janitor::clean_names() %>% 
  dplyr::mutate_at(.vars = vars(sp:rep), .funs = ~ factor(.))

angle <-
  readxl::read_xlsx(here::here("dados", "MP, UI e Angle - p Chikao.xlsx"),
                    sheet = "Angle") 

# analise ui --------------------------------------------------------------

ui_m1 <- lm(ui ~ sp * face, data = ui)

anova(ui_m1)

ui_m2 <- update(ui_m1, . ~ . -sp:face)

anova(ui_m2) %>% 
  tidy()
  

ui %>% 
  ggplot(aes(x = sp, y = ui)) +
  geom_boxplot() +
  geom_jitter() +
  theme_classic() +
  theme(axis.line.x = element_blank(),
        text = element_text(size = 16)) 

