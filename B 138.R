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
plot_pub <- ggplot(cwur15, aes(x = publications)) +
  geom_histogram(bins = 35, fill = "#1d7fd2", colour = "black", alpha = 0.85) +
  labs(
    title = "Distribution of Publications Among Universities (2015)",
    x = "Number of Publications",
    y = "Number of Universities"
  ) +
  theme_clean

plot_pub
ggsave("Plot1_Histogram_Publications_2015.png", plot_pub, width = 8, height = 5, dpi = 500)

plot_score <- ggplot(cwur15, aes(x = score)) +
  geom_histogram(bins = 35, fill = "#179e72", colour = "black", alpha = 0.85) +
  labs(
    title = "Distribution of Overall CWUR Score (2015)",
    x = "Overall CWUR Score",
    y = "Number of Universities"
  ) +
  theme_clean
