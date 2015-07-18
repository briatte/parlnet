This repository contains [R](http://www.r-project.org/) code to build and plot legislative cosponsorship networks in 19 parliamentary chambers from 15 European countries:

| Country / Chamber | | | | |
|:----------------------------------------------|:----------------------------------------------:|:----------------------------------------------------------:|:------------------------------------------------------------:|:-----------------------------------------------:|
| **Austria** (lower/national chamber only)     | [code](https://github.com/briatte/nationalrat) | [README](https://github.com/briatte/nationalrat/README.md) | [plots](http://f.briatte.org/parlviz/nationalrat/plots.html) | [viz](http://f.briatte.org/parlviz/nationalrat) |
| **Belgium** (both chambers)                   | [code](https://github.com/briatte/belparl)     | [README](https://github.com/briatte/belparl/README.md)     | [plots](http://f.briatte.org/parlviz/belparl/plots.html)     | [viz](http://f.briatte.org/parlviz/belparl)     |
| **Bulgaria**                                  | [code](https://github.com/briatte/bgparl)      | [README](https://github.com/briatte/bgparl/README.md)      | [plots](http://f.briatte.org/parlviz/bgparl/plots.html)      | [viz](http://f.briatte.org/parlviz/bgparl)      |
| **Czech Republic** (lower chamber only)       | [code](https://github.com/briatte/poslanecka)  | [README](https://github.com/briatte/poslanecka/README.md)  | [plots](http://f.briatte.org/parlviz/poslanecka/plots.html)  | [viz](http://f.briatte.org/parlviz/poslanecka)  |
| **Denmark**                                   | [code](https://github.com/briatte/folketinget) | [README](https://github.com/briatte/folketinget/README.md) | [plots](http://f.briatte.org/parlviz/folketinget/plots.html) | [viz](http://f.briatte.org/parlviz/folketinget) |
| **Finland**                                   | [code](https://github.com/briatte/eduskunta)   | [README](https://github.com/briatte/eduskunta/README.md)   | [plots](http://f.briatte.org/parlviz/eduskunta/plots.html)   | [viz](http://f.briatte.org/parlviz/eduskunta)   |
| **France** (both chambers)                    | [code](https://github.com/briatte/parlement)   | [README](https://github.com/briatte/parlement/README.md)   | [plots](http://f.briatte.org/parlviz/parlement/plots.html)   | [viz](http://f.briatte.org/parlviz/parlement)   |
| **Hungary**                                   | [code](https://github.com/briatte/orszaggyules)| [README](https://github.com/briatte/orszaggyules/README.md)| [plots](http://f.briatte.org/parlviz/orszaggyules/plots.html)| [viz](http://f.briatte.org/parlviz/orszaggyules)|
| **Iceland**                                   | [code](https://github.com/briatte/althing)     | [README](https://github.com/briatte/althing/README.md)     | [plots](http://f.briatte.org/parlviz/althing/plots.html)     | [viz](http://f.briatte.org/parlviz/althing)     |
| **Italy** (both chambers)                     | [code](https://github.com/briatte/parlamento)  | [README](https://github.com/briatte/parlamento/README.md)  | [plots](http://f.briatte.org/parlviz/parlamento/plots.html)  | [viz](http://f.briatte.org/parlviz/parlamento)  |
| **Lithuania**                                 | [code](https://github.com/briatte/seimas)      | [README](https://github.com/briatte/seimas/README.md)      | [plots](http://f.briatte.org/parlviz/seimas/plots.html)      | [viz](http://f.briatte.org/parlviz/seimas)      |
| **Norway**                                    | [code](https://github.com/briatte/stortinget)  | [README](https://github.com/briatte/stortinget/README.md)  | [plots](http://f.briatte.org/parlviz/stortinget/plots.html)  | [viz](http://f.briatte.org/parlviz/stortinget)  |
| **Romania** (both chambers)                   | [code](https://github.com/briatte/parlamentul) | [README](https://github.com/briatte/parlamentul/README.md) | [plots](http://f.briatte.org/parlviz/parlamentul/plots.html) | [viz](http://f.briatte.org/parlviz/parlamentul) |
| **Sweden**                                    | [code](https://github.com/briatte/riksdag)     | [README](https://github.com/briatte/riksdag/README.md)     | [plots](http://f.briatte.org/parlviz/riksdag/plots.html)     | [viz](http://f.briatte.org/parlviz/riksdag)     |
| **Switzerland** (lower/national chamber only) | [code](https://github.com/briatte/swparl)      | [README](https://github.com/briatte/swparl/README.md)      | [plots](http://f.briatte.org/parlviz/swparl/plots.html)      | [viz](http://f.briatte.org/parlviz/swparl)      |

# CONTENTS

This file contains:

- [notes on the data sources](#sources)
- [instructions for replication](#howto)
- [a list of package dependencies](#dependencies)
- [further notes on some functions](#notes)
- [a list of known limitations](#issues)
- [various acknowledgements](#thanks)
- [how to cite this repository](#citation)

All networks built by this repository are available from the [`parlnet-data`](https://github.com/briatte/parlnet-data) repository, along with detailed notes on each network attribute and some derived measures. The `README` file of each country-specific repository contains further details on code execution and data collection, as well as some further thanks to various people who provided help in various forms.

The code to produce [interactive visualizations](http://f.briatte.org/parlviz) of the networks is available from the [`parlviz`](https://github.com/briatte/parlviz) repository.

# SOURCES

* Bills and sponsors are scraped from official parliament websites or from their open data portals. All relevant sources are listed in the `README` file of each country-specific repository.
* Parliamentary group (party) colors are, as often as possible, approximate matches to those found on several linguistic versions of [Wikipedia](https://www.wikipedia.org/). When possible, parliamentary constituencies are also matched to Wikipedia entries.
* Party [Left/Right scores](http://www.parlgov.org/documentation/party-positions/) are taken from [ParlGov stable](http://www.parlgov.org/static/static-2014/stable/data.html) (14-12) or [ParlGov beta](http://www.parlgov.org/). The matching of political parties to parliamentary groups is documented in the `README` file of each country-specific repository.

# HOWTO

Each repository contains:

- `make.r` – main entry point
- `load.r` – package loader
- `parties.r` – party information
- `functions.r` – network functions
- `data.r` – scrapers for bills and sponsors
- `build.r` – network building routines
- `comm.r` – committee co-membership routine

The contents of the `functions.r` script is identical across all repositories, and the `data.r` and `build.r` scripts are occasionally broken into several files when there is more than one parliamentary chamber in the country.

To build the networks of any country, set your working directory to its repository and run the `make.r` script after checking the list of package dependencies below. The `plot` and `gexf` boolean parameters can be set to `FALSE` to skip over network plots (see below).

The code will create a series of folders to store the results:

- The raw data will be stored in `raw`. These will almost always be HTML pages scraped from official parliamentary websites, or in the case of [Sweden](https://github.com/briatte/riksdag), JSON objects downloaded from its open data portal. The code for the [French Senate](https://github.com/briatte/parlement) requires to download and import PostgreSQL data manually, and the code for [Hungary](https://github.com/briatte/orszaggyules) requires to download a few bill indexes manually.
- Datasets derived from the raw data will be stored in `data` as CSV files, along with the final networks, which will be stored as `network` objects in as many `.rda` files as there are parliamentary chambers in the country, except for [Italy](https://github.com/briatte/parlamento) and [Romania](https://github.com/briatte/parlamentul), where the networks of both chambers are stored as a single `rda` file. See the [`parlnet-data`](https://github.com/briatte/parlnet-data) repository for details on network attributes.
- Network plots will appear in `plots` as JPG and PDF files. The only difference between both formats is that the PDF plots include a legend showing the party abbreviations of the sponsors, on which the node colors are based. The plots can be skipped by setting `plot` to `FALSE` in `make.r`. 
- Sponsor mugshots will be stored in `photos` or some variation of `photos_` if there is more than one parliamentary chamber in the country. The mugshots are used in the [interactive visualizations](http://f.briatte.org/parlviz) of the networks, which are based on [GEXF](http://gexf.net/format/) versions of the networks. The GEXF exports will be saved to the root of the repository, and can be skipped by setting `gexf` to `FALSE` in `make.r`.

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
- the [`jsonlite`](https://github.com/jeroenooms/jsonlite) package by [Jeroen Ooms](https://github.com/jeroenooms), to parse JSON data, and 
- the [`RPostgreSQL`](http://cran.r-project.org/web/packages/RPostgreSQL/) package by [Joe Conway](http://www.joeconway.com/) and others, to import PostgreSQL data

All packages can be installed from [CRAN](https://cran.r-project.org/).

As of July 2015, the code requires R ≥ 3.1.2 to support version 0.4.2 of `dplyr` and to avoid a [small bug](https://github.com/hadley/lubridate/issues/194) that affects the conversion of French dates in versions of R below 3.0.3. Session information after loading all required packages is copied below.

```
R version 3.2.1 (2015-06-18)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: OS X 10.9.5 (Mavericks)

locale:
[1] en_GB.UTF-8/en_GB.UTF-8/en_GB.UTF-8/C/en_GB.UTF-8/en_GB.UTF-8

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods  
[8] base     

other attached packages:
 [1] downloader_0.4  jsonlite_0.9.16 RPostgreSQL_0.4 DBI_0.3.1      
 [5] ggmap_2.4       ggplot2_1.0.1   tnet_3.0.11     survival_2.38-3
 [9] rgexf_0.15.3    Rook_1.1-1      sna_2.3-2       network_1.12.0 
[13] igraph_1.0.1    XML_3.98-1.3    stringr_1.0.0   dplyr_0.4.2    

loaded via a namespace (and not attached):
 [1] Rcpp_0.11.6         plyr_1.8.3          tools_3.2.1        
 [4] digest_0.6.8        gtable_0.1.2        lattice_0.20-33    
 [7] png_0.1-7           mapproj_1.2-3       parallel_3.2.1     
[10] proto_0.3-10        RgoogleMaps_1.2.0.7 maps_2.3-10        
[13] R6_2.1.0            jpeg_0.1-8          RJSONIO_1.3-0      
[16] sp_1.1-1            reshape2_1.4.1      magrittr_1.5       
[19] scales_0.2.5        splines_3.2.1       MASS_7.3-43        
[22] assertthat_0.1      colorspace_1.2-6    geosphere_1.4-3    
[25] brew_1.0-6          stringi_0.5-5       munsell_0.4.2      
[28] rjson_0.2.15
```

# NOTES

The scripts that handle the French upper chamber require a [PostgreSQL](https://www.postgresql.org/) installation: see the [`README`](https://github.com/briatte/parlement/blob/master/README.md) file of the [`parlement`](https://github.com/briatte/parlement) repository for further details. The `makeCxn` and `fetchQuery` PostgreSQL query functions found in the [`functions-pgsql.r`](https://github.com/briatte/parlement/blob/master/functions-pgsql.r) file of that repository are by [Erik Gregory](https://anrprogrammer.wordpress.com/2013/07/27/easier-database-querying-with-r/).

The `ggnet_save` function uses code from the `ggnet` function, by [Moritz Marbach](https://github.com/sumtxt) and myself. The complete function is published in the [`GGally`](https://github.com/ggobi/ggally) package 
by [Barret Schloerke](https://github.com/schloerke).

The `str_clean` and `str_space` text cleaning functions are lightweight remixes of the `scrubber` and `Trim` functions found in the very rich [`qdap`](https://github.com/trinker/qdap/) package by [Tyler Rinker](https://github.com/trinker/).

# ISSUES

Please report bugs or suggestions as [issues](issues), either in this repository if the issue affects all countries, or in the country-specific repository otherwise.

Known limitations of the current code are:

* __There is no self-updating mechanism: the data has to be refreshed manually,__ because self-updating the code would probably require recoding all scrapers in Python for [ScraperWiki](https://scraperwiki.com/). It would improve data collection for ongoing legislatures only, and would still require manual updates after website upgrades.
* __Network errors in the download loops require to rerun some of the scripts:__ rerunning the `data.r` scripts two or three times is therefore highly recommended. Some (but not all) scripts contain exception lists to skip over the little amount of errors that might have occurred, but some errors are permanent HTTP 404's and cannot be solved.
* __Some parts of the code are sluggish, or at least could run much faster__ if bills and sponsors were collected through Python magic and stored as SQL tables instead of CSV files. Similarly, adjacency matrixes are probably faster than edge lists as network constructors, but are less practical for inspection and debugging purposes.
* __The bill-sponsor networks are not built as bipartite graphs:__ the code only builds the collapsed one-mode networks of cosponsorship ties between sponsors. Building the two-mode networks might require using [sparse matrixes](http://solomonmessing.wordpress.com/2012/09/30/working-with-bipartiteaffiliation-network-data-in-r/) and only slightly different visualization code. The bills, however, have very little attributes of their own (very few chambers provide legislative keywords and/or outcome information).
* __Some variables are based on manual or semi-manual imputations:__ the `sex` variable is often based on imputation from first names, family names, or both; and the `party` variable is often based on manual recodings or on "longest party affiliation throughout legislature" rules. These limitations are fully documented in the `README` files of each repository.
* __Some variables have many missing or unstandardised values:__ the `born` variable occasionally has high missing counts in upper houses and is completely missing in [Hungary](https://github.com/briatte/orszaggyules); the `constituency` variable is not available in pre-redistricted [Sweden](https://github.com/briatte/riksdag); the `committee` variable cannot be perfectly standardised across countries; and anything to do with electoral candidacy is unobserved.

# THANKS

- [Baptiste Coulmont][coulmont] and [James Fowler][fowler] inspired this project
- [Bram][bram] and [Stef][stef] encouraged me to learn [XPath](http://www.w3.org/TR/xpath/) syntax
- [Pedro Jordano][jordano] and [Moritz Marbach][marbach] helped with graph visualization
- [Mason Porter][porter] provided replication material for the U.S. Congress

[bram]: https://github.com/Psycojoker
[coulmont]: http://coulmont.com/blog/2011/09/02/travail-de-deputes/
[fowler]: http://jhfowler.ucsd.edu/cosponsorship.htm
[jordano]: https://pedroj.github.io/bipartite_plots/
[marbach]: https://sumtxt.wordpress.com/2011/07/02/visualizing-networks-with-ggplot2-in-r/
[porter]: http://people.maths.ox.ac.uk/porterm/
[stef]: https://github.com/stef

# CITATION

Please refer to this repository as:

```
François Briatte (2015). parlnet: Legislative Cosponsorship Networks for 19 Parliamentary Chambers in 15 European Countries. Version 1.3. URL: https://github.com/briatte/parlnet
```

- [author details](http://f.briatte.org/)
- [release notes](releases)
