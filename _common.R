set.seed(1014)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  fig.width = 6,
  fig.asp = 2/3,
  fig.show = "hold"
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Désactivation temporaire des sorties en ligne de commande pour quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 pour #> commentaire
)

ggplot2::theme_set(ggplot2::theme_gray(12))

# Utiliser la sortie en "asis" quand on configure le statut d'un chapitre
status <- function(type) {
  status <- switch(type,
    polishing = "peut être lu, mais il lui manque encore quelques finitions",
    restructuring = "est en cours de restructuraction et peut sembler confus ou incomplet",
    drafting = "est un brouillon, nous vous recommandons de ne pas en tenir compte",
    complete = "est complet et ne nécessite qu'une relecture finale",
    stop("`type` invalide", call. = FALSE)
  )

  class <- switch(type,
    polishing = "note",
    restructuring = "important",
    drafting = "important",
    complete = "note"
  )

  cat(paste0(
    "\n",
    ":::: status\n",
    "::: callout-", class, " \n",
    "Vous lisez la version de travail de la deuxieme édition de R pour la science des données.",
    "Ce chapitre ", status, ". ",
    "Vous pouvez trouver la première édition complète (en anglais) sur <https://r4ds.had.co.nz>.\n",
    ":::\n",
    "::::\n"
  ))
}
