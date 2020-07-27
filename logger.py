#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
The module is logger-related, and there exist some functions
of log.
"""
import datetime
import sys

# log level, 0 only println, 1 add debugln, 2 add verboseln
lvl = 0


def debugln(*args):
    if lvl:
        println(*args)


def verboseln(*args):
    if lvl >= 2:
        println(*args)


def println(*args):
    pre = datetime.datetime.now().strftime('%Y/%m/%d %H:%M:%S')
    print(pre, *args)


def panicln(*args):
    println(*args)
    raise Exception(' '.join(str(e) for e in args))


def fatalln(*args):
    println(*args)
    println('exit status 1')
    sys.exit(1)
