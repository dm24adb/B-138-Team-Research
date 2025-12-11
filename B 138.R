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
plot_score
ggsave("Plot2_Histogram_Score_2015.png", plot_score, width = 8, height = 5, dpi = 500)

plot_score <- ggplot(cwur15, aes(x = score)) +
  geom_histogram(bins = 35, fill = "#179e72", colour = "black", alpha = 0.85) +
  labs(
    title = "Distribution of Overall CWUR Score (2015)",
    x = "Overall CWUR Score",
    y = "Number of Universities"
  ) +
  theme_clean

plot_score
ggsave("Plot2_Histogram_Score_2015.png", plot_score, width = 8, height = 5, dpi = 500)

plot_scatter <- ggplot(cwur15, aes(x = publications, y = score)) +
  geom_point(size = 2.2, alpha = 0.65, colour = "#0b4f9f") +
  geom_smooth(method = "lm", se = TRUE, colour = "#d11149", linewidth = 1) +
  labs(
    title = "Relationship Between Publications and Overall CWUR Score (2015)",
    subtitle = "Each point represents a university | Trend shown using linear regression",
    x = "Number of Publications",
    y = "Overall CWUR Score"
  ) +
  theme_clean
plot_scatter
ggsave("Plot3_Scatter_Publications_vs_Score_2015.png", plot_scatter, width = 8.5, height = 5.5, dpi = 550)

library(ggrepel)

top_unis <- cwur15 %>% arrange(desc(publications)) %>% slice(1:5)

plot_scatter_labeled <- plot_scatter +
  geom_text_repel(data = top_unis, aes(label = institution), size = 3.2)

plot_scatter_labeled
ggsave("Plot4_Scatter_Labeled_Outliers.png", plot_scatter_labeled, width = 8.5, height = 5.5, dpi = 550)

correlation_test <- cor.test(cwur15$publications, cwur15$score, method = "pearson")

correlation_test
