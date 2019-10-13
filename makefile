BIN = bin
SRC = src
FLG = -O0
FLGO1 = -O1
FLGO2 = -O2
FLGO2 = -O3
COMPILER = gcc

all: mm_O0.exe mm_O1.exe mm_O2.exe mm_O3.exe mm_O0_duff.exe mm_O0_trans.exe mm_O0_unroll.exe mm_O0_simd.exe mm_O0_combo_unroll_trans.exe mm_O0_combo_simd_trans_unroll.exe mm_O2_combo_simd_trans_unroll.exe

mm_O0.exe:
	$(COMPILER) -O0 -march=native -o $(BIN)/mm_O0.exe $(SRC)/mm.c

mm_O1.exe:
	$(COMPILER) -O1 -march=native -o $(BIN)/mm_O1.exe $(SRC)/mm.c
	
mm_O2.exe:
	$(COMPILER) -O2 -march=native -o $(BIN)/mm_O2.exe $(SRC)/mm.c
	
mm_O3.exe:
	$(COMPILER) -O3 -march=native -o $(BIN)/mm_O3.exe $(SRC)/mm.c

mm_O0_duff.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_O0_duff.exe $(SRC)/mm_duff.c

mm_O0_trans.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_O0_trans.exe $(SRC)/mm_trans.c
	
mm_O0_unroll.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_O0_unroll.exe $(SRC)/mm_unroll.c
	
mm_O0_simd.exe:
	$(COMPILER) -O0 -march=native -o $(BIN)/mm_O0_simd.exe $(SRC)/mm_simd.c
	
mm_O0_combo_unroll_trans.exe:
	$(COMPILER) -O0 -march=native -o $(BIN)/mm_O0_combo_unroll_trans.exe $(SRC)/mm_combo_unroll_trans.c	

mm_O0_combo_simd_trans_unroll.exe:
	$(COMPILER) -O0 -march=native -o $(BIN)/mm_O0_combo_simd_trans_unroll.exe $(SRC)/mm_combo_simd_trans_unroll.c

mm_O2_combo_simd_trans_unroll.exe:
	$(COMPILER) -O2 -march=native -o $(BIN)/mm_O2_combo_simd_trans_unroll.exe $(SRC)/mm_combo_simd_trans_unroll.c

clean:
	rm $(BIN)/*
