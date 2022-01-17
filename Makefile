.PHONY: clean

c:
	x86_64-w64-mingw32-gcc -v -c hello.c -o bin/hello_c.o
	objdump -t bin/hello_c.o

nim:
	nim c --noLinking=on -d=mingw --cpu=amd64 --out=bin/hello_nim.o hello.nim
	cp /home/vscode/.cache/nim/hello_r/@mhello.nim.c.o bin/hello_nim.o
	objdump -t bin/hello_nim.o

clean:
	rm -rf bin/*
