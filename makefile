BIN = bin
SRC = src
FLG = -O0
COMPILER = GCC

all: mm.exe mm_duff.exe mm_trans.exe mm_unroll.exe

mm.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm.exe $(SRC)\mm.c

mm_trans.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_trans.exe $(SRC)\mm_trans.c
	
mm_duff.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_duff.exe $(SRC)\mm_duff.c
	
mm_unroll.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_unroll.exe $(SRC)\mm_unroll.c
	
mm_unroll.exe:
	$(COMPILER) $(FLG) -o $(BIN)\mm_combo.exe $(SRC)\mm_combo.c
	
clean:
	rm $(BIN)\mm.exe $(BIN)\mm_trans.exe $(BIN)\mm_duff.exe $(BIN)\mm_combo.exe $(BIN)\mm_unroll.exe