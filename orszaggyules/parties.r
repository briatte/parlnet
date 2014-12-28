# party colors (Wikipedia colors in brackets)

colors = c(
  "LMP"    = "#B3DE69", # light green (green)
  "MSZP"   = "#E41A1C", # red (red and green)
  "SZDSZ"  = "#377EB8", # blue (blue)
  "FIDESZ" = "#FF7F00", # orange (orange)
  "MDF"    = "#01665E", # dark green/teal (dark green)
  "KDNP"   = "#FFFF33", # yellow (red, white, green, gold)
  "JOBBIK" = "#444444", # dark grey (red and silver)
  "FKGP"   = "#A65628", # brown (green)
  "MIÉP"   = "#1B9E77", # dark green (green)
  "IND"    = "#AAAAAA"
)

# party names

groups = c(
  "LMP"    = "Lehet Más a Politika",
  "MSZP"   = "Magyar Szocialista Párt",
  "SZDSZ"  = "Szabad Demokraták Szövetsége",
  "FIDESZ" = "Fidesz – Magyar Polgári Szövetség",
  "MDF"    = "Magyar Demokrata Fórum",
  "KDNP"   = "Kereszténydemokrata Néppárt",
  "JOBBIK" = "Jobbik Magyarországért Mozgalom",
  "FKGP"   = "Független Kisgazda, Földmunkás és Polgári Párt",
  "MIÉP"   = "Magyar Igazság és Élet Pártja",
  "IND"    = "independent"
)

# ParlGov Left/Right scores

scores = c(
  "LMP"    = 2.6, # eco
  "MSZP"   = 2.9, # soc
  "SZDSZ"  = 4,   # lib
  "FIDESZ" = 6.5, # con
  "MDF"    = 6.5, # con
  "KDNP"   = 7.4, # chr
  "JOBBIK" = 8.7, # right
  "FKGP"   = 9,   # con
  "MIÉP"   = 9.6, # right
  "IND"    = Inf
)

stopifnot(names(colors) == names(scores))
order = names(colors)[ order(scores) ]
