## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(glydraw)
suppressPackageStartupMessages(library(ComplexHeatmap))

## ----heatmap-data-------------------------------------------------------------
set.seed(123)
structures <- c(
  "GlcNAc(b1-",
  "Gal(b1-4)GlcNAc(b1-",
  "Neu5Ac(a2-?)Gal(b1-4)GlcNAc(b1-",
  "Fuc(a1-3)GlcNAc(b1-",
  "Gal(b1-4)[Fuc(a1-3)]GlcNAc(b1-",
  "Neu5Ac(a2-?)Gal(b1-4)[Fuc(a1-3)]GlcNAc(b1-"
)

mat <- matrix(
  rnorm(length(structures) * 5),
  nrow = length(structures),
  dimnames = list(NULL, paste0("Sample ", 1:5))
)

## ----row-annotation, fig.width = 5.5, fig.height = 4--------------------------
Heatmap(
  mat,
  name = "z-score",
  show_row_names = FALSE,
  left_annotation = rowAnnotation(
    glycan = anno_glycan(
      structures,
      which = "row",
      show_linkage = FALSE
    )
  )
)

## ----column-annotation, fig.width = 6, fig.height = 4-------------------------
glycan_mat <- matrix(
  rnorm(length(structures) * 4),
  ncol = length(structures),
  dimnames = list(paste0("Feature ", 1:4), NULL)
)

Heatmap(
  glycan_mat,
  name = "abundance",
  show_column_names = FALSE,
  top_annotation = HeatmapAnnotation(
    glycan = anno_glycan(
      structures,
      which = "column",
      side = "top",
      show_linkage = FALSE
    )
  )
)

## ----styled-annotation, fig.width = 6, fig.height = 4-------------------------
Heatmap(
  mat,
  name = "z-score",
  show_row_names = FALSE,
  right_annotation = rowAnnotation(
    glycan = anno_glycan(
      structures,
      which = "row",
      side = "right",
      orient = "right",
      size = 0.2,
      show_linkage = FALSE,
      style = style_glydraw(
        red_end = "~",
        node_size = 1.4,
        edge_linewidth = 1.2,
        node_linewidth = 1.2
      )
    )
  )
)

