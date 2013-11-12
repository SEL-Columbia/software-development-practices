#!/bin/sh

# This shell script is a Makefile generator, for the quality control (QC)
# criteria we want to track automatically: it gets all list of all the
# python code files and creates a Makefile which will run them through
# pylint; finally, it generates a markdown summary (README.md) of those
# results, timestamped with when the 'make all' command was run.

# list all the python files we want to score with pylint
pyfiles=`cd ..; ls *.py | grep -v "__init"`

# Define the 'clean' rule
echo "\nclean:\n\trm *.lint *.md"

# Define the 'all' rule
echo -n "\nall:"
for pyf in $pyfiles
do
	output=`echo $pyf | tr '/' '-'`
	echo "\t$output.lint \\"
done
echo "\tREADME.md\n"

# Define each individual pylint file score rule
for pyf in $pyfiles
do
	output=`echo $pyf | tr '/' '-'`
	# if pylint detects a problem it will return an error code
	# but since we don't want make to stop in its tracks, we
	# use the '- ' prefix so that it continues through all files
	echo "$output.lint:\n\t- pylint "../$pyf" >$output.lint 2>&1"
done

# Define the python source file dependency rule
# (i.e., make sure that when a python source code file is changed,
#  make will know to re-run pylint and update the summary)
echo " "
for pyf in $pyfiles
do
	output=`echo $pyf | tr '/' '-'`
	echo "$output.lint: ../$pyf"
done

# Define the rule to create the markdown score summary file
# (use a simple grep/sed combination to pull the summary info out of
# each pylint result, though we're saving the full pylint results here
# for reference)
echo """\nREADME.md: *.lint
	echo \"# Pylint scores as of \`date +\"%b %d %Y %H:%M:%S (UTC)\" --utc\` \" > README.md
	echo \"<table><tr><td><b>Script</b></td><td><b>Pylint Score</b></td></tr>\" >> README.md 
	grep \"Your code has been rated at\" *.lint | \
sed -e 's/Your code has been rated at/ /' | \
sed -e 's/^/<tr><td>/' | \
sed -e 's/\.lint:/<\/td><td align=\"right\">/' | \
sed -e 's/\$\$/<\/td><\/tr>/' >> README.md
	echo \"</table>\" >> README.md
"""

