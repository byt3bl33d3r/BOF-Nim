import beacon

proc NimMain() {.cdecl, importc.}

proc go*(args: cstring, alen: cint) {.cdecl, exportc} =
    NimMain()
    BeaconPrintf(CALLBACK_OUTPUT, "Hello World: %s", args)
