# SOURCES

* bills and sponsors are scraped from official parliament websites or from their open data portals
* party colors are, as often as possible, approximate matches to those found on Wikipedia (several languages)
* party [Left/Right scores](http://www.parlgov.org/documentation/party-positions/) are from [ParlGov stable](http://www.parlgov.org/static/static-2014/stable/data.html) (14/12) or [ParlGov beta](http://www.parlgov.org/)

# VARIABLES

Each network carries the following attributes:

- Vertex-level attributes
	- Socio-demographics
		- `born`: year of birth, when it was available (completely missing for Hungary)
		- `sex`: gender (sometimes imputed from first names, family names, or both)
		- `nyears`: seniority, i.e. years spent in the same chamber before the legislature started
	- Descriptive information
		- `url` and `photo`: shortened URLs to the profile and photo of the sponsor
		- `constituency`: constituency, generally as the URL to the Wikipedia entry (see note)
	- Party information
		- `party` and `partyname`: simplified political party/group abbreviation and full name
		- `lr`: Left/Right party score
	- Centrality measures
		- `n_au` and `n_co`: raw counts of bills authored and cosponsored
		- `n_bills`: the sum of `n_au` and `n_co`
		- `degree`, `distance` and `clustering`: [weighted local measures](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/ "Opsahl 2010")
- Edge-level attributes:
	- `raw` are “raw edge counts”, i.e. the number of cosponsorship ties between two sponsors
	- `nfw` are “[Newman](http://www-personal.umich.edu/~mejn/papers/016132.pdf "Newman 2001")-[Fowler](http://jhfowler.ucsd.edu/best_connected_congressperson.pdf "Fowler 2006") weights”, i.e. the weighted quantity of bills cosponsored
	- `gsw` are “[Gross-Shalizi](http://www.latinodecisions.com/files/4013/3840/2978/Gross-Kirkland-Shalizi_Multilevel-Cosponsorship_PolAnlys-submission.pdf "Gross, Kirkland and Shalizi 2012") weights”, i.e. the weighted propensity to cosponsor
- Network-level attributes
	- `degree`, `distance` and `clustering`: [weighted global measures](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/ "Opsahl 2010")
	- `modularity`: empirical party-based [modularity](http://arxiv.org/abs/physics/0602124 "Newman 2006")
	- `modularity_maximized`: [maximized modularity](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1437055 "Waugh et al. 2012"), using [Walktrap](http://arxiv.org/abs/physics/0512106 "Pons and Latapy 2005") over random steps 1-50
	- `modularity_ratio`: empirical / maximized modularity ratio

Each network is also saved in undirected form, with the `committee` edge attribute indicating the number of parliamentary committees that list both sponsors as their members.

Note -- exceptions to constituencies being coded as Wikipedia handles are:

- there are no constituencies in the electoral system of the Belgian Senate
- Swiss constituencies are coded in multilingual French/German/Italian text
- Lithuanian districts or district municipalities are not mapped to entries

Furthermore, due to a redistricting reform, many constituencies are missing in the Swedish data for years prior to 2002.

* * *

It is also technically feasable to build and plot the networks as bipartite graphs, with bills as the primary mode and sponsors as the secondary mode, by using [sparse matrixes](http://solomonmessing.wordpress.com/2012/09/30/working-with-bipartiteaffiliation-network-data-in-r/) and only slightly different visualization code. The bills, however, have very little attributes of their own (only a few chambers provide keywords or legislative outcomes).
