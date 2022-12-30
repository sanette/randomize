(lang dune 3.6)
(name randomize)
(generate_opam_files true)
(source (github sanette/randomize))
(maintainers "Vu Ngoc San <san.vu-ngoc@laposte.net>")
(authors "Vu Ngoc San <san.vu-ngoc@laposte.net>")
(license GPL-3.0-or-later)
(documentation https://github.com/sanette/randomize)

(package
 (name randomize)
 (synopsis "Need a random number?")
 (description "A demo app showing basic usage of the Bogue library.")
 (depends ocaml dune)
 (tags
  (bogue demo gui random)))
