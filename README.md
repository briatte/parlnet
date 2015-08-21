This repository contains [R](http://www.r-project.org/) code to build and plot 128 cosponsorship networks out of the legislative activity of 24 parliamentary chambers in 18 European countries. The data cover approximately 492 years of parliamentary interactions. The resulting networks are stored in [`parlnet.rda`](https://github.com/briatte/parlnet/blob/master/parlnet.rda).

| Country / Chamber | | | | |
|:----------------------------------------------|:----------------------------------------------:|:----------------------------------------------------------:|:------------------------------------------------------------:|:-----------------------------------------------:|
| **Austria** (lower/national chamber only)     | [code](https://github.com/briatte/nationalrat) | [README](https://github.com/briatte/nationalrat/blob/master/README.md) | [plots](http://f.briatte.org/parlviz/nationalrat/plots.html) | [viz](http://f.briatte.org/parlviz/nationalrat) |
| **Belgium** (both chambers)                   | [code](https://github.com/briatte/belparl)     | [README](https://github.com/briatte/belparl/blob/master/README.md)     | [plots](http://f.briatte.org/parlviz/belparl/plots.html)     | [viz](http://f.briatte.org/parlviz/belparl)     |
| **Bulgaria**                                  | [code](https://github.com/briatte/bgparl)      | [README](https://github.com/briatte/bgparl/blob/master/README.md)      | [plots](http://f.briatte.org/parlviz/bgparl/plots.html)      | [viz](http://f.briatte.org/parlviz/bgparl)      |
| **Czech Republic** (lower chamber only)       | [code](https://github.com/briatte/poslanecka)  | [README](https://github.com/briatte/poslanecka/blob/master/README.md)  | [plots](http://f.briatte.org/parlviz/poslanecka/plots.html)  | [viz](http://f.briatte.org/parlviz/poslanecka)  |
| **Denmark**                                   | [code](https://github.com/briatte/folketinget) | [README](https://github.com/briatte/folketinget/blob/master/README.md) | [plots](http://f.briatte.org/parlviz/folketinget/plots.html) | [viz](http://f.briatte.org/parlviz/folketinget) |
| **Finland**                                   | [code](https://github.com/briatte/eduskunta)   | [README](https://github.com/briatte/eduskunta/blob/master/README.md)   | [plots](http://f.briatte.org/parlviz/eduskunta/plots.html)   | [viz](http://f.briatte.org/parlviz/eduskunta)   |
| **France** (both chambers)                    | [code](https://github.com/briatte/parlement)   | [README](https://github.com/briatte/parlement/blob/master/README.md)   | [plots](http://f.briatte.org/parlviz/parlement/plots.html)   | [viz](http://f.briatte.org/parlviz/parlement)   |
| **Hungary**                                   | [code](https://github.com/briatte/orszaggyules)| [README](https://github.com/briatte/orszaggyules/blob/master/README.md)| [plots](http://f.briatte.org/parlviz/orszaggyules/plots.html)| [viz](http://f.briatte.org/parlviz/orszaggyules)|
| **Iceland**                                   | [code](https://github.com/briatte/althing)     | [README](https://github.com/briatte/althing/blob/master/README.md)     | [plots](http://f.briatte.org/parlviz/althing/plots.html)     | [viz](http://f.briatte.org/parlviz/althing)     |
| **Ireland** (both chambers)                   | [code](https://github.com/briatte/oireachtas)  | [README](https://github.com/briatte/oireachtas/blob/master/README.md)  | [plots](http://f.briatte.org/parlviz/oireachtas/plots.html)  | [viz](http://f.briatte.org/parlviz/oireachtas)  |
| **Italy** (both chambers)                     | [code](https://github.com/briatte/parlamento)  | [README](https://github.com/briatte/parlamento/blob/master/README.md)  | [plots](http://f.briatte.org/parlviz/parlamento/plots.html)  | [viz](http://f.briatte.org/parlviz/parlamento)  |
| **Lithuania**                                 | [code](https://github.com/briatte/seimas)      | [README](https://github.com/briatte/seimas/blob/master/README.md)      | [plots](http://f.briatte.org/parlviz/seimas/plots.html)      | [viz](http://f.briatte.org/parlviz/seimas)      |
| **Norway**                                    | [code](https://github.com/briatte/stortinget)  | [README](https://github.com/briatte/stortinget/blob/master/README.md)  | [plots](http://f.briatte.org/parlviz/stortinget/plots.html)  | [viz](http://f.briatte.org/parlviz/stortinget)  |
| **Portugal**                                  | [code](https://github.com/briatte/assembleia)  | [README](https://github.com/briatte/assembleia/blob/master/README.md)  | [plots](http://f.briatte.org/parlviz/assembleia/plots.html)  | [viz](http://f.briatte.org/parlviz/assembleia)  |
| **Romania** (both chambers)                   | [code](https://github.com/briatte/parlamentul) | [README](https://github.com/briatte/parlamentul/blob/master/README.md) | [plots](http://f.briatte.org/parlviz/parlamentul/plots.html) | [viz](http://f.briatte.org/parlviz/parlamentul) |
| **Slovakia**                                  | [code](https://github.com/briatte/nrsr)        | [README](https://github.com/briatte/nrsr/blob/master/README.md)        | [plots](http://f.briatte.org/parlviz/nrsr/plots.html)        | [viz](http://f.briatte.org/parlviz/nrsr)        |
| **Sweden**                                    | [code](https://github.com/briatte/riksdag)     | [README](https://github.com/briatte/riksdag/blob/master/README.md)     | [plots](http://f.briatte.org/parlviz/riksdag/plots.html)     | [viz](http://f.briatte.org/parlviz/riksdag)     |
| **Switzerland** (both chambers)               | [code](https://github.com/briatte/swparl)      | [README](https://github.com/briatte/swparl/blob/master/README.md)      | [plots](http://f.briatte.org/parlviz/swparl/plots.html)      | [viz](http://f.briatte.org/parlviz/swparl)      |

# DOCS

The data included in this repository is briefly presented in [this note](http://f.briatte.org/research/parlnet-note.pdf) and fully documented in [this appendix](http://f.briatte.org/research/parlnet-appendix.pdf), which explains how the data are collected and how the networks are constructed.

The repository contains two additional documentation files:

- The [HOWTO](HOWTO.md) file contains detailed instructions to get and run the code.
- The [TODO](TODO.md) file contains a list of known limitations and possible improvements.
- The wiki contains [links](https://github.com/briatte/parlnet/wiki) to parliamentary open data services and third parties.

The `README` file of each country-specific repository contains further details on code execution and data collection, as well as additional thanks to people who provided help.

The raw data collected by [release 2.0](https://github.com/briatte/parlnet/releases) (August 2015) is available online as a 1.5 GB archive of HTML, JSON and XML files. It can be accessed at the following DOI handle:

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.27328.svg)](http://dx.doi.org/10.5281/zenodo.27328)

Please report bugs or suggestions as [issues](https://github.com/briatte/parlnet/issues), either in this repository if the issue affects all countries, or in the country-specific repository otherwise.

The code to produce [interactive visualizations](http://f.briatte.org/parlviz) of the networks is available separately from the [`parlviz`](https://github.com/briatte/parlviz) repository.

# EXTRAS

- Amendment cosponsorships in the **European Parliament**: [code](https://github.com/briatte/epam), [plots](http://f.briatte.org/parlviz/epam/plots.html), [viz](http://f.briatte.org/parlviz/epam/)
- Amendment cosponsorships in the **Tunisian Constituent Assembly**: [code](https://github.com/briatte/marsad), [plots](http://f.briatte.org/parlviz/marsad/plots.html), [viz](http://f.briatte.org/parlviz/marsad)
- Bill cosponsorships in the **U.S. Congress**: [code](https://github.com/briatte/congress), [plots](http://f.briatte.org/parlviz/congress/plots.html)
- Early day motion cosponsorships in the **U.K. House of Commons**: [code](https://github.com/briatte/edm), [plots](http://f.briatte.org/parlviz/edm/plots.html)

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
