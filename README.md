This repository contains [R](http://www.r-project.org/) code to build and plot legislative cosponsorship networks in 18 parliamentary chambers from 14 European countries:

- [Austria](nationalrat) (lower/national chamber only)
- [Belgium](belparl) (both chambers)
- [Bulgaria](bgparl)
- [Czech Republic](poslanecka) (lower chamber only)
- [Denmark](folketinget)
- [Finland](eduskunta)
- [France](parlement) (both chambers)
- [Iceland](althing)
- [Italy](parlamento) (both chambers)
- [Lithuania](seimas)
- [Norway](stortinget)
- [Romania](parlamentul) (both chambers)
- [Sweden](riksdag)
- [Switzerland](swparl) (lower/national chamber only)

See the [`parlviz`](https://github.com/briatte/parlviz) repository for [interactive visualizations](http://briatte.org/) of the networks.

# HOWTO

Each folder contains:

- `make.r` -- main entry point
- `load.r` -- package loader
- `parties.r` -- party colors and [ParlGov Left/Right scores](http://parlgov.org/stable/documentation/party-position.html)
- `functions.r` -- network functions
- `data.r` -- scrapers for bills and sponsors
- `build.r` -- network building, plotting and export routines

The `README` files in each folder contain further technical notes for replication purposes.

# CODE

Each repository depends on:

- [`ggplot2`](https://github.com/hadley/ggplot2), 
[`plyr`](https://github.com/hadley/plyr) and 
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

Most packages require R ≥ 2.14.0, and `RPostgreSQL` requires R ≥ 2.9.0. Although R ≥ 3.0 is not technically required to run the code, it still seems like a good idea to go with it.

The `ggnet_save` function uses code from the `ggnet` function, by [Moritz Marbach](https://github.com/sumtxt) and myself. The complete function is published in the [`GGally`](https://github.com/ggobi/ggally) package 
by [Barret Schloerke](https://github.com/schloerke). 

The `str_clean` and `str_space` text cleaning functions are lightweight remixes of the `scrubber` and `Trim` functions found in the very rich [`qdap`](https://github.com/trinker/qdap/) package by [Tyler Rinker](https://github.com/trinker/).

# DATA

* Bills and sponsors are scraped from official parliament websites or from their open data portals.
* Party colors are approximate matches to those found on Wikipedia.
* Left/Right scores are from [ParlGov stable](http://parlgov.org/stable/) (12/10) or from [ParlGov beta](http://dev.parlgov.org/).

The cosponsorship networks produced from that data have several kinds of attributes:

- vertex-level attributes:
	- socio-demographics -- age, sex and seniority, measured as years spent in the same chamber before the legislature started
	- descriptive information -- shortened URLs to the profile and photo of the sponsor, and constituency when it was available
	- party information -- simplified political party/group abbreviation and ParlGov party-level Left/Right score, from 0 to 10
	- centrality measures -- weighted degree, distance and clustering ([Opsahl 2010](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/)), computed against all three kinds of edge weights
- edge-level attributes:
	- "raw edge counts", i.e. the number of cosponsorship ties between two sponsors
	- "Newman-Fowler weights", i.e. weighted quantity of bills cosponsored ([Newman 2001](http://www-personal.umich.edu/~mejn/papers/016132.pdf), [Fowler 2006](http://jhfowler.ucsd.edu/best_connected_congressperson.pdf))
	- "Gross-Shalizi weights", i.e. weighted propensity to cosponsor ([Gross, Kirkland and Shalizi 2012](http://www.latinodecisions.com/files/4013/3840/2978/Gross-Kirkland-Shalizi_Multilevel-Cosponsorship_PolAnlys-submission.pdf))
- network-level attributes:
	- empirical party-based modularity, computed against all three kinds of edge weights
	- maximized modularity ([Waugh _et al._ 2012](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1437055)), using the Walktrap algorithm ([Pons and Latapy 2005](http://arxiv.org/abs/physics/0512106)) over random steps 1-50, as in [Waugh _et al._ 2009](http://arxiv.org/abs/0907.3509), Section 2.3

See the working paper for further details on the network data.

# ISSUES

Please report bugs or suggestions for improvements as [issues](issues).

Known limitations of the current version are:

* no self-updating mechanism: the data has to be refreshed manually
	* this step would probably require recoding all scrapers in Python to run them through ScraperWiki; good luck with that
	* the effort would only improve ongoing legislatures, and would still require updating the code after website upgrades
* network errors in download loops require to rerun some of the scripts
	* some network errors are permanent: the loops cannot be trapped in (what would be infinite) `while` statements
	* some but not all scripts contain exception lists of URLs to skip over the (little amount of) errors when they can be avoided
* some parts of the code are sluggish, or at least could run much faster
	* `dplyr` could be substituted to `plyr` in virtually every script; this would bump software dependency to R ≥ 3.1
	* the networks are built from directed edge lists; the same results might be reached faster with adjacency matrixes
* some variables do not use standardised names or have many missing values
	* variables that could be improved: `born` (sometimes patchy) and `constituency` (would require standardising all names)
	* variables that are missing entirely: `committee` (highly complex to observe comparatively) and electoral candidacy

It is also technically feasable to build the networks as bipartite graphs, with bills as the primary mode and sponsors as the secondary mode, by using sparse matrixes and slightly different visualization code. The bills, however, are very little attributes of their own (only a few chambers provide keywords or legislative outcomes).

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
