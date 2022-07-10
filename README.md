# BOF-Nim

oh yeah baby

Help welcome!~

Build `bof.nim` by running `make nim` in the root of this repo. This will produce `bof_nim.o` in the `bin/` directory.

## Problems 

1. ~~Getting the `go` function to be present in the Symbol table.~~
2. ~~Making import `Beacon*` functions exported in the symbol table with the `__imp_` prefix~~
3. Making it not crash when running it through [Invoke-BOF](https://github.com/airbus-cert/Invoke-Bof)

<img width="684" alt="image" src="https://user-images.githubusercontent.com/5151193/178163824-bb5f67ad-03c1-4b2c-a9cf-491b30a87d58.png">

## Nim BOF vs "Normal" C BOF

Nim BOF:
```
bin/bof_nim.o:     file format pe-x86-64

SYMBOL TABLE:
[  0](sec -2)(fl 0x00)(ty   0)(scl 103) (nx 1) 0x0000000000000000 @mbof.nim.c
File 
[  2](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 1) 0x0000000000000000 PreMainInner
AUX tagndx 0 ttlsiz 0x0 lnnos 0 next 0
[  4](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000005 NimMainInner
[  5](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000006 PreMain
[  6](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000003c NimMain
[  7](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000068 go
[  8](sec  7)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 main
[  9](sec 10)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata$.refptr.nim_program_result
AUX scnlen 0x8 nreloc 1 nlnno 0 checksum 0x0 assoc 0 comdat 2
[ 11](sec  1)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x000000000000008d NimMainModule
[ 12](sec  1)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .text
AUX scnlen 0x8e nreloc 8 nlnno 0
[ 14](sec  2)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0
[ 16](sec  3)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .bss
AUX scnlen 0x14 nreloc 0 nlnno 0
[ 18](sec  4)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .xdata
AUX scnlen 0x24 nreloc 0 nlnno 0
[ 20](sec  5)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .pdata
AUX scnlen 0x48 nreloc 18 nlnno 0
[ 22](sec  6)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .rdata
AUX scnlen 0x10 nreloc 0 nlnno 0
[ 24](sec  7)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .text.startup
AUX scnlen 0x3f nreloc 6 nlnno 0
[ 26](sec  8)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .xdata.startup
AUX scnlen 0xc nreloc 0 nlnno 0
[ 28](sec  9)(fl 0x00)(ty   0)(scl   3) (nx 1) 0x0000000000000000 .pdata.startup
AUX scnlen 0xc nreloc 3 nlnno 0
[ 30](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000008 cmdLine
[ 31](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000010 cmdCount
[ 32](sec  3)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 gEnv
[ 33](sec 10)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 .refptr.nim_program_result
[ 34](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 __main
[ 35](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 stdlib_ioInit000
[ 36](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 stdlib_ioDatInit000
[ 37](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 systemDatInit000
[ 38](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 nimGC_setStackBottom
[ 39](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 systemInit000
[ 40](sec  0)(fl 0x00)(ty  20)(scl   2) (nx 0) 0x0000000000000000 __imp_BeaconPrintf
[ 41](sec  0)(fl 0x00)(ty   0)(scl   2) (nx 0) 0x0000000000000000 nim_program_result
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