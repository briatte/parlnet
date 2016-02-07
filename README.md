This repository contains [R](http://www.r-project.org/) code to build and plot 150 cosponsorship networks out of the legislative activity of 27 parliamentary chambers in 19 European countries, plus Israel. The data cover approximately 558 years of parliamentary interactions. The resulting networks are stored in [`parlnet.rda`](https://github.com/briatte/parlnet/blob/master/parlnet.rda).

| Country / Chamber | | | |
|:------------------------------------------|:----------------------------------------------:|:------------------------------------------------------------:|:-----------------------------------------------:|
| **Austria** (lower/national chamber only) | [R code](https://github.com/briatte/nationalrat) | [static plots](http://f.briatte.org/parlviz/nationalrat/plots.html) | [interactive visualization](http://f.briatte.org/parlviz/nationalrat) |
| **Belgium** (both chambers)               | [R code](https://github.com/briatte/belparl)     | [static plots](http://f.briatte.org/parlviz/belparl/plots.html)     | [interactive visualization](http://f.briatte.org/parlviz/belparl)     |
| **Bulgaria**                              | [R code](https://github.com/briatte/bgparl)      | [static plots](http://f.briatte.org/parlviz/bgparl/plots.html)      | [interactive visualization](http://f.briatte.org/parlviz/bgparl)      |
| **Czech Republic** (both chambers)        | [R code](https://github.com/briatte/parlament)   | [static plots](http://f.briatte.org/parlviz/parlament/plots.html)   | [interactive visualization](http://f.briatte.org/parlviz/parlament)   |
| **Denmark**                               | [R code](https://github.com/briatte/folketinget) | [static plots](http://f.briatte.org/parlviz/folketinget/plots.html) | [interactive visualization](http://f.briatte.org/parlviz/folketinget) |
| **Estonia**                               | [R code](https://github.com/briatte/riigikogu)   | [static plots](http://f.briatte.org/parlviz/riigikogu/plots.html)   | [interactive visualization](http://f.briatte.org/parlviz/riigikogu)   |
| **Finland**                               | [R code](https://github.com/briatte/eduskunta)   | [static plots](http://f.briatte.org/parlviz/eduskunta/plots.html)   | [interactive visualization](http://f.briatte.org/parlviz/eduskunta)   |
| **France** (both chambers)                | [R code](https://github.com/briatte/parlement)   | [static plots](http://f.briatte.org/parlviz/parlement/plots.html)   | [interactive visualization](http://f.briatte.org/parlviz/parlement)   |
| **Hungary**                               | [R code](https://github.com/briatte/orszaggyules)| [static plots](http://f.briatte.org/parlviz/orszaggyules/plots.html)| [interactive visualization](http://f.briatte.org/parlviz/orszaggyules)|
| **Iceland**                               | [R code](https://github.com/briatte/althing)     | [static plots](http://f.briatte.org/parlviz/althing/plots.html)     | [interactive visualization](http://f.briatte.org/parlviz/althing)     |
| **Ireland** (both chambers)               | [R code](https://github.com/briatte/oireachtas)  | [static plots](http://f.briatte.org/parlviz/oireachtas/plots.html)  | [interactive visualization](http://f.briatte.org/parlviz/oireachtas)  |
| **Israel**                                | [R code](https://github.com/briatte/knesset)     | [static plots](http://f.briatte.org/parlviz/knesset/plots.html)     | [interactive visualization](http://f.briatte.org/parlviz/knesset)     |
| **Italy** (both chambers)                 | [R code](https://github.com/briatte/parlamento)  | [static plots](http://f.briatte.org/parlviz/parlamento/plots.html)  | [interactive visualization](http://f.briatte.org/parlviz/parlamento)  |
| **Lithuania**                             | [R code](https://github.com/briatte/seimas)      | [static plots](http://f.briatte.org/parlviz/seimas/plots.html)      | [interactive visualization](http://f.briatte.org/parlviz/seimas)      |
| **Norway**                                | [R code](https://github.com/briatte/stortinget)  | [static plots](http://f.briatte.org/parlviz/stortinget/plots.html)  | [interactive visualization](http://f.briatte.org/parlviz/stortinget)  |
| **Portugal**                              | [R code](https://github.com/briatte/assembleia)  | [static plots](http://f.briatte.org/parlviz/assembleia/plots.html)  | [interactive visualization](http://f.briatte.org/parlviz/assembleia)  |
| **Romania** (both chambers)               | [R code](https://github.com/briatte/parlamentul) | [static plots](http://f.briatte.org/parlviz/parlamentul/plots.html) | [interactive visualization](http://f.briatte.org/parlviz/parlamentul) |
| **Slovakia**                              | [R code](https://github.com/briatte/nrsr)        | [static plots](http://f.briatte.org/parlviz/nrsr/plots.html)        | [interactive visualization](http://f.briatte.org/parlviz/nrsr)        |
| **Sweden**                                | [R code](https://github.com/briatte/riksdag)     | [static plots](http://f.briatte.org/parlviz/riksdag/plots.html)     | [interactive visualization](http://f.briatte.org/parlviz/riksdag)     |
| **Switzerland** (both chambers)           | [R code](https://github.com/briatte/swparl)      | [static plots](http://f.briatte.org/parlviz/swparl/plots.html)      | [interactive visualization](http://f.briatte.org/parlviz/swparl)      |

# DOCS

The data included in this repository are briefly presented in [this note](http://f.briatte.org/research/parlnet-note.pdf) and are fully documented in [this appendix](http://f.briatte.org/research/parlnet-appendix.pdf), which explains how they were collected and how the networks were constructed.

The repository contains a [HOWTO](HOWTO.md) file with detailed instructions on how to get and run the code, and the `README` file of each country-specific repository contains further details on code execution and data collection, as well as additional thanks to people who provided help. Further ideas and links are available in the [repository wiki](https://github.com/briatte/parlnet/wiki).

The raw data collected by [release 2.6](https://github.com/briatte/parlnet/releases) (January 2016) is available online as an archive of HTML, JSON and XML files. It can be accessed at the following DOI handle:

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.44440.svg)](http://dx.doi.org/10.5281/zenodo.44440)

Please report bugs or suggestions as [issues](https://github.com/briatte/parlnet/issues), either in this repository if the issue affects all countries, or in the country-specific repository otherwise.

The code to produce [interactive visualizations](http://f.briatte.org/parlviz) of the networks is available separately from the [`parlviz`](https://github.com/briatte/parlviz) repository.

# EXTRAS

- Amendment cosponsorships in the **European Parliament**: [code](https://github.com/briatte/epam), [plots](http://f.briatte.org/parlviz/epam/plots.html), [viz](http://f.briatte.org/parlviz/epam/)
- Amendment cosponsorships in the **Tunisian Constituent Assembly**: [code](https://github.com/briatte/marsad), [plots](http://f.briatte.org/parlviz/marsad/plots.html), [viz](http://f.briatte.org/parlviz/marsad)
- Bill cosponsorships in the **National Assembly of South Korea**: [code](https://github.com/briatte/gukhoe), [plots](http://f.briatte.org/parlviz/gukhoe/plots.html)
- Bill cosponsorships in both houses of the **U.S. Congress**: [code](https://github.com/briatte/congress), [plots](http://f.briatte.org/parlviz/congress/plots.html)
- Motion cosponsorships in both houses of the **Dutch Parliament**: [code](https://github.com/briatte/motie), [plots](http://f.briatte.org/parlviz/motie/plots.html)
- Early day motion cosponsorships in the **U.K. House of Commons**: [code](https://github.com/briatte/edm), [plots](http://f.briatte.org/parlviz/edm/plots.html)

# LICENSE

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

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
