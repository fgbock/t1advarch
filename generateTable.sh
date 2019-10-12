#!/bin/bash
set -x #echo on

# original matrix mult

rm aux2.txt
rm output.csv.txt
touch output.csv
for executable in ./bin/*.exe; do
	printf "$executable\n" >> aux2.txt
done
paste -s aux2.txt >> output.csv
rm aux2.txt
for ((k=1; k<=30; k++)); do
	for executable in ./bin/*.exe; do
		"$executable" "1024" "1024" >> aux2.txt
		printf '\t' >> aux2.txt
	done
	paste aux2.txt >> output.csv 
	rm aux2.txt
done

