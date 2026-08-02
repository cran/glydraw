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

## ----sketch-cartoon, fig.width = 4.84, fig.height = 2.03----------------------
draw_cartoon_sketch(n_core)

## ----show-linkage, fig.width = 4.83, fig.height = 2.02------------------------
draw_cartoon(n_core, show_linkage = FALSE)

## ----orient, fig.width = 2.02, fig.height = 4.83------------------------------
draw_cartoon(n_core, orient = "up")

## ----red-end-default, fig.width = 4.84, fig.height = 2.03---------------------
draw_cartoon(n_core, red_end = "")

## ----red-end-wave, fig.width = 4.88, fig.height = 2.03------------------------
draw_cartoon(n_core, red_end = "~")

## ----red-end-text, fig.width = 5.38, fig.height = 2.03------------------------
draw_cartoon(n_core, red_end = "Asn")

## ----red-end-sequence, fig.width = 5.02, fig.height = 2.03--------------------
draw_cartoon(n_core, red_end = "ABC<site>D</site>EFJHI")

## ----red-end-site, fig.width = 5.02, fig.height = 2.13------------------------
draw_cartoon(n_core, red_end = "<site>N</site>-X-S/T")

## ----style-default------------------------------------------------------------
style_glydraw()

## ----fuc-orient, fig.width = 2.47, fig.height = 1.91--------------------------
fucosylated <- "Gal(b1-3)[Fuc(a1-4)]GlcNAc(b1-"

draw_cartoon(fucosylated, style = style_glydraw(fuc_orient = "flex"))
draw_cartoon(fucosylated, style = style_glydraw(fuc_orient = "up"))

## ----red-end-override, fig.width = 5.38, fig.height = 2.03--------------------
# The explicit argument overrides the style setting.
draw_cartoon(n_core, red_end = "Asn", style = style_glydraw(red_end = "~"))

## ----red-end-length, fig.width = 5.31, fig.height = 2.03----------------------
draw_cartoon(n_core, style = style_glydraw(red_end_length = 1))

## ----red-end-length-zero, fig.width = 4.63, fig.height = 2.03-----------------
# The custom text is omitted when `red_end_length = 0`.
draw_cartoon(n_core, red_end = "Asn", style = style_glydraw(red_end_length = 0))

## ----red-end-size, fig.width = 5.66, fig.height = 2.03------------------------
draw_cartoon(n_core, red_end = "Asn", style = style_glydraw(red_end_size = 10))

## ----linewidth, fig.width = 4.83, fig.height = 2.02---------------------------
draw_cartoon(
  n_core,
  style = style_glydraw(
    edge_linewidth = 1.4,
    node_linewidth = 0.4
  )
)

## ----node-size, fig.width = 4.89, fig.height = 2.12---------------------------
draw_cartoon(n_core, style = style_glydraw(node_size = 1.2))
draw_cartoon(n_core, style = style_glydraw(node_size = 1.6))

## ----compact-cartoon, fig.width = 2.21, fig.height = 1------------------------
compact_style <- style_glydraw(
  node_size = 1.4,
  edge_linewidth = 1.5,
  node_linewidth = 1.5
)
draw_cartoon(n_core, show_linkage = FALSE, style = compact_style)

## ----colors, fig.width = 4.83, fig.height = 2.02------------------------------
colors <- glydraw_colors()
colors[c("glyGreen", "glyBlue")] <- c("#4DAF4A", "#377EB8")

draw_cartoon(
  n_core,
  style = style_glydraw(colors = colors)
)

## ----style-glygen, fig.width = 5.35, fig.height = 2.03------------------------
draw_cartoon(n_core, style = style_glygen())

## ----style-snfg, fig.width = 5.35, fig.height = 2.10--------------------------
draw_cartoon(n_core, style = style_snfg())

## ----style-glycoworkbench, fig.width = 5.35, fig.height = 2.03----------------
draw_cartoon(n_core, style = style_glycoworkbench())

## ----sketch-style-glycoworkbench, fig.width = 5.35, fig.height = 2.03---------
draw_cartoon_sketch(n_core, style = style_glycoworkbench())

## ----highlight, fig.width = 2.48, fig.height = 2.02---------------------------
highlight_glycan <- glyrepr::as_glycan_structure(
  "Gal(b1-3)[GlcNAc(b1-6)]GalNAc(a1-"
)

draw_cartoon(highlight_glycan, highlight = c(1, 3))

## ----save-cartoon-------------------------------------------------------------
cartoon <- draw_cartoon(n_core, style = style_glydraw(red_end = "~"))
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
    style = style_glydraw(red_end = "~", node_size = 1.1)
  )
)

list.files(outdir)

