# HOWTO

The `parlnet` repository contains links to other repositories, which each track the code to build the networks of a specific country. To get all the code at once, clone this repository with [Git](https://git-scm.com/download/) and update its submodules:

```git
git clone https://github.com/briatte/parlnet
cd parlnet
git submodule update --init
```

The `parlnet` repository is [versioned](https://github.com/briatte/parlnet/releases). Cloning the most recent version of the repository, as recommended above, will clone the most recent release and the changes that have been applied to it since publication.

__The main entry point of each repository is `make.r`.__ Each repository also contains the following scripts, which are run in that order by `make.r`:

- `load.r` – package loading (see [dependencies](#dependencies))
- `parties.r` – party codes, colors, names and scores
- `functions.r` – network and text utilities
- `data.r` – scrapers for bills and sponsors
- `build.r` – the network building routine
- `comm.r` – the committee co-membership routine

The contents of the `functions.r` script is identical across all repositories. Some of the other scripts are occasionally broken into several files when there is more than one parliamentary chamber in the country.

> __Note:__ the scripts that handle the French upper chamber require a [PostgreSQL](https://www.postgresql.org/) installation; see the [`README`](https://github.com/briatte/parlement/blob/master/README.md) file of the [`parlement`](https://github.com/briatte/parlement) repository for further details. Once PostgreSQL is installed, the repository contains a [shell script](https://github.com/briatte/parlement/blob/master/psql.sh) that handles all required operations. This is the only dependency external to R in the entire `parlnet` repository. The same repository also contains an additional set of functions to clean up French names and identify legislatures.

__To build the networks of any given country__, set your working directory to its repository and run the `make.r` script after checking the list of package dependencies below. The `plot` and `gexf` boolean parameters can be set to `FALSE` to skip over network plots (see below).

The code will create a series of folders to store the results:

- __Raw data__ are stored in `raw`. All raw data are scraped from official parliamentary websites, generally as JSON or HTML files. The code will look for any zipped raw data folder named `raw.zip` to start with, and will do the same for `photos` or variations of it. This makes it easy to update the networks, which only requires to remove the `data` folder and to run the code.
	
	The `raw` data folders are often internally organised in several subfolders containing bill indexes (lists of bills), bill pages, sponsor indexes and sponsor pages. The folder hierarchy is created by `make.r` if it does not exist.
	
	The [`README`](https://github.com/briatte/parlnet/blob/master/README.md) contains a link to the raw data collected by the most recent release of `parlnet`, in order to make it easy to replicate all networks in a limited amount of time (less than half an hour).

- __Derived datasets__ are stored in `data` as CSV files, along with the final networks, which are stored as `network` objects in a `.rda` file. The objects include weighted cosponsorship directed networks (prefix `net_`) and, when possible, weighted committee co-membership undirected networks (prefix `conet_`). See the [`parlnet.csv`](https://github.com/briatte/parlnet/blob/master/parlnet.csv) dataset for measures derived from them.

	The network-level (chamber-level), vertex-level (sponsor-level) and edge-level (edge weights) attributes of the networks are documented in full in [the appendix](http://f.briatte.org/research/parlnet-appendix.pdf) to the repository.

	The `.rda` file produced by each country will also contain the raw bills data (as `bills_` objects) and the raw edge lists (as `edges_` objects) used during network construction.
	
	The [`parlnet.rda`](https://github.com/briatte/parlnet/blob/master/parlnet.rda) file contains the `net_` and `conet_` network objects produced for each country, as obtained from a clean run of all `make.r` scripts contained in the repository.

- __Network plots__ will appear in `plots` as JPG and PDF files. The PDF files include a legend with the party abbreviations corresponding to each node color. Both plots size nodes proportionally to their degree quartile and place them by [Fruchterman-Reingold placement](https://en.wikipedia.org/wiki/Force-directed_graph_drawing). Last, edges are coloured by shared party affiliation when relevant. Plotting can be skipped by setting `plot` to `FALSE` in `make.r`.

	The placement method used in the plots can be changed to any method supported by the `sna` package (e.g. `kamadakawai`) by editing the value of the `mode` object in `make.r`.

- __Sponsor photos__ are stored in `photos`, or some variation of it if there is more than one parliamentary chamber in the country. Sponsor photos are only used in the [interactive visualizations](http://f.briatte.org/parlviz) of the networks, which are based on [GEXF](http://gexf.net/format/) exports of the networks. The exports will be saved to the root of the repository. Exporting can be skipped by setting `gexf` to `FALSE` in `make.r`.

The `parlnet.log` file gives the estimated runtime of each repository when the raw data and derived datasets already exist on disk, and when plotting and exporting the networks is skipped. On a standard laptop, replicating the `parlnet.rda` object by running all repositories takes approximately half an hour.

# DEPENDENCIES

Each repository depends on:

- [`dplyr`](https://github.com/hadley/dplyr), [`ggplot2`](https://github.com/hadley/ggplot2), [`httr`](https://github.com/hadley/httr) and [`stringr`](https://github.com/hadley/stringr), by [Hadley Wickham](https://github.com/hadley)
- [`grid`](https://www.stat.auckland.ac.nz/~paul/grid/grid.html), by [Paul Murrell](https://www.stat.auckland.ac.nz/~paul/) (distributed with R)
- [`network`](http://cran.r-project.org/web/packages/network/) and [`sna`](http://cran.r-project.org/web/packages/sna/), by [Carter T. Butts](http://erzuli.ss.uci.edu/~buttsc/) and others
- [`rgexf`](http://bitbucket.org/gvegayon/rgexf), by [George Vega Yon](http://bitbucket.org/gvegayon/) and others
- [`XML`](http://cran.r-project.org/web/packages/XML/), by [Duncan Temple Lang](http://www.stat.ucdavis.edu/~duncan/)

The code also occasionally calls:

- the [`jsonlite`](https://github.com/jeroenooms/jsonlite) package by [Jeroen Ooms](https://github.com/jeroenooms), to parse JSON data,
- the [`rvest`](https://github.com/hadley/rvest) package by [Hadley Wickham](https://github.com/hadley), to simplify HTML parsing

All packages can be installed from [CRAN](https://cran.r-project.org/).

__As of August 2015, the code requires R ≥ 3.1.2__ in order to support `dplyr`. Example session information after loading all required packages is copied below.

```txt
R version 3.2.2 (2015-08-14)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: OS X 10.9.5 (Mavericks)

locale:
[1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods  
[8] base     

other attached packages:
 [1] jsonlite_0.9.17    rvest_0.3.1        xml2_0.1.2         ggplot2_1.0.1.9003
 [5] sna_2.3-2          network_1.13.0     rgexf_0.15.3       igraph_1.0.1      
 [9] Rook_1.1-1         XML_3.98-1.3       stringr_1.0.0      httr_1.0.0        
[13] dplyr_0.4.3       

loaded via a namespace (and not attached):
 [1] Rcpp_0.12.2      magrittr_1.5     munsell_0.4.2    colorspace_1.2-6
 [5] R6_2.1.1         brew_1.0-6       plyr_1.8.3       tools_3.2.2     
 [9] parallel_3.2.2   gtable_0.1.2     DBI_0.3.1        assertthat_0.1  
[13] stringi_1.0-1    scales_0.3.0
```

> __Notes:__
> 
> * The `save_plot` function found in `functions.r` uses code from the `ggnet` function, by [Moritz Marbach](https://github.com/sumtxt) and myself. The complete function is published in the [`GGally`](https://github.com/ggobi/ggally) package by [Barret Schloerke](https://github.com/schloerke). See the [`ggnet`](https://github.com/briatte/ggnet) repository for the full function code with many examples.
> * The `str_clean` and `str_space` text cleaning functions found in `functions.r` are lightweight remixes of the `scrubber` and `Trim` functions found in the very rich [`qdap`](https://github.com/trinker/qdap/) package by [Tyler Rinker](https://github.com/trinker/).
