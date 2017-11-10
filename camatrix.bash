#!/bin/bash
if [ $# -ne 2 ]; then
	echo "Invalid syntax"
	echo "Usage: $0 inputdir outputdir"
	exit
fi

for f in $1/*.pdb; do
	window=`basename \`dirname  $f\``
	outdir=`echo ${2} | sed 's/\\$//g'`
	mkdir -p $outdir
	outfile=${outdir}/${window}_`echo \`basename $f\` | sed 's/pdb/csv/g'`
	echo "Created $outfile"
	grep "CA" "$f" | awk 'BEGIN {OFS = ","} {print $5,$6,$7,$8}' > $outfile
done
