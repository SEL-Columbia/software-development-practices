StyleGuides
===========

Style guides and coding standards for [Sustainable Engineering Lab](http://modilabs.org) (SEL, formerly _Modi Research Group_) developers.

[Github Usage](github-usage)
------------

Our recommended best practices for coordinating source code changes on the [SEL-Columbia](https://github.com/SEL-Columbia) github account.

See the [README.md](github-usage/README.md) in the [github-usage](github-usage) folder in this repo for specifics and examples.


[Python](Python)
------
We observe the [PEP 8 Style Guide](http://www.python.org/dev/peps/pep-0008/) for [python code](http://www.python.org/).

The [pylint](http://pylint.org/) utility automatically checks code for compliance with PEP 8, and so a [bash utility](Python/generate_qc_makefile.sh) has been provided which can run an entire set of python source code files from a given repo against it, and summarize the results in a markdown report file, while preserving the entire pylint report for each source code file. 

See the [Python](Python) folder in this repo for more details.
