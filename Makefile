.PHONY: clean

c:
	x86_64-w64-mingw32-gcc -v -c bof.c -o bin/bof_c.o
	objdump -t bin/bof_c.o

nim:
	nim c --noLinking=on -d:danger -d:strip --opt:size -d=mingw --cpu=amd64 --out=bin/bof_nim.o bof.nim
	cp /home/vscode/.cache/nim/bof_r/@mbof.nim.c.o bin/bof_nim.o
	objdump -t bin/bof_nim.o

clean:
	rm -rf bin/*
