Each repository contains:

- `make.r` – main entry point
- `load.r` – package loader
- `parties.r` – party information
- `functions.r` – network functions
- `data.r` – scrapers for bills and sponsors
- `build.r` – network building routines
- `comm.r` – committee co-membership routine

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

The code should be executed in R ≥ 3.0.3 (although most packages require R ≥ 2.14.0, `RPostgreSQL` requires R ≥ 2.9.0, `dplyr` requires R >= 3.0.2 and R ≥ 3.0.3 is required to avoid a [small bug](https://github.com/hadley/lubridate/issues/194) that affects the conversion of French dates).

All packages can be installed from CRAN.

The scripts that handle the French upper chamber require a [PostgreSQL](https://www.postgresql.org/) installation: see the [`README`](https://github.com/briatte/parlement/blob/master/README.md) file of the [`parlement`](https://github.com/briatte/parlement) repository for further details.

The session information after loading all required packages in R 3.1.2 on Mac OSX looks like this:

```
R version 3.1.2 (2014-10-31)
Platform: x86_64-apple-darwin13.4.0 (64-bit)

locale:
[1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8

attached base packages:
[1] grid      splines   stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] downloader_0.3  jsonlite_0.9.14 RPostgreSQL_0.4 DBI_0.3.1       ggmap_2.3       ggplot2_1.0.0   tnet_3.0.11    
 [8] survival_2.37-7 rgexf_0.14.3.11 Rook_1.1-1      sna_2.3-2       network_1.11.3  igraph_0.7.1    XML_3.98-1.1   
[15] stringr_0.6.2   dplyr_0.4.1    

loaded via a namespace (and not attached):
 [1] assertthat_0.1      bitops_1.0-6        brew_1.0-6          colorspace_1.2-4    digest_0.6.8       
 [6] gtable_0.1.2        magrittr_1.5        mapproj_1.2-2       maps_2.3-9          MASS_7.3-37        
[11] munsell_0.4.2       parallel_3.1.2      plyr_1.8.1          png_0.1-7           proto_0.3-10       
[16] Rcpp_0.11.3         RCurl_1.95-4.5      reshape2_1.4.1      RgoogleMaps_1.2.0.6 rjson_0.2.15       
[21] RJSONIO_1.3-0       scales_0.2.4        tools_3.1.2        
```
