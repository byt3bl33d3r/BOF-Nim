# BOF-Nim

oh yeah baby

Help welcome!~

Build `bof.nim` by running `make nim` in the root of this repo. This will produce `bof_nim.o` in the `bin/` directory.

## Problems 

1. ~~Getting the `go` function to be present in the Symbol table.~~
2. Making import `Beacon*` functions exported in the symbol table with the `__imp_` prefix
3. Making it not crash when running it through [Invoke-BOF](https://github.com/airbus-cert/Invoke-Bof)

## Nim BOF vs "Normal" C BOF

Nim BOF:
```
bin/bof_nim.o:     file format pe-x86-64

SYMBOL TABLE:
[  0](sec -2)(fl 0x00)(ty   0)(scl 103) (nx 1) 0x0000000000000000 @mhello.nim.c
File 
[  2](sec  1)(fl 0x00)(ty  20)(scl   3) (nx 1) 0x0000000000000000 nimFrame
AUX tagndx 0 ttlsiz 0x0 lnnos 0 next 0
[  4](sec 11)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$.refptr.framePtr__system_2566
AUX scnlen 0x8 nreloc 1 nlnno 0 checksum 0x0 assoc 0 comdat 2
[  6](sec  1)(fl 0x00)(ty  20)(scl   3) (nx 0) 0x000000000000007f popFrame
[  7](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000009d go
[  8](sec 10)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$.refptr.CALLBACK_OUTPUT__beacont_13
AUX scnlen 0x8 nreloc 1 nlnno 0 checksum 0x0 assoc 0 comdat 2
[ 10](sec  1)(fl 0x00)(ty  20)(scl   3) (nx 0) 0x000000000000012e initStackBottomWith
[ 11](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000014a PreMainInner
[ 12](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000015e PreMain
[ 13](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000199 NimMainInner
[ 14](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x00000000000001ad NimMain
[ 15](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x00000000000001de main
[ 16](sec  9)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$.refptr.nim_program_result
AUX scnlen 0x8 nreloc 1 nlnno 0 checksum 0x0 assoc 0 comdat 2
[ 18](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000022a NimMainModule
[ 19](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .text
AUX scnlen 0x231 nreloc 24 nlnno 0
[ 21](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0
[ 23](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .bss
AUX scnlen 0x18 nreloc 0 nlnno 0
[ 25](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .xdata
AUX scnlen 0x70 nreloc 0 nlnno 0
[ 27](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .pdata
AUX scnlen 0x78 nreloc 30 nlnno 0
[ 29](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata
AUX scnlen 0x31 nreloc 0 nlnno 0
[ 31](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$zzz
AUX scnlen 0x1d nreloc 0 nlnno 0
[ 33](sec  8)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .drectve
AUX scnlen 0xd nreloc 0 nlnno 0
[ 35](sec 11)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 .refptr.framePtr__system_2566
[ 36](sec 10)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 .refptr.CALLBACK_OUTPUT__beacont_13
[ 37](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 cmdCount
[ 38](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000008 cmdLine
[ 39](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000010 gEnv
[ 40](sec  9)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 .refptr.nim_program_result
[ 41](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 __main
[ 42](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 callDepthLimitReached__system_2999
[ 43](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 BeaconPrintf
[ 44](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 nimGC_setStackBottom
[ 45](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 stdlib_ioInit000
[ 46](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 stdlib_ioDatInit000
[ 47](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 systemDatInit000
[ 48](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 systemInit000
[ 49](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 nim_program_result
[ 50](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 CALLBACK_OUTPUT__beacont_13
[ 51](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 framePtr__system_2566
```

C BOF:
```
bin/bof_c.o:     file format pe-x86-64

SYMBOL TABLE:
[  0](sec -2)(fl 0x00)(ty   0)(scl 103) (nx 1) 0x0000000000000000 hello.c
File 
[  2](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 1) 0x0000000000000000 go
AUX tagndx 0 ttlsiz 0x0 lnnos 0 next 0
[  4](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .text
AUX scnlen 0x2f nreloc 2 nlnno 0
[  6](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0
[  8](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0
[ 10](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata
AUX scnlen 0x10 nreloc 0 nlnno 0
[ 12](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .xdata
AUX scnlen 0xc nreloc 0 nlnno 0
[ 14](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .pdata
AUX scnlen 0xc nreloc 3 nlnno 0
[ 16](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$zzz
AUX scnlen 0x1d nreloc 0 nlnno 0
[ 18](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 __imp_BeaconPrintf
```