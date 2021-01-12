import winim/lean

type
    wchar_t {.importc.} = object
    datap* {.importc, header:"beacon.h".} = object
    formatp* {.importc, header"beacon.h".} = object

var
    CALLBACK_OUTPUT*: cint = 0x0
    CALLBACK_OUTPUT_OEM*: cint = 0x1e
    CALLBACK_ERROR*: cint = 0x0d
    CALLBACK_OUTPUT_UTF8*: cint = 0x20

# Data API
proc BeaconDataParse*(parser: ptr datap, buffer: cstring, size: cint) {.importc, header:"beacon.h".}
proc BeaconDataInt*(parser: ptr datap): cint {.importc, header:"beacon.h".}
proc BeaconDataShort*(parser: ptr datap): cshort {.importc, header:"beacon.h".}
proc BeaconDataLength*(parser: ptr datap): cint {.importc, header:"beacon.h".}
proc BeaconDataExtract*(parser: ptr datap, size: cint): cstring {.importc, header:"beacon.h".}

# Format API
proc BeaconFormatAlloc*(format: ptr formatp, maxsz: cint) {.importc, header:"beacon.h".}
proc BeaconFormatReset*(format: ptr formatp) {.importc, header:"beacon.h".}
proc BeaconFormatFree*(format: ptr formatp) {.importc, header:"beacon.h".}
proc BeaconFormatAppend*(format: ptr formatp, text: cstring, len: cint) {.importc, header:"beacon.h".}
proc BeaconFormatPrintf*(format: ptr formatp, fmt: cstring) {.varargs, importc, header:"beacon.h".}
proc BeaconFormatToString*(format: ptr formatp, size: cint): cstring {.importc, header:"beacon.h".}
proc BeaconFormatInt*(format: ptr formatp, value: cint) {.importc, header:"beacon.h".}

# Output Functions
proc BeaconPrintf*(`type`: cint, fmt: cstring) {.varargs, importc, header:"beacon.h".}
proc BeaconOutput*(`type`: cint, data: cstring, len: cint) {.importc, header:"beacon.h".}

# Token Functions
proc BeaconUseToken*(token: HANDLE): BOOL {.importc, header:"beacon.h".}
proc BeaconRevertToken*() {.importc, header:"beacon.h".}
proc BeaconIsAdmin*(): BOOL {.importc, header:"beacon.h".}

# Spawn+Inject Functions
proc BeaconGetSpawnTo*(x86: BOOL, buffer: cstring, length: cint) {.importc, header:"beacon.h".}
proc BeaconInjectProcess*(hProc: HANDLE, pid: cint, payload: cstring, p_len: cint, p_offset: cint, arg: cstring, a_len: int) {.importc, header:"beacon.h".}
proc BeaconInjectTemporaryProcess*(pInfo: ptr PROCESS_INFORMATION, payload: cstring, p_len: cint, p_offset: cint, arg: cstring, a_len: cint) {.importc, header:"beacon.h".}
proc BeaconCleanupProcess*(pInfo: ptr PROCESS_INFORMATION) {.importc, header:"beacon.h".}

# Utility Functions
proc toWideChar*(src: cstring, dst: ptr wchar_t, max: int): BOOL {.importc, header:"beacon.h".}