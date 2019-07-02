# to compile, just type `make` (for byte code) or `make nc` (for
# native code).

THREADS = yes

SOURCES = randomize.ml

PACKS =  bogue

RESULT = randomize

-include OCamlMakefile
