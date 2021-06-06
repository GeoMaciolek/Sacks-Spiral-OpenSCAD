# Sacks Spiral OpenSCAD

A 3D-Printable Sacks Spiral, a prime spiral variant of the Ulam spiral. OpenSCAD, customizable.

## Overview

**STILL IN PROGRESS** 

*As of 2021-06-06, this will "sort of" work; you'll get a missing base, and customization parameters won't work quite as expected.*

This OpenSCAD-based Sacks spiral - licensed under the GPL3 - is usable as a stamp, or a general art object. It's a great way of illustrating the patterns behind prime numbers.  The [Sacks spiral](http://www.numberspiral.com/), invented in 1994 by Robert Sacks, is a variant of the [Ulam spiral](https://en.wikipedia.org/wiki/Ulam_spiral), invented in 1963.

![Screenshot of Sacks Spiral](/images/sacks-spiral-5k-v1.png?raw=True "Screenshot of Sacks Spiral")

## Getting Started

### Thingiverse object

**NOT YET AVAILABLE**

The simplest way to make use of this WILL BE to simply download the .STL file from [Thingiverse](https://www.thingiverse.com/thing:2564127).

### Customization

This is based on OpenSCAD, and as such can be changed parametrically. Thingiverse parametric functionality is not yet implemented.

* OpenSCAD (developed on 2015.03-3, and 2021-01, may work on others)

Simply load the .scad file, and go from there.

Addtionally, `generate-prime-table.py` can be used to create a longer list of primes for `prime_table.scad` - which contains 0-5000 by default.

