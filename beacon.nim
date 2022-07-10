{.emit: """
/*
 * Beacon Object Files (BOF)
 * -------------------------
 * A Beacon Object File is a light-weight post exploitation tool that runs
 * with Beacon's inline-execute command.
 *
 * Additional BOF resources are available here:
 *   - https://github.com/Cobalt-Strike/bof_template
 *
 * Cobalt Strike 4.x
 * ChangeLog:
 *    1/25/2022: updated for 4.5
 */

#include <windows.h>
#include <ntdef.h>
#include <processthreadsapi.h>

/* data API */
typedef struct {
	char * original; /* the original buffer [so we can free it] */
	char * buffer;   /* current pointer into our buffer */
	int    length;   /* remaining length of data */
	int    size;     /* total size of this buffer */
} datap;

DECLSPEC_IMPORT void    BeaconDataParse(datap * parser, char * buffer, int size);
DECLSPEC_IMPORT char *  BeaconDataPtr(datap * parser, int size);
DECLSPEC_IMPORT int     BeaconDataInt(datap * parser);
DECLSPEC_IMPORT short   BeaconDataShort(datap * parser);
DECLSPEC_IMPORT int     BeaconDataLength(datap * parser);
DECLSPEC_IMPORT char *  BeaconDataExtract(datap * parser, int * size);

/* format API */
typedef struct {
	char * original; /* the original buffer [so we can free it] */
	char * buffer;   /* current pointer into our buffer */
	int    length;   /* remaining length of data */
	int    size;     /* total size of this buffer */
} formatp;

DECLSPEC_IMPORT void    BeaconFormatAlloc(formatp * format, int maxsz);
DECLSPEC_IMPORT void    BeaconFormatReset(formatp * format);
DECLSPEC_IMPORT void    BeaconFormatAppend(formatp * format, char * text, int len);
DECLSPEC_IMPORT void    BeaconFormatPrintf(formatp * format, char * fmt, ...);
DECLSPEC_IMPORT char *  BeaconFormatToString(formatp * format, int * size);
DECLSPEC_IMPORT void    BeaconFormatFree(formatp * format);
DECLSPEC_IMPORT void    BeaconFormatInt(formatp * format, int value);

/* Output Functions */
#define CALLBACK_OUTPUT      0x0
#define CALLBACK_OUTPUT_OEM  0x1e
#define CALLBACK_OUTPUT_UTF8 0x20
#define CALLBACK_ERROR       0x0d

DECLSPEC_IMPORT void   BeaconOutput(int type, char * data, int len);
DECLSPEC_IMPORT void   BeaconPrintf(int type, char * fmt, ...);


/* Token Functions */
DECLSPEC_IMPORT BOOL   BeaconUseToken(HANDLE token);
DECLSPEC_IMPORT void   BeaconRevertToken();
DECLSPEC_IMPORT BOOL   BeaconIsAdmin();

/* Spawn+Inject Functions */
DECLSPEC_IMPORT void   BeaconGetSpawnTo(BOOL x86, char * buffer, int length);
DECLSPEC_IMPORT void   BeaconInjectProcess(HANDLE hProc, int pid, char * payload, int p_len, int p_offset, char * arg, int a_len);
DECLSPEC_IMPORT void   BeaconInjectTemporaryProcess(PROCESS_INFORMATION * pInfo, char * payload, int p_len, int p_offset, char * arg, int a_len);
DECLSPEC_IMPORT BOOL   BeaconSpawnTemporaryProcess(BOOL x86, BOOL ignoreToken, STARTUPINFO * si, PROCESS_INFORMATION * pInfo);
DECLSPEC_IMPORT void   BeaconCleanupProcess(PROCESS_INFORMATION * pInfo);

/* Utility Functions */
DECLSPEC_IMPORT BOOL   toWideChar(char * src, wchar_t * dst, int max);
""".}

import winim/lean

type
    wchar_t {.importc.} = object

    datap* {.bycopy, importc, nodecl.} = object
      original*: cstring
      buffer*: cstring
      length*: cint
      size*: cint

    formatp* {.bycopy, importc, nodecl.} = object
      original*: cstring
      buffer*: cstring
      length*: cint
      size*: cint

var
    CALLBACK_OUTPUT*: cint = 0x0
    CALLBACK_OUTPUT_OEM*: cint = 0x1e
    CALLBACK_ERROR*: cint = 0x0d
    CALLBACK_OUTPUT_UTF8*: cint = 0x20

# Data API
proc BeaconDataParse*(parser: ptr datap, buffer: cstring, size: cint) {.importc, nodecl.}
proc BeaconDataPtr*(parser: ptr datap, size: cint): cstring {.importc, nodecl.}
proc BeaconDataInt*(parser: ptr datap): cint {.importc, nodecl.}
proc BeaconDataShort*(parser: ptr datap): cshort {.importc, nodecl.}
proc BeaconDataLength*(parser: ptr datap): cint {.importc, nodecl.}
proc BeaconDataExtract*(parser: ptr datap, size: cint): cstring {.importc, nodecl.}

# Format API
proc BeaconFormatAlloc*(format: ptr formatp, maxsz: cint) {.importc, nodecl.}
proc BeaconFormatReset*(format: ptr formatp) {.importc, nodecl.}
proc BeaconFormatFree*(format: ptr formatp) {.importc, nodecl.}
proc BeaconFormatAppend*(format: ptr formatp, text: cstring, len: cint) {.importc, nodecl.}
proc BeaconFormatPrintf*(format: ptr formatp, fmt: cstring) {.varargs, importc, nodecl.}
proc BeaconFormatToString*(format: ptr formatp, size: cint): cstring {.importc, nodecl.}
proc BeaconFormatInt*(format: ptr formatp, value: cint) {.importc, nodecl.}

# Output Functions
proc BeaconPrintf*(`type`: cint, fmt: cstring) {.varargs, importc, exportc, dynlib, nodecl.}
proc BeaconOutput*(`type`: cint, data: cstring, len: cint) {.importc, nodecl.}

# Token Functions
proc BeaconUseToken*(token: HANDLE): BOOL {.importc, nodecl.}
proc BeaconRevertToken*() {.importc, nodecl.}
proc BeaconIsAdmin*(): BOOL {.importc, nodecl.}

# Spawn+Inject Functions
proc BeaconGetSpawnTo*(x86: BOOL, buffer: cstring, length: cint) {.importc, nodecl.}
proc BeaconInjectProcess*(hProc: HANDLE, pid: cint, payload: cstring, p_len: cint, p_offset: cint, arg: cstring, a_len: int) {.importc, nodecl.}
proc BeaconInjectTemporaryProcess*(pInfo: ptr PROCESS_INFORMATION, payload: cstring, p_len: cint, p_offset: cint, arg: cstring, a_len: cint) {.importc, nodecl.}
proc BeaconSpawnTemporaryProcess*(x86: BOOL, ignoreToken: BOOL, si: ptr STARTUPINFO, pInfo: ptr PROCESS_INFORMATION): BOOL {.importc, nodecl.}
proc BeaconCleanupProcess*(pInfo: ptr PROCESS_INFORMATION) {.importc, nodecl.}

# Utility Functions
proc toWideChar*(src: cstring, dst: ptr wchar_t, max: int): BOOL {.importc, nodecl.}