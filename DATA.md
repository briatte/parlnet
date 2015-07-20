# SOURCES

* Bills and sponsors are scraped from official parliament websites or from their open data portals. All relevant sources are listed in the `README` file of each country-specific repository.
* Parliamentary group (party) colors are, as often as possible, approximate matches to those found on several linguistic versions of [Wikipedia](https://www.wikipedia.org/). When possible, parliamentary constituencies are also matched to Wikipedia entries.
* Party [Left/Right scores](http://www.parlgov.org/documentation/party-positions/) are taken from [ParlGov stable](http://www.parlgov.org/static/static-2014/stable/data.html) (14-12) or [ParlGov beta](http://www.parlgov.org/). The matching of political parties to parliamentary groups is documented in the `README` file of each country-specific repository.
* The number of sponsors in each country-chamber have been checked against the statutory parliamentary chamber sizes reported by [IPU-PARLINE][ipu] and in the [European Elections Database](http://www.nsd.uib.no/european_election_database/).

[ipu]: http://www.ipu.org/parline-e/parlinesearch.asp

# NETWORKS

The `parlnet.rda` file contains all network objects produced by the `parlnet` repository:

- objects starting with `net_` are legislative cosponsorship networks
- objects starting with `conet_` are committee co-membership networks

All objects are formatted in the R [`network`](http://www.jstatsoft.org/v24/i02/ "Butts 2008") class and carry the following attributes:

- Vertex-level attributes
	- Socio-demographics
		- `born`: year of birth, when it was available (completely missing for [Hungary](https://github.com/briatte/orszaggyules))
		- `sex`: gender (sometimes imputed from first names, family names, or both)
		- `nyears`: seniority, i.e. years spent in the same chamber before the legislature started (see note)
	- Descriptive information
		- `url` and `photo`: shortened URLs to the online profile and photo of the sponsor
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
	- `nfw` are “Newman-Fowler weights”, i.e. the weighted quantity of bills cosponsored (see note)
	- `gsw` are “Gross-Shalizi weights”, i.e. the weighted propensity to cosponsor (see note)
- Network-level attributes
	- `degree`, `distance` and `clustering`: [weighted global measures](http://toreopsahl.com/2010/04/21/article-node-centrality-in-weighted-networks-generalizing-degree-and-shortest-paths/ "Opsahl 2010")
	- `modularity`: empirical party-based [modularity](http://arxiv.org/abs/physics/0602124 "Newman 2006")
	- `modularity_maximized`: [maximum modularity](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1437055 "Waugh et al. 2012"), using [Walktrap](http://arxiv.org/abs/physics/0512106 "Pons and Latapy 2005") maximization over random steps 1-50
	- `modularity_ratio`: empirical / maximized modularity ratio

Each network is also saved in undirected form, with the `committee` edge attribute indicating the number of parliamentary committees that list both sponsors as their members.

__Seniority__ is sometimes left-truncated to the earlier legislature recorded by the parliamentary chamber (e.g. the first legislature since independence in the [Czech Republic](https://github.com/briatte/poslanecka)). Although the variable is meant to measure time in office, it only measures time spent in the _same_ parliamentary chamber: as a consequence, senators who previously sat in the lower chamber are counted as "freshmen" on their year of arrival in the upper chamber. This variable is best used as a dummy to discriminate freshmen from reelected members.

__Constituencies__ are coded as Wikipedia handles to the corresponding entry, either on Wikipedia English or on Wikipedia in the official language of the country. Exceptions to this coding rule are [Swiss](https://github.com/briatte/swparl), which are coded in multilingual French/German/Italian text, and [Lithuanian](https://github.com/briatte/seimas) districts or district municipalities, which are not mapped to any entries. There are no constituencies in the electoral system of the [Belgian Senate](https://github.com/briatte/belparl), and due to a redistricting reform, many constituencies are missing for [Sweden](https://github.com/briatte/riksdag) prior to 2002.

__Edge weights__ were taken into account in the computation of the `distance`, `clustering` and `modularity` attributes, which are all available as three different measures that end either with `_raw`, `_nfw` or `_gsw` (this also applies to measures of maximum modularity and to the ratio of empirical to maxmimized modularity). "Raw" weights are counts of how many cosponsorships occurred between two sponsors, while `nfw` and `gsw` designate the following weighting schemes:

* __Newman-Fowler weights__ (`_nfw`) use the same method as [Newman](http://www-personal.umich.edu/~mejn/papers/016132.pdf "Newman 2001") and [Fowler](http://jhfowler.ucsd.edu/best_connected_congressperson.pdf "Fowler 2006") to downplay the influence of cosponsoring a bill that has many other sponsors, by setting the weight of each cosponsorship to the inverse number of sponsors on the bill.
* __Gross-Shalizi weights__ (`_gsw`) use the same method as [Gross, Kirkland and Shalizi](http://www.latinodecisions.com/files/4013/3840/2978/Gross-Kirkland-Shalizi_Multilevel-Cosponsorship_PolAnlys-submission.pdf "Gross, Kirkland and Shalizi 2012") to normalize the weight of each cosponsorship tie, by dividing its Newman-Fowler weight by the maximum number of possible cosponsorships between the two sponsors; the result is a fraction in (0, 1important to take into account the valued nature of the network, but there are several possible ways to weigh the edges in the current context. ).

# VARIABLES

The [`parlnet.csv`](parlnet.csv) file contains a selection of variables measured at the country-chamber-legislature level.

The following variables were coded manually:

- `network`: name of the corresponding network object
- `region`: European region (East, North, West)
- `type`: parliamentary chamber type (Lower, Unicameral, Upper)
- `size`: statutory chamber size (source: [IPU-PARLINE][ipu])
- `cty`: country-chamber code (see note)
- `start`: legislature start year
- `end`: legislature end year
- `duration`: legislature duration, in years
- `censored`: whether the legislature is right-censored (0/1)
- `government`: type of government coalition (see note)
- `coalition`: composition of government coalition  (see note)

__Country-chamber codes:__ `AT`: Austrian parliament; `BE_CH`: Belgian lower chamber; `BE_SE`: Belgian upper chamber; `BG`: Bulgarian parliament; `CH`: Swiss lower (national) chamber; `CZ`: Czech lower chamber; `DK`: Danish parliament; `FI`: Finnish parliament; `FR_AN`: French lower chamber; `FR_SE`: French upper chamber; `HU`: Hungarian parliament; `IS`: Icelandic parliament; `IT_CA`: Italian lower chamber; `IT_SE`: Italian upper chamber; `LT`: Lithuanian parliament; `NO`: Norwegian parliament; `RO_CA`: Romanian lower chamber; `RO_SE`: Romanian upper chamber; `SE`: Swedish parliament.

__Government coalitions__: the `government` variable indicates `single` or `stable` if either a single party or a stable coalition of parties governed throughout the entire legislature, and `mixed` otherwise. The `coalition` variable contains the party abbreviation(s) corresponding to the governing coalition, separated by semicolons. Both variables are based on information retrieved from [ParlGov 14-12](http://www.parlgov.org/).

The following variables were derived from the networks:

- `nodes`: number of sponsors
- `edges`: number of cosponsorship ties
- `density`: network density
- `n_bills_au`: number of sponsored bills
- `n_bills_co`: number of cosponsored bills
- `n_bills_1`: number of bills with 1 sponsor
- `n_bills_2`: number of bills with 2 sponsors
- `n_bills_3`: number of bills with 3-5 sponsors
- `n_bills_4`: number of bills with 6-10 sponsors
- `n_bills_5`: number of bills with over 10 sponsors
- `s_min`: minimum number of sponsors per bill
- `s_max`: maximum number of sponsors per bill
- `s_med`: median number of sponsors per bill
- `s_mu`: mean number of sponsors per bill
- `mu_au`: mean number of bill authored per sponsor
- `mu_co`: mean number of bill cosponsored per sponsor
- `n_au`: number of sponsors who authored at least one bill
- `n_co`: number of sponsors who cosponsored at least one bill
- `n_both`: number of sponsors who authored _and_ cosponsored at least one bill
- `n_fem`: number of female sponsors
- `n_new`: number of freshman sponsors (elected in the last year)
- `n_ind`: number of independent sponsors with no party affiliation
- `ysio_n`: years in office (number of distinct values)
- `ysio_min`: minimum number of years in office
- `ysio_max`: maximum number of years in office
- `ysio_med`: median number of years in office
- `ysio_mu`: mean number of years in office
- `ysio_cor`: correlation between sponsor age and years in office
- `born_p`: sponsor age (percentage of nonmissing values)
- `born_min`: minimum sponsor age (year of birth)
- `born_max`: maximum sponsor age (year of birth)
- `born_med`: median sponsor age (year of birth)
- `born_mu`: mean sponsor age (year of birth)
- `constituency_p`: sponsor constituency (percentage of nonmissing values)
- `constituency_n`: sponsor constituency (number of distinct values)
- `pg_n`: sponsor parliamentary/party groups (number of distinct values)
- `pg_min`: miminum size of sponsor parliamentary/party groups
- `pg_max`: maximum size of sponsor parliamentary/party groups
- `pg_med`: median size of sponsor parliamentary/party groups
- `pg_mu`: average size of sponsor parliamentary/party groups
- `pg_sd`: standard deviation of sponsor parliamentary/party group sizes
- `n_gov`: number of sponsors in government (see previous note)
- `n_opp`: number of sponsors in opposition
- `pc_n`: parliamentary committees (number of distinct values)
- `pc_min`: minimum size of parliamentary committees
- `pc_max`: maximum size of parliamentary committees
- `pc_med`: median size of parliamentary committees
- `pc_mu`: average size of parliamentary committees
- `pc_sd`: standard deviation of parliamentary committee sizes
- `cc_min`: minimum number of shared committee memberships between sponsors
- `cc_max`: maximum number of shared committee memberships between sponsors
- `cc_med`: median number of shared committee memberships between sponsors
- `cc_mu`: mean number of shared committee memberships between sponsors
- `cc_p`: percentage of cosponsorship ties between sponsors sharing at least one committee membership
- `lr_n`: left-right party score (number of distinct values)
- `lr_min`: minimum left-right party score
- `lr_max`: maximum left-right party score
- `lr_med`: median left-right party score
- `lr_mu`: mean left-right party score
- `lr_sd`: standard deviation of left-right party scores
- `raw_min`: minimum edge weight, based on raw cosponsorship counts
- `raw_max`: maximum edge weight, based on raw cosponsorship counts
- `raw_med`: median edge weight, based on raw cosponsorship counts
- `raw_mu`: mean edge weight, based on raw cosponsorship counts
- `nfw_min`: minimum Newman-Fowler edge weight
- `nfw_max`: maximum Newman-Fowler edge weight
- `nfw_med`: median Newman-Fowler edge weight
- `nfw_mu`: mean Newman-Fowler edge weight
- `gsw_min`: minimum Gross-Shalizi edge weight
- `gsw_max`: maximum Gross-Shalizi edge weight
- `gsw_med`: median Gross-Shalizi edge weight
- `gsw_mu`: mean Gross-Shalizi edge weight
- `degree`: mean network degree
- `distance_raw`: mean network distance based on raw cosponsorship counts
- `distance_nfw`: mean network distance based on Newman-Fowler edge weights
- `distance_gsw`: mean network distance based on Gross-Shalizi edge weights
- `clustering_raw`: global clustering coefficient based on raw cosponsorship counts
- `clustering_nfw`: global clustering coefficient based on Newman-Fowler edge weights
- `clustering_gsw`: global clustering coefficient based on Gross-Shalizi edge weights
- `mutuality`: network mutuality score
- `recip_c`: correlation between within-dyad edge values
- `recip_d`: network dyadic reciprocity
- `recip_dnn`: ratio of mutual to non-null dyads
- `recip_e`: proportion of reciprocal cosponsorship ties
- `recip_elr`: log of edgewise reciprocity divided by density
- `mod_raw`: partisan modularity, using raw cosponsorship counts
- `mod_raw_max`: partisan modularity, using Newman-Fowler edge weights
- `mod_nfw`: partisan modularity, using Gross-Shalizi edge weights
- `mod_nfw_max`: maximized modularity based on raw cosponsorship counts
- `mod_gsw`: maximized modularity based on Newman-Fowler edge weights
- `mod_gsw_max`: maximized modularity based on Gross-Shalizi edge weights

__Numbers of distinct values__ are useful to detect the absence of variance in some variables at the level of a specific network. It shows, for instance, that the seniority measure (time in office, in years) is unavailable in the earliest collected legislature of the [Belgian Senate](https://github.com/briatte/belparl), where it is equal for all sponsors.

__Mutuality and reciprocity__ are based on the [`mutuality`](http://www.rdocumentation.org/packages/sna/functions/mutuality) and [`grecip`](http://www.rdocumentation.org/packages/sna/functions/grecip) functions of the [`sna`](http://www.jstatsoft.org/v24/i06/paper "Butts 2008") package. The documentation pages for both functions are particularly helpful to understand what each variable stands for. Unlike most other network measures reported above, these are unweighted.
