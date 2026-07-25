## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(glydraw)
library(tibble)
library(dplyr)
library(ggplot2)

## ----fig.width = 3, fig.height = 4--------------------------------------------
plot_data <- tibble(
  glycan = c("Gal(b1-3)GalNAc(a1-", "Gal(b1-3)[GlcNAc(b1-6)]GalNAc(a1-"),
  value = c(1, 2),
)

ggplot(plot_data, aes(glycan, value)) +
  geom_col(fill = "grey70") +
  # ===== Important Here =====
  geom_glycan(
    aes(structure = glycan),  # provide a `structure` aesthetic
    orient = "V",             # set orientation to vertical
    size = 0.5,               # default 1 is too large
    vjust = 0,                # aligned to bottom
    position = position_nudge(y = 0.1)
  ) +
  # ==========================
  scale_y_continuous(expand = expansion(mult = c(0, 0.4))) +
  theme_classic() +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank()
  )

## ----fig.width = 4, fig.height = 4--------------------------------------------
plot_data <- tibble(
  y = 0,
  x = 1:5,
  glycan = c(
    "Glc(a1-",
    "Glc(a1-3)Glc(a1-",
    "Glc(a1-3)Glc(a1-3)Glc(a1-",
    "Glc(a1-3)Glc(a1-3)Glc(a1-3)Glc(a1-",
    "Glc(a1-3)Glc(a1-3)Glc(a1-3)Glc(a1-3)Glc(a1-"
  ),
)

ggplot(plot_data, aes(x, y)) +
  # ===== Important Here =====
  geom_glycan(
    aes(structure = glycan),
    size = 0.7,
    vjust = 0,
    orient = "V"
  ) +
  # ==========================
  geom_hline(yintercept = 0) +
  geom_point() +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.5))) +
  theme_void()

## ----fig.width = 3, fig.height = 4--------------------------------------------
# the same example data above
plot_data <- tibble(
  glycan = c("Gal(b1-3)GalNAc(a1-", "Gal(b1-3)[GlcNAc(b1-6)]GalNAc(a1-"),
  value = c(1, 2),
)

# This time, we plot glycan cartoons below the x-axis.
ggplot(plot_data, aes(x = glycan, y = value)) +
  geom_col(fill = "grey70") +
  scale_x_glycan() +  # The default values are good here.
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  theme_classic() +
  theme(
    axis.ticks.x = element_blank(),
    axis.title.x = element_blank()
  )

## ----fig.width = 4, fig.height = 3--------------------------------------------
set.seed(123)
plot_data <- tibble(
  `z-score` = rnorm(25),
  branch = rep(c(
    "GlcNAc(??-",
    "Gal(??-?)GlcNAc(??-",
    "Neu5Ac(??-?)Gal(??-?)GlcNAc(??-",
    "Neu5Ac(??-?)Gal(??-?)[Fuc(??-?)]GlcNAc(??-",
    "Gal(??-?)[Fuc(??-?)]GlcNAc(??-"
  ), 5),
  sample = rep(paste0("Sample ", 1:5), each = 5)
)

ggplot(plot_data, aes(branch, sample)) +
  geom_tile(aes(fill = `z-score`), color = "white", linewidth = 1) +
  scale_fill_viridis_c(option = "plasma") +
  # ===== Important Here =====
  scale_x_glycan(
    position = "top",
    size = 0.2,
    show_linkage = FALSE,
    red_end = "~"
  ) +
  # ==========================
  coord_equal() +
  theme_void() +
  theme(axis.text.y = element_text())

## ----fig.width = 4.5, fig.height = 3------------------------------------------
set.seed(123)
plot_data <- bind_rows(
  tibble(
    x = rnorm(10, mean = -1, sd = 0.5),
    y = rnorm(10, mean = -1, sd = 0.5),
    glycan = "Gal(b1-3)GalNAc(a1-"
  ),
  tibble(
    x = rnorm(10, mean = 1, sd = 0.5),
    y = rnorm(10, mean = 1, sd = 0.5),
    glycan = "Gal(b1-3)[GlcNAc(b1-6)]GalNAc(a1-"
  )
)

ggplot(plot_data, aes(x, y)) +
  geom_point(aes(color = glycan)) +
  guides(color = guide_glycan()) +  # Done!
  theme_bw()

