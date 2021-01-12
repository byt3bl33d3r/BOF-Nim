import beacon

proc go(args: cstring, alen: cint) = 
    BeaconPrintf(CALLBACK_OUTPUT, "Hello World: %s", args)