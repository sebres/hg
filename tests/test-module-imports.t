#require test-repo

This code uses the ast module, which was new in 2.6, so we'll skip
this test on anything earlier.
  $ $PYTHON -c 'import sys ; assert sys.version_info >= (2, 6)' || exit 80

  $ import_checker="$TESTDIR"/../contrib/import-checker.py

Run the doctests from the import checker, and make sure
it's working correctly.
  $ TERM=dumb
  $ export TERM
  $ python -m doctest $import_checker

  $ cd "$TESTDIR"/..

There are a handful of cases here that require renaming a module so it
doesn't overlap with a stdlib module name. There are also some cycles
here that we should still endeavor to fix, and some cycles will be
hidden by deduplication algorithm in the cycle detector, so fixing
these may expose other cycles.

  $ hg locate 'mercurial/**.py' | sed 's-\\-/-g' | xargs python "$import_checker"
  mercurial/crecord.py mixed imports
     stdlib:    fcntl, termios
     relative:  curses
  mercurial/dispatch.py mixed imports
     stdlib:    commands
     relative:  error, extensions, fancyopts, hg, hook, util
  mercurial/fileset.py mixed imports
     stdlib:    parser
     relative:  error, merge, util
  mercurial/revset.py mixed imports
     stdlib:    parser
     relative:  error, hbisect, phases, util
  mercurial/templater.py mixed imports
     stdlib:    parser
     relative:  config, error, templatefilters, templatekw, util
  mercurial/ui.py mixed imports
     stdlib:    formatter
     relative:  config, error, scmutil, util
  Import cycle: mercurial.cmdutil -> mercurial.context -> mercurial.subrepo -> mercurial.cmdutil
