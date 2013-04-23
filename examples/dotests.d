// If your directory tree looks like this:
//   deimos-sane/deimos/sane/sane.d
//   deimos-sane/deimos/sane/bindingtests.d
//   deimos-sane/examples/dotests.d
//   deimos-sane/README.md
//   deimos-sane/c/*
//
// Then compile and run like so:
//   cd deimos-sane
//   gcc deimos/sane/bindingtestsc.c -c
//   dmd examples/dotests.d deimos/sane/*.d -I./ bindingtestsc.o -L-lsane -unittest
//   ./dotests
//
// The above invocations may vary depending on operating system used and
//   which C and D compilers are available, but hopefully they are useful
//   hints in any case.
//
// Ideally, the C compiler used is the same one used to compile the libsane
//   library file that you will be linking against.  The closer you can get to
//   compiling bindingtests.d the same way that libsane was compiled, the more
//   conclusive your tests will be.  Using a completely different compiler may
//   cause the C types tested against to vary slightly from the ones present
//   in the originally compiled libsane.
//

import std.stdio;
import deimos.sane.sane;
import deimos.sane.saneopts;
import deimos.sane.bindingtests;

bool testsWereDone = false;

unittest
{
	testsWereDone = true;
}

void main()
{
	if ( testsWereDone )
		writeln("unittests pass!  Your SANE binding is good to go.");
	else
		writeln("unittests did not run.  Did you pass -unittest to your compiler?");
}
