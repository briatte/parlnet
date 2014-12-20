Please report bugs or suggestions as [issues](issues).

Known limitations of the current version are:

* **No self-updating mechanism: the data has to be refreshed manually.**
	* would probably require recoding all scrapers in Python for [ScraperWiki](https://scraperwiki.com/)
	* would improve data collection for ongoing legislatures only
	* would still require manual updates after website upgrades
* **Network errors in download loops require to rerun some of the scripts.**
	* some but not all scripts contain exception lists to skip over the (little amount of) errors
	* some errors are permanent: using `while` would create infinite loops
* **Some parts of the code are sluggish, or at least could run much faster.**
	* bills and sponsors could be stored as SQL tables instead of CSV files
	* adjacency matrixes are probably faster than edge lists as network constructors
* **Some variables have many missing or unstandardised values.**
	* variables with high missing counts:
		* `born` (especially for upper house sponsors)
		* `constituency` (hard to standardise)
	* variables that are missing entirely:
		* `committee` (complex to observe comparatively)
		* anything to do with electoral candidacy (unobserved)
