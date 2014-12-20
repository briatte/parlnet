Each repository contains:

- `make.r` – main entry point
- `load.r` – package loader
- `parties.r` – party information
- `functions.r` – network functions
- `data.r` – scrapers for bills and sponsors
- `build.r` – network building routines

Each repository depends on:

- [`dplyr`](https://github.com/hadley/dplyr), 
[`ggplot2`](https://github.com/hadley/ggplot2) and 
[`stringr`](https://github.com/hadley/stringr), 
by [Hadley Wickham](https://github.com/hadley)
- [`grid`](https://www.stat.auckland.ac.nz/~paul/grid/grid.html), 
by [Paul Murrell](https://www.stat.auckland.ac.nz/~paul/) (distributed with R)
- [`igraph`](https://github.com/igraph/igraph), 
by [Gabor Csardi](https://github.com/gaborcsardi) and others
- [`network`](http://cran.r-project.org/web/packages/network/) and 
[`sna`](http://cran.r-project.org/web/packages/sna/), 
by [Carter T. Butts](http://erzuli.ss.uci.edu/~buttsc/) and others
- [`rgexf`](http://bitbucket.org/gvegayon/rgexf), 
by [George Vega Yon](http://bitbucket.org/gvegayon/) and others
- [`tnet`](http://cran.r-project.org/web/packages/tnet/), 
by [Tore Opsahl](http://toreopsahl.com/)
- [`XML`](http://cran.r-project.org/web/packages/XML/), 
by [Duncan Temple Lang](http://www.stat.ucdavis.edu/~duncan/)

The code also occasionally calls:

- the [`downloader`](https://github.com/wch/downloader) package by [Winston Chang](github.com/wch), to download files from HTTPS links, 
- the [`ggmap`](https://github.com/dkahle/ggmap) package by [David Kahle](https://github.com/dkahle) and [Hadley Wickham](https://github.com/hadley), to geocode constituencies,
- the [`jsonlite`](https://github.com/jeroenooms/jsonlite) package by [Jeroen Ooms](https://github.com/jeroenooms), to parse JSON data, and 
- the [`RPostgreSQL`](http://cran.r-project.org/web/packages/RPostgreSQL/) package by [Joe Conway](http://www.joeconway.com/) and others, to import RPostgreSQL data

The code should be executed in R ≥ 3.0.3. Although most packages require R ≥ 2.14.0, `RPostgreSQL` requires R ≥ 2.9.0, and R ≥ 3.0.3 is required to avoid a [small bug](https://github.com/hadley/lubridate/issues/194) that affects the conversion of French dates.

The code further requires to install the development version of `dplyr` with the `devtools` package:

```{r}
devtools::install_github("hadley/dplyr") 
```

The version of `dplyr` that is currently on CRAN is version 0.3.0.2, and requires R ≥ 3.1. It contains a [bug](https://github.com/hadley/dplyr/issues/783) that will cause a fatal error in the scraper for the Belgian lower chamber. The current development version `dplyr` is version 0.3.0.9000 and requires only R ≥ 3.0.2.

All other packages can be installed from CRAN.

The scripts that handle the French upper chamber require a PostgreSQL installation: see the [`README`](https://github.com/briatte/parlement/blob/master/README.md) file of the [`parlement`](https://github.com/briatte/parlement) repository for further details.
