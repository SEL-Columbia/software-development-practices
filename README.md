StyleGuides
===========

Style guides and coding standards for [Sustainable Engineering Lab](http://modilabs.org) (formerly _Modi Research Group_) developers.


[Python](Python)
------
We observe the [PEP 8 Style Guide](http://www.python.org/dev/peps/pep-0008/) for [python code](http://www.python.org/).

The [pylint](http://pylint.org/) utility automatically checks code for compliance with PEP 8, and so a [bash utility](Python/generate_qc_makefile.sh) has been provided which can run an entire set of python source code files from a given repo against it, and summarize the results in a markdown report file, while preserving the entire pylint report for each source code file. 

See the [Python](Python) folder in this repo for more details.
