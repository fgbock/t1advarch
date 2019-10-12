BIN = bin
SRC = src
FLG = -O0
FLGO1 = -O1
FLGO2 = -O2
FLGO2 = -O3
COMPILER = GCC

all: mm.exe mm_duff.exe mm_trans.exe mm_unroll.exe mm_combo.exe mm_combo_duff.exe mm_O1.exe mm_O2.exe mm_O3.exe

mm.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm.exe $(SRC)\mm.c

mm_trans.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_trans.exe $(SRC)\mm_trans.c
	
mm_duff.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_duff.exe $(SRC)\mm_duff.c
	
mm_unroll.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_unroll.exe $(SRC)\mm_unroll.c
	
mm_combo.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_combo.exe $(SRC)\mm_combo.c
	
mm_combo_duff.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_combo_duff.exe $(SRC)\mm_combo_duff.c
	
mm_O1.exe:
	$(COMPILER) $(FLGO1) -o $(BIN)\mm_O1.exe $(SRC)\mm.c
	
mm_O2.exe:
	$(COMPILER) $(FLGO1) -o $(BIN)\mm_O2.exe $(SRC)\mm.c
	
mm_O3.exe:
	$(COMPILER) $(FLGO1) -o $(BIN)\mm_O3.exe $(SRC)\mm.c
	
	
clean:
	rm $(BIN)\mm.exe $(BIN)\mm_trans.exe $(BIN)\mm_duff.exe $(BIN)\mm_combo.exe $(BIN)\mm_unroll.exe