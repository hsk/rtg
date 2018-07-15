# rtg

RTG is BNF like syntax checker macros of Regular Tree Grammar for prolog complex term.

## Example

    :- use_module(library(rtg)).
    syntax(integer).
    i ::= integer.
    e ::= i | e+e | e-e |e*e | e/e.
    :- i(1).
    :- e(1*2+3/2-1).
    :- halt.

## Installation

This package requires Swi-Prolog 7.x.

    ?- pack_install(rtg).

## Bug reports/feature requests

Please send bug reports/feature request through the GitHub
project [page](https://github.com/hsk/rtg).

## API documentation

See <http://github.com/hsk/rtg/doc/>.

## Changelog

 * 2018-07-15 v0.0.3
 * 2018-07-15 v0.0.2
 * 2018-07-15 v0.0.1

## License

The MIT License. See LICENSE file.
