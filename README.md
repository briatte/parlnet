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
| **Hungary**                                   | [code](https://github.com/briatte/orszaggyules)| [plots](http://briatte.org/orszaggyules/plots.html)| [viz](http://briatte.org/orszaggyules)|
| **Iceland**                                   | [code](https://github.com/briatte/althing)     | [plots](http://briatte.org/althing/plots.html)     | [viz](http://briatte.org/althing)     |
| **Italy** (both chambers)                     | [code](https://github.com/briatte/parlamento)  | [plots](http://briatte.org/parlamento/plots.html)  | [viz](http://briatte.org/parlamento)  |
| **Lithuania**                                 | [code](https://github.com/briatte/seimas)      | [plots](http://briatte.org/seimas/plots.html)      | [viz](http://briatte.org/seimas)      |
| **Norway**                                    | [code](https://github.com/briatte/stortinget)  | [plots](http://briatte.org/stortinget/plots.html)  | [viz](http://briatte.org/stortinget)  |
| **Romania** (both chambers)                   | [code](https://github.com/briatte/parlamentul) | [plots](http://briatte.org/parlamentul/plots.html) | [viz](http://briatte.org/parlamentul) |
| **Sweden**                                    | [code](https://github.com/briatte/riksdag)     | [plots](http://briatte.org/riksdag/plots.html)     | [viz](http://briatte.org/riksdag)     |
| **Switzerland** (lower/national chamber only) | [code](https://github.com/briatte/swparl)      | [plots](http://briatte.org/swparl/plots.html)      | [viz](http://briatte.org/swparl)      |

See the [`parlviz`](https://github.com/briattte/parlviz) repository for the code that runs the [interactive visualizations](http://briatte.org/).

# DOCS

- The [`DATA`](DATA.md) file lists the data sources and the variables measured in each network.
- The [`HOWTO`](HOWTO.md) file contains general replication instructions and software dependencies.
- The [`TODO`](TODO.md) file describes known limitations and some possible improvements.
- The `README` file of each repository contains further country-specific details.

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

The `ggnet_save` function uses code from the `ggnet` function, by [Moritz Marbach](https://github.com/sumtxt) and myself. The complete function is published in the [`GGally`](https://github.com/ggobi/ggally) package 
by [Barret Schloerke](https://github.com/schloerke).

The `makeCxn` and `fetchQuery` PostgreSQL query functions found in [`parlement/functions-pgsql.r`](https://github.com/briatte/parlement/blob/master/functions-pgsql.r) and used to get data from the French upper chamber are by [Erik Gregory](https://anrprogrammer.wordpress.com/2013/07/27/easier-database-querying-with-r/).

The `str_clean` and `str_space` text cleaning functions are lightweight remixes of the `scrubber` and `Trim` functions found in the very rich [`qdap`](https://github.com/trinker/qdap/) package by [Tyler Rinker](https://github.com/trinker/).
