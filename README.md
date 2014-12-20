This repository contains [R](http://www.r-project.org/) code to build and plot legislative cosponsorship networks in 18 parliamentary chambers from 14 European countries:

| | | | |
|:----------------------------------------------|:----------------------------------------------:|:--------------------------------------------------:|:-------------------------------------:|
| **Austria** (lower/national chamber only)     | [code](https://github.com/briatte/nationalrat) | [plots](http://briatte.org/nationalrat/plots.html) | [viz](http://briatte.org/nationalrat) |
| **Belgium** (both chambers)                   | [code](https://github.com/briatte/belparl)     | [plots](http://briatte.org/belparl/plots.html)     | [viz](http://briatte.org/belparl)     |
| **Bulgaria**                                  | [code](https://github.com/briatte/bgparl)      | [plots](http://briatte.org/bgparl/plots.html)      | [viz](http://briatte.org/bgparl)      |
| **Czech Republic** (lower chamber only)       | [code](https://github.com/briatte/poslanecka)  | [plots](http://briatte.org/poslanecka/plots.html)  | [viz](http://briatte.org/poslanecka)  |
| **Denmark**                                   | [code](https://github.com/briatte/folketinget) | [plots](http://briatte.org/folketinget/plots.html) | [viz](http://briatte.org/folketinget) |
| **Finland**                                   | [code](https://github.com/briatte/eduskunta)   | [plots](http://briatte.org/eduskunta/plots.html)   | [viz](http://briatte.org/eduskunta)   |
| **France** (both chambers)                    | [code](https://github.com/briatte/parlement)   | [plots](http://briatte.org/parlement/plots.html)   | [viz](http://briatte.org/parlement)   |
| **Iceland**                                   | [code](https://github.com/briatte/althing)     | [plots](http://briatte.org/althing/plots.html)     | [viz](http://briatte.org/althing)     |
| **Italy** (both chambers)                     | [code](https://github.com/briatte/parlamento)  | [plots](http://briatte.org/parlamento/plots.html)  | [viz](http://briatte.org/parlamento)  |
| **Lithuania**                                 | [code](https://github.com/briatte/seimas)      | [plots](http://briatte.org/seimas/plots.html)      | [viz](http://briatte.org/seimas)      |
| **Norway**                                    | [code](https://github.com/briatte/stortinget)  | [plots](http://briatte.org/stortinget/plots.html)  | [viz](http://briatte.org/stortinget)  |
| **Romania** (both chambers)                   | [code](https://github.com/briatte/parlamentul) | [plots](http://briatte.org/parlamentul/plots.html) | [viz](http://briatte.org/parlamentul) |
| **Sweden**                                    | [code](https://github.com/briatte/riksdag)     | [plots](http://briatte.org/riksdag/plots.html)     | [viz](http://briatte.org/riksdag)     |
| **Switzerland** (lower/national chamber only) | [code](https://github.com/briatte/swparl)      | [plots](http://briatte.org/swparl/plots.html)      | [viz](http://briatte.org/swparl)      |

See the [`parlviz`](https://github.com/briattte/parlviz) repository for additional code to run the [interactive visualizations](http://briatte.org/).

# HOWTO

Each folder contains:

- `make.r` – main entry point
- `load.r` – package loader
- `parties.r` – party information
- `functions.r` – network functions
- `data.r` – scrapers for bills and sponsors
- `build.r` – network building routines

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

All networks are [collapsed one-mode projections](http://solomonmessing.wordpress.com/2012/09/30/working-with-bipartiteaffiliation-network-data-in-r/) of bill-sponsor bipartite graphs, built from the following sources:

* Bills and sponsors are scraped from official parliament websites or from their open data portals.
* Party colors are approximate matches to those found on Wikipedia (checked in several languages).
* Party [Left/Right scores](http://parlgov.org/stable/documentation/party-position.html) are from [ParlGov stable](http://parlgov.org/stable/) (12/10) or from [ParlGov beta](http://dev.parlgov.org/).

The directed and valued cosponsorship networks produced from that data carry the following attributes:

- Vertex-level attributes
	- Socio-demographics
		- `born` and `sex`: year of birth and gender
		- `nyears`: seniority, i.e. years spent in the same chamber before the legislature started
	- Descriptive information
		- `url` and `photo`: shortened URLs to the profile and photo of the sponsor
		- `constituency`: constituency, when it was available
	- Party information
		- `party` and `partyname`: simplified political party/group abbreviation and full name
		- `lr`: Left/Right party score
	- Centrality measures
		- `degree`, `distance` and `clustering`: [weighted local measures](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/ "Opsahl 2010"), using all three weighting schemes
- Edge-level attributes:
	- `raw` are “raw edge counts”, i.e. the number of cosponsorship ties between two sponsors
	- `nfw` are “[Newman](http://www-personal.umich.edu/~mejn/papers/016132.pdf "Newman 2001")-[Fowler](http://jhfowler.ucsd.edu/best_connected_congressperson.pdf "Fowler 2006") weights”, i.e. the weighted quantity of bills cosponsored
	- `gsw` are “[Gross-Shalizi](http://www.latinodecisions.com/files/4013/3840/2978/Gross-Kirkland-Shalizi_Multilevel-Cosponsorship_PolAnlys-submission.pdf "Gross, Kirkland and Shalizi 2012") weights”, i.e. the weighted propensity to cosponsor
- Network-level attributes
	- `degree`, `distance` and `clustering`: [weighted global measures](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/ "Opsahl 2010"), using all three weighting schemes
	- `modularity`: empirical party-based [modularity](http://arxiv.org/abs/physics/0602124 "Newman 2006"), computed against all three kinds of edge weights
	- `modularity_maximized`: [maximized modularity](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1437055 "Waugh et al. 2012"), using [Walktrap](http://arxiv.org/abs/physics/0512106 "Pons and Latapy 2005") over random steps 1-50
	- `modularity_ratio`: empirical / maximized modularity ratio

# ISSUES

Please report bugs or suggestions for improvements as [issues](issues).

Known limitations of the current version are:

* **No self-updating mechanism: the data has to be refreshed manually.**
	* this step would probably require recoding all scrapers in Python to run them through ScraperWiki
	* this would only improve ongoing legislatures, and would still require manual updates after website upgrades
* **Network errors in download loops require to rerun some of the scripts.**
	* some but not all scripts contain exception lists of URLs to skip over the (little amount of) errors
	* some errors are permanent: the loops cannot be trapped in (what would be infinite) `while` statements
* **Some parts of the code are sluggish, or at least could run much faster.**
	* `dplyr` could replace `plyr` in virtually every script; this would bump software dependency to R ≥ 3.1
	* the networks are built from edge lists; the same results might be reached faster from adjacency matrixes
* **Some variables do not use standardised names or have many missing values.**
	* variables with high missing counts: `born` and `constituency`
	* variables that are missing entirely: `committee` (complex to observe comparatively) and electoral candidacy

It is also technically feasable to plot the networks as bipartite graphs, with bills as the primary mode and sponsors as the secondary mode, by using sparse matrixes and only slightly different visualization code. The bills, however, have very little attributes of their own (only a few chambers provide keywords or legislative outcomes).

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
