This repository contains [R](http://www.r-project.org/) code to build and plot legislative cosponsorship networks in 19 parliamentary chambers from 15 European countries:

| Country / Chamber | | | |
|:----------------------------------------------|:----------------------------------------------:|:--------------------------------------------------:|:-------------------------------------:|
| **Austria** (lower/national chamber only)     | [code](https://github.com/briatte/nationalrat) | [plots](http://f.briatte.org/parlviz/nationalrat/plots.html) | [viz](http://f.briatte.org/parlviz/nationalrat) |
| **Belgium** (both chambers)                   | [code](https://github.com/briatte/belparl)     | [plots](http://f.briatte.org/parlviz/belparl/plots.html)     | [viz](http://f.briatte.org/parlviz/belparl)     |
| **Bulgaria**                                  | [code](https://github.com/briatte/bgparl)      | [plots](http://f.briatte.org/parlviz/bgparl/plots.html)      | [viz](http://f.briatte.org/parlviz/bgparl)      |
| **Czech Republic** (lower chamber only)       | [code](https://github.com/briatte/poslanecka)  | [plots](http://f.briatte.org/parlviz/poslanecka/plots.html)  | [viz](http://f.briatte.org/parlviz/poslanecka)  |
| **Denmark**                                   | [code](https://github.com/briatte/folketinget) | [plots](http://f.briatte.org/parlviz/folketinget/plots.html) | [viz](http://f.briatte.org/parlviz/folketinget) |
| **Finland**                                   | [code](https://github.com/briatte/eduskunta)   | [plots](http://f.briatte.org/parlviz/eduskunta/plots.html)   | [viz](http://f.briatte.org/parlviz/eduskunta)   |
| **France** (both chambers)                    | [code](https://github.com/briatte/parlement)   | [plots](http://f.briatte.org/parlviz/parlement/plots.html)   | [viz](http://f.briatte.org/parlviz/parlement)   |
| **Hungary**                                   | [code](https://github.com/briatte/orszaggyules)| [plots](http://f.briatte.org/parlviz/orszaggyules/plots.html)| [viz](http://f.briatte.org/parlviz/orszaggyules)|
| **Iceland**                                   | [code](https://github.com/briatte/althing)     | [plots](http://f.briatte.org/parlviz/althing/plots.html)     | [viz](http://f.briatte.org/parlviz/althing)     |
| **Italy** (both chambers)                     | [code](https://github.com/briatte/parlamento)  | [plots](http://f.briatte.org/parlviz/parlamento/plots.html)  | [viz](http://f.briatte.org/parlviz/parlamento)  |
| **Lithuania**                                 | [code](https://github.com/briatte/seimas)      | [plots](http://f.briatte.org/parlviz/seimas/plots.html)      | [viz](http://f.briatte.org/parlviz/seimas)      |
| **Norway**                                    | [code](https://github.com/briatte/stortinget)  | [plots](http://f.briatte.org/parlviz/stortinget/plots.html)  | [viz](http://f.briatte.org/parlviz/stortinget)  |
| **Romania** (both chambers)                   | [code](https://github.com/briatte/parlamentul) | [plots](http://f.briatte.org/parlviz/parlamentul/plots.html) | [viz](http://f.briatte.org/parlviz/parlamentul) |
| **Sweden**                                    | [code](https://github.com/briatte/riksdag)     | [plots](http://f.briatte.org/parlviz/riksdag/plots.html)     | [viz](http://f.briatte.org/parlviz/riksdag)     |
| **Switzerland** (lower/national chamber only) | [code](https://github.com/briatte/swparl)      | [plots](http://f.briatte.org/parlviz/swparl/plots.html)      | [viz](http://f.briatte.org/parlviz/swparl)      |

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
