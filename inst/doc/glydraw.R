## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dpi = 80
)

## ----setup--------------------------------------------------------------------
library(glydraw)

## ----basic-cartoon, fig.width = 4.83, fig.height = 2.02-----------------------
n_core <- "Man(a1-3)[Man(a1-6)]Man(b1-4)GlcNAc(b1-4)GlcNAc(b1-"

draw_cartoon(n_core)

## ----show-linkage, fig.width = 4.83, fig.height = 2.02------------------------
draw_cartoon(n_core, show_linkage = FALSE)

## ----orient, fig.width = 2.02, fig.height = 4.83------------------------------
draw_cartoon(n_core, orient = "V")

## ----fuc-orient, fig.width = 2.47, fig.height = 1.91--------------------------
fucosylated <- "Gal(b1-3)[Fuc(a1-4)]GlcNAc(b1-"

draw_cartoon(fucosylated, fuc_orient = "flex")
draw_cartoon(fucosylated, fuc_orient = "up")

## ----red-end, fig.width = 5.09, fig.height = 2.02-----------------------------
draw_cartoon(n_core, red_end = "~")
draw_cartoon(n_core, red_end = "R")

## ----linewidth, fig.width = 4.83, fig.height = 2.02---------------------------
draw_cartoon(
  n_core,
  edge_linewidth = 1.4,
  node_linewidth = 0.4
)

## ----node-size, fig.width = 4.89, fig.height = 2.12---------------------------
draw_cartoon(n_core, node_size = 1.2)
draw_cartoon(n_core, node_size = 1.6)

## ----colors, fig.width = 4.83, fig.height = 2.02------------------------------
draw_cartoon(
  n_core,
  colors = c(Man = "#4DAF4A", GlcNAc = "#377EB8")
)

## ----highlight, fig.width = 2.48, fig.height = 2.02---------------------------
highlight_glycan <- glyrepr::as_glycan_structure(
  "Gal(b1-3)[GlcNAc(b1-6)]GalNAc(a1-"
)

draw_cartoon(highlight_glycan, highlight = c(1, 3))

## ----save-cartoon-------------------------------------------------------------
cartoon <- draw_cartoon(n_core, red_end = "~")
outfile <- file.path(tempdir(), "n-core.png")

save_cartoon(cartoon, outfile, scale = 2)
outfile

## ----export-cartoons----------------------------------------------------------
glycans <- c(
  core = "Man(a1-3)Man(b1-4)GlcNAc(b1-",
  antenna = "Gal(b1-4)GlcNAc(b1-",
  fucosylated = "Gal(b1-4)[Fuc(a1-3)]GlcNAc(b1-"
)

outdir <- file.path(tempdir(), "glydraw-cartoons")
suppressMessages(
  cartoons <- export_cartoons(
    glycans,
    outdir,
    file_ext = "png",
    scale = 1.5,
    red_end = "~",
    node_size = 1.1
  )
)

list.files(outdir)

