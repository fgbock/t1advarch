#!/bin/bash
set -x #echo on

# original matrix mult
printf '\n' >> output.csv
printf "ORIGINAL" >> output.csv
for ((k=1; k<=30; k++)); do
	./bin/mm.exe "1024" "1024" >> output.csv
done

# matrix transpose to enhance mm
printf "TRANS" >> output.csv
printf '\n' >> output.csv
for ((k=1; k<=30; k++)); do
	./bin/mm_trans.exe] "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# duff device
printf "DUFF" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_duff.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# loop unrolled fully
printf "UNROLL" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_unroll.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# combo of all optimizations
printf "COMBO" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_combo.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# original with O1 Flag enabled
printf "ORIGINAL O1" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_O1.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# original with O1 Flag enabled
printf "ORIGINAL O2" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_O2.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv

# original with O1 Flag enabled
printf "ORIGINAL O3" >> output.csv
printf '\n' >> output.csv
for ((k2=1; k2<=30; k2++)); do
	./bin/mm_O3.exe "1024" "1024" >> output.csv
done
printf '\n' >> output.csv
