# ============================================================
# Environmental distribution heatmap for 9 phylogenetic trees
# Values = % of sequences in each tree assigned to each
# environmental isolation group
# ============================================================

library(tidyverse)
library(viridis)

# ------------------------------------------------------------
# 1. Enter environmental-group counts for each tree
# ------------------------------------------------------------

env_counts <- tribble(
  ~Protein, ~Environment, ~Count,
  
  # PHA
  "PHA depolymerase (AAQ72538.1)", "Intertidal sediment / beach sand", 3,
  "PHA depolymerase (AAQ72538.1)", "Marine host-associated", 3,
  "PHA depolymerase (AAQ72538.1)", "Marine sediment", 2,
  "PHA depolymerase (AAQ72538.1)", "Surface seawater", 2,
  "PHA depolymerase (AAQ72538.1)", "Intertidal / coastal seawater", 1,
  
  # PETase183
  "PETase (UUT36764.1)", "Surface seawater", 9,
  "PETase (UUT36764.1)", "Marine host-associated", 9,
  "PETase (UUT36764.1)", "Plastisphere / marine biofilm", 9,
  "PETase (UUT36764.1)", "Marine sediment", 7,
  "PETase (UUT36764.1)", "Deep seawater", 6,
  "PETase (UUT36764.1)", "Deep-sea / chemosynthetic sediment", 3,
  "PETase (UUT36764.1)", "Intertidal / coastal seawater", 2,
  
  # PETase184
  "PETase (UUT36763.1)", "Plastisphere / marine biofilm", 12,
  "PETase (UUT36763.1)", "Deep-sea / chemosynthetic sediment", 9,
  "PETase (UUT36763.1)", "Deep seawater", 8,
  "PETase (UUT36763.1)", "Marine host-associated", 8,
  "PETase (UUT36763.1)", "Surface seawater", 4,
  "PETase (UUT36763.1)", "Intertidal sediment / beach sand", 2,
  "PETase (UUT36763.1)", "Intertidal / coastal seawater", 2,
  "PETase (UUT36763.1)", "Marine sediment", 2,
  "PETase (UUT36763.1)", "Polar sea ice / cryosphere", 1,
  
  # Poly(3-hydroxybutyrate) depolymerase
  "P3HB depolymerase (LC127088.1)",
  "Surface seawater", 20,
  "P3HB depolymerase (LC127088.1)",
  "Intertidal sediment / beach sand", 6,
  "P3HB depolymerase (LC127088.1)",
  "Plastisphere / marine biofilm", 5,
  "P3HB depolymerase (LC127088.1)",
  "Marine host-associated", 3,
  "P3HB depolymerase (LC127088.1)",
  "Intertidal / coastal seawater", 3,
  "P3HB depolymerase (LC127088.1)",
  "Deep-sea / chemosynthetic sediment", 3,
  "P3HB depolymerase (LC127088.1)",
  "Deep seawater", 2,
  "P3HB depolymerase (LC127088.1)",
  "Polar sea ice / cryosphere", 1,
  "P3HB depolymerase (LC127088.1)",
  "Marine sediment", 1,
  "P3HB depolymerase (LC127088.1)",
  "Mangrove sediment", 1,
  
  # PHB
  "PHB depolymerase (AAB40611.1)", "Surface seawater", 15,
  "PHB depolymerase (AAB40611.1)", "Plastisphere / marine biofilm", 8,
  "PHB depolymerase (AAB40611.1)", "Intertidal sediment / beach sand", 6,
  "PHB depolymerase (AAB40611.1)", "Marine sediment", 4,
  "PHB depolymerase (AAB40611.1)", "Deep-sea / chemosynthetic sediment", 3,
  "PHB depolymerase (AAB40611.1)", "Intertidal / coastal seawater", 2,
  "PHB depolymerase (AAB40611.1)", "Mangrove sediment", 2,
  "PHB depolymerase (AAB40611.1)", "Marine host-associated", 2,
  "PHB depolymerase (AAB40611.1)", "Deep seawater", 2,
  "PHB depolymerase (AAB40611.1)", "Polar sea ice / cryosphere", 1,
  
  # Oxidoreductase
  "Oxidoreductase (UOM43036.1)", "Marine sediment", 5,
  "Oxidoreductase (UOM43036.1)", "Marine host-associated", 3,
  "Oxidoreductase (UOM43036.1)", "Plastisphere / marine biofilm", 3,
  "Oxidoreductase (UOM43036.1)", "Deep seawater", 2,
  "Oxidoreductase (UOM43036.1)", "Mangrove sediment", 1,
  
  # Laccase
  "Laccase (UVG67878.1)", "Marine host-associated", 26,
  "Laccase (UVG67878.1)", "Surface seawater", 9,
  "Laccase (UVG67878.1)", "Marine sediment", 6,
  "Laccase (UVG67878.1)", "Deep-sea / chemosynthetic sediment", 2,
  "Laccase (UVG67878.1)", "Intertidal / coastal seawater", 1,
  "Laccase (UVG67878.1)", "Mangrove sediment", 1,
  
  # Glutathione peroxidase WP_003945816.1
  "Glutathione peroxidase (WP003945816.1)",
  "Marine host-associated", 13,
  "Glutathione peroxidase (WP003945816.1)",
  "Marine sediment", 4,
  "Glutathione peroxidase (WP003945816.1)",
  "Intertidal / coastal seawater", 2,
  "Glutathione peroxidase (WP003945816.1)",
  "Mangrove sediment", 1,
  "Glutathione peroxidase (WP003945816.1)",
  "Surface seawater", 1,
  "Glutathione peroxidase (WP003945816.1)",
  "Intertidal sediment / beach sand", 1,
  
  # Glutathione peroxidase WP_026826575.1
  "Glutathione peroxidase (WP026826575.1)",
  "Marine host-associated", 11,
  "Glutathione peroxidase (WP026826575.1)",
  "Marine sediment", 8,
  "Glutathione peroxidase (WP026826575.1)",
  "Intertidal sediment / beach sand", 6,
  "Glutathione peroxidase (WP026826575.1)",
  "Surface seawater", 5,
  "Glutathione peroxidase (WP026826575.1)",
  "Mangrove sediment", 4,
  "Glutathione peroxidase (WP026826575.1)",
  "Deep-sea / chemosynthetic sediment", 3,
  "Glutathione peroxidase (WP026826575.1)",
  "Deep seawater", 3,
  "Glutathione peroxidase (WP026826575.1)",
  "Intertidal / coastal seawater", 3,
  "Glutathione peroxidase (WP026826575.1)",
  "Plastisphere / marine biofilm", 2
)

# ------------------------------------------------------------
# 2. Define environmental-category and protein order
# ------------------------------------------------------------

environment_order <- c(
  "Plastisphere / marine biofilm",
  "Marine host-associated",
  "Mangrove sediment",
  "Polar sea ice / cryosphere",
  "Deep-sea / chemosynthetic sediment",
  "Intertidal sediment / beach sand",
  "Intertidal / coastal seawater",
  "Deep seawater",
  "Marine sediment",
  "Surface seawater"
)

protein_order <- c(
  "PETase (UUT36764.1)",
  "PETase (UUT36763.1)",
  "PHA depolymerase (AAQ72538.1)",
  "PHB depolymerase (AAB40611.1)",
  "P3HB depolymerase (LC127088.1)",
  "Oxidoreductase (UOM43036.1)",
  "Laccase (UVG67878.1)",
  "Glutathione peroxidase (WP003945816.1)",
  "Glutathione peroxidase (WP026826575.1)"
)


# ------------------------------------------------------------
# Prepare heatmap data
# ------------------------------------------------------------

heatmap_data <- env_counts %>%
  complete(
    Protein = protein_order,
    Environment = environment_order,
    fill = list(Count = 0)
  ) %>%
  group_by(Protein) %>%
  mutate(
    Total = sum(Count),
    Percent = (Count / Total) * 100
  ) %>%
  ungroup() %>%
  mutate(
    # Make zero-count cells NA so they can be colored gray
    Percent_plot = ifelse(Count == 0, NA, Percent),
    
    Protein = factor(
      Protein,
      levels = rev(protein_order)
    ),
    
    Environment = factor(
      Environment,
      levels = environment_order
    )
  )


# ------------------------------------------------------------
# Create heatmap
# ------------------------------------------------------------

p <- ggplot(
  heatmap_data,
  aes(
    x = Environment,
    y = Protein,
    fill = Percent_plot
  )
) +
  
  # Heatmap cells
  geom_tile(
    color = "white",
    linewidth = 0.7
  ) +
  
  # Percentage + raw sequence count
  # Empty cells remain unlabeled
  geom_text(
    aes(
      label = ifelse(
        Count == 0,
        "",
        paste0(
          round(Percent, 1),
          "%\n(n=", Count, ")"
        )
      )
    ),
    size = 3,
    lineheight = 0.9
  ) +
  
  # Plasma palette:
  # purple -> pink -> orange -> yellow
  scale_fill_viridis_c(
    option = "C",
    direction = -1,
    na.value = "grey85",
    limits = c(
      0,
      max(heatmap_data$Percent, na.rm = TRUE)
    ),
    name = "% of tree"
  ) +
  
  labs(
    x = "Isolation environment",
    y = NULL,
    title = paste(
      "Environmental distribution of",
      "candidate plastic-degradation-associated proteins"
    )
  ) +
  
  theme_classic(
    base_size = 12
  ) +
  
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1,
      vjust = 1,
      size = 10,
      color = "black"
    ),
    
    axis.text.y = element_text(
      size = 10,
      color = "black"
    ),
    
    axis.ticks = element_blank(),
    
    panel.grid = element_blank(),
    
    plot.title = element_text(
      size = 14,
      face = "bold",
      hjust = 0
    ),
    
    legend.title = element_text(
      face = "bold"
    ),
    
    legend.text = element_text(
      size = 10
    )
  )

# Display heatmap
p


# ------------------------------------------------------------
# Save publication-quality versions
# ------------------------------------------------------------
setwd("/Users/sabrinaelkassas/Downloads")
ggsave(
  filename = "Environmental_distribution_heatmap.png",
  plot = p,
  width = 11,
  height = 7,
  units = "in",
  dpi = 600,
  bg = "white"
)

ggsave(
  filename = "Environmental_distribution_heatmap.svg",
  plot = p,
  width = 11,
  height = 7,
  units = "in")