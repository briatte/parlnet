# HOWTO

The `parlnet` repository contains links to other repositories, which each track the code to build the networks of a specific country. To get all the code at once, clone this repository with [Git](https://git-scm.com/download/) and update its submodules:

```git
git clone https://github.com/briatte/parlnet
cd parlnet
git submodule update --init
```

__The main entry point of each repository is `make.r`.__ Each repository also contains the following scripts, which are run in that order by `make.r`:

- `load.r` – package loading
- `parties.r` – party codes, colors and names
- `functions.r` – network and text utilities
- `data.r` – scrapers for bills and sponsors
- `build.r` – the network building routine
- `comm.r` – the committee co-membership routine

The contents of the `functions.r` script is identical across all repositories, and the `data.r` and `build.r` scripts are occasionally broken into several files when there is more than one parliamentary chamber in the country.

__To build the networks of any given country__, set your working directory to its repository and run the `make.r` script after checking the list of package dependencies below. The `plot` and `gexf` boolean parameters can be set to `FALSE` to skip over network plots (see below).

The code will create a series of folders to store the results:

- __Raw data__ will be stored in `raw`. These will almost always be HTML pages scraped from official parliamentary websites, or in the case of [Sweden](https://github.com/briatte/riksdag), JSON objects downloaded from its open data portal. The code for the [French Senate](https://github.com/briatte/parlement) requires to download and import PostgreSQL data manually, and the code for [Hungary](https://github.com/briatte/orszaggyules) requires to download a few bill indexes manually.
- __Derived datasets__ will be stored in `data` as CSV files, along with the final networks, which will be stored as `network` objects in as many `.rda` files as there are parliamentary chambers in the country, except for [Italy](https://github.com/briatte/parlamento) and [Romania](https://github.com/briatte/parlamentul), where the networks of both chambers are stored as a single `rda` file. See the [`parlnet-data`](https://github.com/briatte/parlnet-data) repository for details on network attributes.
- __Network plots__ will appear in `plots` as JPG and PDF files. The only difference between both formats is that the PDF plots include a legend showing the abbreviated party affiliations of the sponsors, on which the node colors are based. The plots can be skipped by setting `plot` to `FALSE` in `make.r`.
- __Sponsor photos__ will be stored in `photos` or some variation of `photos_` if there is more than one parliamentary chamber in the country. The photos are only used in the [interactive visualizations](http://f.briatte.org/parlviz) of the networks, which are based on [GEXF](http://gexf.net/format/) versions of the networks. The GEXF exports will be saved to the root of the repository, and can be skipped by setting `gexf` to `FALSE` in `make.r`.

# DEPENDENCIES

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
- the [`httr`](https://github.com/hadley/httr) package by [Hadley Wickham](https://github.com/hadley), to handle unusual HTTP calls,
- the [`jsonlite`](https://github.com/jeroenooms/jsonlite) package by [Jeroen Ooms](https://github.com/jeroenooms), to parse JSON data,
- the [`readr`](https://github.com/hadley/readr) package by [Hadley Wickham](https://github.com/hadley) and others, to speed up CSV input/output,
- the [`rvest`](https://github.com/hadley/rvest) package by [Hadley Wickham](https://github.com/hadley), to simplify HTML parsing, and
- the [`RPostgreSQL`](http://cran.r-project.org/web/packages/RPostgreSQL/) package by [Joe Conway](http://www.joeconway.com/) and others, to import PostgreSQL data

All packages can be installed from [CRAN](https://cran.r-project.org/).

__As of July 2015, the code requires R ≥ 3.1.2__ in order to support version 0.4.2 of `dplyr` and to avoid a [small bug](https://github.com/hadley/lubridate/issues/194) that affects the conversion of French dates in versions of R below 3.0.3. Example session information after loading all required packages is copied below.

```txt
R version 3.2.1 (2015-06-18)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: OS X 10.9.5 (Mavericks)

locale:
[1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] downloader_0.4  jsonlite_0.9.16 RPostgreSQL_0.4 DBI_0.3.1      
 [5] ggmap_2.4       rvest_0.2.0     readr_0.1.1     httr_1.0.0     
 [9] ggplot2_1.0.1   tnet_3.0.11     survival_2.38-3 rgexf_0.15.3   
[13] Rook_1.1-1      sna_2.3-2       network_1.12.0  igraph_1.0.1   
[17] XML_3.98-1.3    stringr_1.0.0   dplyr_0.4.2    

loaded via a namespace (and not attached):
 [1] Rcpp_0.11.6         plyr_1.8.3          tools_3.2.1        
 [4] digest_0.6.8        gtable_0.1.2        lattice_0.20-33    
 [7] png_0.1-7           rstudioapi_0.3.1    mapproj_1.2-3      
[10] parallel_3.2.1      proto_0.3-10        maps_2.3-10        
[13] RgoogleMaps_1.2.0.7 R6_2.1.0            jpeg_0.1-8         
[16] RJSONIO_1.3-0       sp_1.1-1            reshape2_1.4.1     
[19] magrittr_1.5        scales_0.2.5        splines_3.2.1      
[22] MASS_7.3-43         assertthat_0.1      colorspace_1.2-6   
[25] geosphere_1.4-3     brew_1.0-6          stringi_0.5-5      
[28] munsell_0.4.2       rjson_0.2.15
```

# NOTES

* The scripts that handle the French upper chamber require a [PostgreSQL](https://www.postgresql.org/) installation: see the [`README`](https://github.com/briatte/parlement/blob/master/README.md) file of the [`parlement`](https://github.com/briatte/parlement) repository for further details. The `makeCxn` and `fetchQuery` PostgreSQL query functions found in the [`functions-pgsql.r`](https://github.com/briatte/parlement/blob/master/functions-pgsql.r) file of that repository are by [Erik Gregory](https://anrprogrammer.wordpress.com/2013/07/27/easier-database-querying-with-r/).
* The `ggnet_save` function uses code from the `ggnet` function, by [Moritz Marbach](https://github.com/sumtxt) and myself. The complete function is published in the [`GGally`](https://github.com/ggobi/ggally) package by [Barret Schloerke](https://github.com/schloerke).
* The `str_clean` and `str_space` text cleaning functions are lightweight remixes of the `scrubber` and `Trim` functions found in the very rich [`qdap`](https://github.com/trinker/qdap/) package by [Tyler Rinker](https://github.com/trinker/).
