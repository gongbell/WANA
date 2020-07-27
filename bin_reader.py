#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
The module include WebAssembly bytecode file read function.
"""
import number


def read_count(reader, maxbits=32, signed=False) -> int:
    return number.leb(reader, maxbits, signed)[1]


def read_bytes(reader, maxbits=32, signed=False) -> bytearray:
    n = read_count(reader, maxbits, signed)
    return bytearray(reader.read(n))
