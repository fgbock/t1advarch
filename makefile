BIN = bin
SRC = src
FLG = -O0
FLGO1 = -O1
FLGO2 = -O2
FLGO2 = -O3
COMPILER = gcc

all: mm.exe mm_duff.exe mm_trans.exe mm_unroll.exe mm_combo.exe mm_combo_duff.exe mm_simd.exe mm_O1.exe mm_O2.exe mm_O3.exe

mm.exe:
	$(COMPILER) -O0 -o $(BIN)/mm.exe $(SRC)/mm.c

mm_trans.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_trans.exe $(SRC)/mm_trans.c
	
mm_duff.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_duff.exe $(SRC)/mm_duff.c
	
mm_unroll.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_unroll.exe $(SRC)/mm_unroll.c
	
mm_simd.exe:
	$(COMPILER) -O0 -o $(BIN)/mm_simd.exe $(SRC)/mm_simd.c
	
mm_combo.exe:
	$(COMPILER) -O0 -march=native -o $(BIN)/mm_combo.exe $(SRC)/mm_combo.c	

mm_combo_opt.exe:
	$(COMPILER) -O2 -march=native -o $(BIN)/mm_combo_opt.exe $(SRC)/mm_combo.c	
	
mm_O1.exe:
	$(COMPILER) -O1 -o $(BIN)/mm_O1.exe $(SRC)/mm.c
	
mm_O2.exe:
	$(COMPILER) -O2 -o $(BIN)/mm_O2.exe $(SRC)/mm.c
	
mm_O3.exe:
	$(COMPILER) -O3 -o $(BIN)/mm_O3.exe $(SRC)/mm.c

mm_O1_simd.exe:
	$(COMPILER) -O1 -march=native -o $(BIN)/mm_O1_simd.exe $(SRC)/mm.c
	
mm_O2_simd.exe:
	$(COMPILER) -O2 -march=native -o $(BIN)/mm_O2_simd.exe $(SRC)/mm.c
	
mm_O3_simd.exe:
	$(COMPILER) -O3 -march=native -o $(BIN)/mm_O3_simd.exe $(SRC)/mm.c
	
clean:
	rm $(BIN)/*
