library(tidyverse)

cwur <- read.csv("cwurData.csv")
cwur15 <- cwur %>% filter(year == 2015)

theme_clean <- theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 15),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(colour = "grey80"),
    panel.grid.major.x = element_line(colour = "grey90")
  )
