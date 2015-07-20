[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.20821.svg)](http://dx.doi.org/10.5281/zenodo.20821)

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


# DOCS

- The [DATA](DATA.md) file contains notes on the data included in this repository.
- The [HOWTO](HOWTO.md) file contains detailed instructions to get and run the code.
- The [TODO](TODO.md) file contains a list of known limitations and possible improvements.

The `README` file of each country-specific repository contains further details on code execution and data collection, as well as additional thanks to people who provided help in various forms.

The code to produce [interactive visualizations](http://f.briatte.org/parlviz) of the networks is available from the [`parlviz`](https://github.com/briatte/parlviz) repository.

Please report bugs or suggestions as [issues](issues), either in this repository if the issue affects all countries, or in the country-specific repository otherwise.

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
