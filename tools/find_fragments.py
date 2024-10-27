#!/usr/bin/env python3

import sys
import re
import os
from pathlib import Path

# FRAGMENT Finder

def read_32_be_value(file_arr, i):
    return (file_arr[i + 0] << 24) + (file_arr[i + 1] << 16)  \
         + (file_arr[i + 2] << 8)  + (file_arr[i + 3])

filepath = Path(sys.argv[1])

file = open(filepath, 'rb')
rom_data = bytearray(file.read(0x440000))

i = 0
frag_num = 1
for i in range(i, 0x440000, 8):
    frag1 = read_32_be_value(rom_data, i + 0)
    frag2 = read_32_be_value(rom_data, i + 4)
    if frag1 == 0x46524147 and frag2 == 0x4D454E54: # "FRAGMENT"
        fragname = "fragment" + str(frag_num)
        
        print("  - name:", fragname)
        print("    type: code")
        print("    bss_size: 0x0")
        print("    start: ", hex(i - 8), sep='')
        print("    vram: 0x00000000 # unk vram")
        print("    subsegments:")
        print("    - [", hex((i - 8)), ", hasm, fragments/", frag_num, "/", fragname, "_header]", sep='')
        print("    - [", hex((i - 8) + 0x20), ", asm,  fragments/", frag_num, "/", fragname, "_code]", sep='')
        print("")
        frag_num = frag_num + 1
