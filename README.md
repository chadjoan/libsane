libsane
=======

D bindings for the [Scanner Access Now Easy API](http://www.sane-project.org/).

SANE is a very simple API, so these bindings should be complete.

These bindings come with unittests to ensure that your D compiler and C compiler agree on the types used by SANE and the layout of the structs used by SANE.  The files for this are `deimos/sane/bindingtests.d` and `deimos/sane/bindingtestsc.c`.  See `examples/dotests.d` for usage.
