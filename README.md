# BOF-Nim

oh yeah baby

I have an inkling it's possible, right now the problem seems to be getting the `go` function to be present in the Symbol table. No clue how to do this with the Nim compiler (yet).

Help welcome!~

Objectdump output from normal BOF compiled with `x86_64-w64-mingw32-gcc`:

```
hello.o:	file format COFF-x86-64

architecture: x86_64
start address: 0x0000000000000000

Export Table:
Sections:
Idx Name          Size     VMA              Type
  0 .text         00000030 0000000000000000 TEXT
  1 .data         00000000 0000000000000000 DATA
  2 .bss          00000000 0000000000000000 BSS
  3 .rdata        00000010 0000000000000000 DATA
  4 .xdata        0000000c 0000000000000000 DATA
  5 .pdata        0000000c 0000000000000000 DATA
  6 .rdata$zzz    00000020 0000000000000000 DATA

SYMBOL TABLE:
[ 0](sec -2)(fl 0x00)(ty   0)(scl  67) (nx 1) 0x00000000 .file
AUX hello.c
[ 2](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 1) 0x00000000 go
AUX Unknown
[ 4](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .text
AUX scnlen 0x2f nreloc 2 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 6](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 8](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[10](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .rdata
AUX scnlen 0x10 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[12](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .xdata
AUX scnlen 0xc nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[14](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .pdata
AUX scnlen 0xc nreloc 3 nlnno 0 checksum 0x0 assoc 0 comdat 0
[16](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .rdata$zzz
AUX scnlen 0x12 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[18](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x00000000 __imp_BeaconPrintf
RELOCATION RECORDS FOR [.text]:
0000000000000016 IMAGE_REL_AMD64_REL32 .rdata
0000000000000022 IMAGE_REL_AMD64_REL32 __imp_BeaconPrintf

RELOCATION RECORDS FOR [.pdata]:
0000000000000000 IMAGE_REL_AMD64_ADDR32NB .text
0000000000000004 IMAGE_REL_AMD64_ADDR32NB .text
0000000000000008 IMAGE_REL_AMD64_ADDR32NB .xdata
```

I used the following flags to compile `hello.nim`:

`nim c --noLinking=on -d=danger -d=mingw -d=strip --passc=-flto --passl=-flto --opt=size --cpu=amd64 --out=hello.o hello.nim`

You'll find the COFF file in your Nim cache folder as the compiler won't move it to your current folder automatically.

Object Dump output:

```
/Users/byt3bl33d3r/.cache/nim/hello_r/@mhello.nim.c.o:	file format COFF-x86-64

architecture: x86_64
start address: 0x0000000000000000

Export Table:
Sections:
Idx Name                                       Size     VMA              Type
  0 .text                                      00000000 0000000000000000 TEXT
  1 .data                                      00000000 0000000000000000 DATA
  2 .bss                                       00000000 0000000000000000 BSS
  3 .gnu.lto_.profile.e5a1d272ef3bfa6d         00000010 0000000000000000 DATA
  4 .gnu.lto_.icf.e5a1d272ef3bfa6d             0000003c 0000000000000000 DATA
  5 .gnu.lto_.jmpfuncs.e5a1d272ef3bfa6d        0000005f 0000000000000000 DATA
  6 .gnu.lto_.ipa_sra.e5a1d272ef3bfa6d         00000024 0000000000000000 DATA
  7 .gnu.lto_.inline.e5a1d272ef3bfa6d          00000069 0000000000000000 DATA
  8 .gnu.lto_.pureconst.e5a1d272ef3bfa6d       0000001f 0000000000000000 DATA
  9 .gnu.lto_.lto.e5a1d272ef3bfa6d             00000008 0000000000000000 DATA
 10 .gnu.lto_PreMainInner.2.e5a1d272ef3bfa6d   000000ef 0000000000000000 DATA
 11 .gnu.lto_PreMain.6.e5a1d272ef3bfa6d        000001da 0000000000000000 DATA
 12 .gnu.lto_NimMainInner.7.e5a1d272ef3bfa6d   000000ca 0000000000000000 DATA
 13 .gnu.lto_NimMain.8.e5a1d272ef3bfa6d        000001c7 0000000000000000 DATA
 14 .gnu.lto_main.9.e5a1d272ef3bfa6d           00000250 0000000000000000 DATA
 15 .gnu.lto_NimMainModule.10.e5a1d272ef3bfa6d 000000ca 0000000000000000 DATA
 16 .gnu.lto_.symbol_nodes.e5a1d272ef3bfa6d    000000a9 0000000000000000 DATA
 17 .gnu.lto_.refs.e5a1d272ef3bfa6d            00000025 0000000000000000 DATA
 18 .gnu.lto_.decls.e5a1d272ef3bfa6d           00000770 0000000000000000 DATA
 19 .gnu.lto_.symtab.e5a1d272ef3bfa6d          000001a0 0000000000000000 DATA
 20 .gnu.lto_.ext_symtab.e5a1d272ef3bfa6d      0000001f 0000000000000000 DATA
 21 .gnu.lto_.opts                             0000008b 0000000000000000 DATA

SYMBOL TABLE:
[ 0](sec -2)(fl 0x00)(ty   0)(scl  67) (nx 1) 0x00000000 .file
AUX @mhello.nim.c
[ 2](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .text
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 4](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 6](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[ 8](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.profile.e5a1d272ef3bfa6d
AUX scnlen 0x10 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[10](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.icf.e5a1d272ef3bfa6d
AUX scnlen 0x3c nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[12](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.jmpfuncs.e5a1d272ef3bfa6d
AUX scnlen 0x5f nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[14](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.ipa_sra.e5a1d272ef3bfa6d
AUX scnlen 0x24 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[16](sec  8)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.inline.e5a1d272ef3bfa6d
AUX scnlen 0x69 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[18](sec  9)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.pureconst.e5a1d272ef3bfa6d
AUX scnlen 0x1f nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[20](sec 10)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.lto.e5a1d272ef3bfa6d
AUX scnlen 0x8 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[22](sec 11)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_PreMainInner.2.e5a1d272ef3bfa6d
AUX scnlen 0xef nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[24](sec 12)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_PreMain.6.e5a1d272ef3bfa6d
AUX scnlen 0x1da nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[26](sec 13)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_NimMainInner.7.e5a1d272ef3bfa6d
AUX scnlen 0xca nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[28](sec 14)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_NimMain.8.e5a1d272ef3bfa6d
AUX scnlen 0x1c7 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[30](sec 15)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_main.9.e5a1d272ef3bfa6d
AUX scnlen 0x250 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[32](sec 16)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_NimMainModule.10.e5a1d272ef3bfa6d
AUX scnlen 0xca nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[34](sec 17)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.symbol_nodes.e5a1d272ef3bfa6d
AUX scnlen 0xa9 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[36](sec 18)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.refs.e5a1d272ef3bfa6d
AUX scnlen 0x25 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[38](sec 19)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.decls.e5a1d272ef3bfa6d
AUX scnlen 0x770 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[40](sec 20)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.symtab.e5a1d272ef3bfa6d
AUX scnlen 0x1a0 nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[42](sec 21)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.ext_symtab.e5a1d272ef3bfa6d
AUX scnlen 0x1f nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[44](sec 22)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x00000000 .gnu.lto_.opts
AUX scnlen 0x8b nreloc 0 nlnno 0 checksum 0x0 assoc 0 comdat 0
[46](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x00000001 __gnu_lto_slim
```


Output from Cobalt Strike when running the Nim BOF:

![image](https://user-images.githubusercontent.com/5151193/104388569-a1e8ab00-54f6-11eb-83eb-327a9a19e310.png)