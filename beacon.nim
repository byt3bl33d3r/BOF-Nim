#[
    Beacon Object Files (BOF)
    -------------------------
    A Beacon Object File is a light-weight post exploitation tool that runs
    with Beacon's inline-execute command.

    Additional BOF resources are available here:
    - https://github.com/Cobalt-Strike/bof_template

    Cobalt Strike 4.x
    ChangeLog:
        1/25/2022: updated for 4.5
]#

import winim/lean

type
  wchar_t {.importc.} = object

  datap* {.bycopy.} = object
    original*: cstring         ##  the original buffer [so we can free it]
    buffer*: cstring           ##  current pointer into our buffer
    length*: cint              ##  remaining length of data
    size*: cint                ##  total size of this buffer


  formatp* {.bycopy.} = object
    original*: cstring         ##  the original buffer [so we can free it]
    buffer*: cstring           ##  current pointer into our buffer
    length*: cint              ##  remaining length of data
    size*: cint                ##  total size of this buffer

const
  CALLBACK_OUTPUT* = 0x0
  CALLBACK_OUTPUT_OEM* = 0x1e
  CALLBACK_OUTPUT_UTF8* = 0x20
  CALLBACK_ERROR* = 0x0d

## data API
proc BeaconDataParse*(parser: ptr datap; buffer: cstring; size: cint) {.importc, exportc: "__imp_$1".}
proc BeaconDataPtr*(parser: ptr datap; size: cint): cstring {.importc, exportc: "__imp_$1".}
proc BeaconDataInt*(parser: ptr datap): cint {.importc, exportc: "__imp_$1".}
proc BeaconDataShort*(parser: ptr datap): cshort {.importc, exportc: "__imp_$1".}
proc BeaconDataLength*(parser: ptr datap): cint {.importc, exportc: "__imp_$1".}
proc BeaconDataExtract*(parser: ptr datap; size: ptr cint): cstring {.importc, exportc: "__imp_$1".}

##  format API
proc BeaconFormatAlloc*(format: ptr formatp; maxsz: cint) {.importc, exportc: "__imp_$1".}
proc BeaconFormatReset*(format: ptr formatp) {.importc, exportc: "__imp_$1".}
proc BeaconFormatAppend*(format: ptr formatp; text: cstring; len: cint) {.importc, exportc: "__imp_$1".}
proc BeaconFormatPrintf*(format: ptr formatp; fmt: cstring) {.varargs, importc, exportc: "__imp_$1".}
proc BeaconFormatToString*(format: ptr formatp; size: ptr cint): cstring {.importc, exportc: "__imp_$1".}
proc BeaconFormatFree*(format: ptr formatp) {.importc, exportc: "__imp_$1".}
proc BeaconFormatInt*(format: ptr formatp; value: cint) {.importc, exportc: "__imp_$1".}

##  Output Functions
proc BeaconOutput*(`type`: cint; data: cstring; len: cint) {.importc, exportc: "__imp_$1".}
proc BeaconPrintf*(`type`: cint; fmt: cstring) {.varargs, importc, exportc: "__imp_$1".}

##  Token Functions
proc BeaconUseToken*(token: HANDLE): BOOL {.importc, exportc: "__imp_$1".}
proc BeaconRevertToken*() {.importc, exportc: "__imp_$1".}
proc BeaconIsAdmin*(): BOOL {.importc, exportc: "__imp_$1".}

##  Spawn+Inject Functions
proc BeaconGetSpawnTo*(x86: BOOL; buffer: cstring; length: cint) {.importc, exportc: "__imp_$1".}
proc BeaconInjectProcess*(hProc: HANDLE; pid: cint; payload: cstring; p_len: cint; p_offset: cint; arg: cstring; a_len: cint) {.importc, exportc: "__imp_$1".}
proc BeaconInjectTemporaryProcess*(pInfo: ptr PROCESS_INFORMATION; payload: cstring; p_len: cint; p_offset: cint; arg: cstring; a_len: cint) {.importc, exportc: "__imp_$1".}
proc BeaconSpawnTemporaryProcess*(x86: BOOL; ignoreToken: BOOL; si: ptr STARTUPINFO; pInfo: ptr PROCESS_INFORMATION): BOOL {.importc, exportc: "__imp_$1".}
proc BeaconCleanupProcess*(pInfo: ptr PROCESS_INFORMATION) {.importc, exportc: "__imp_$1".}

##  Utility Functions
proc toWideChar*(src: cstring; dst: ptr wchar_t; max: cint): BOOL {.importc, exportc: "__imp_$1".}