#!/bin/bash
set -x #echo on
for ((k=1; k<=30; k++)); do
	./mm.exe "1024" "1024" "$k"
done

for ((k2=1; k2<=30; k2++)); do
	./mm_trans.exe "1024" "1024" "$k"
done

for ((k2=1; k2<=30; k2++)); do
	./mm_duff.exe "1024" "1024" "$k"
done

for ((k2=1; k2<=30; k2++)); do
	./mm_full.exe "1024" "1024" "$k"
done

for ((k=1; k<=30; k++)); do
	./mm_O1.exe "1024" "1024" "$k"
done

for ((k=1; k<=30; k++)); do
	./mm_O2.exe "1024" "1024" "$k"
done

for ((k=1; k<=30; k++)); do
	./mm_O3.exe "1024" "1024" "$k"
done
