[Python](http://www.python.org/)
======

Automating [PEP 8](http://www.python.org/dev/peps/pep-0008/) Compliance
---------------------------

Recommended practice is to create a quality control (QC) folder in repos containing any python source code.

Copy the [generate_qc_makefile.sh](generate_qc_makefile.sh) script from this folder into the QC folder of the given repo, and modify line 10 with the appropriate bash statement for listing all python source code files:

```sh
# list all the python files we want to score with pylint
pyfiles=`cd ..; ls *.py | grep -v "__init"` # add or change this as needed...
```

Next, run the [generate_qc_makefile.sh](generate_qc_makefile.sh) script to produce a <tt>Makefile</tt> customized for the given repo:

```sh
$ sh generate_qc_makefile.sh > Makefile
```

The resulting <tt>Makefile</tt> runs [pylint](http://pylint.org/) automatically over the entire set of python source code files, and summarizes the results in a <tt>README.md</tt> markdown file while preserving the entire pylint report in each <tt>.lint</tt> file. 

Regular Quality Control
-----------------------

To update the tests after any python source code changes, use the 'all' rule from inside the QC folder, as follows:

```
make all
```

To rerun tests all on the entire repo, use the 'clean' rule first:

```
make clean
make all
```

If the names or total number of python source files ever changes, the <tt>Makefile</tt> can be regenerated re-running the [generate_qc_makefile.sh](generate_qc_makefile.sh) script:

```sh
$ sh generate_qc_makefile.sh > Makefile
```

