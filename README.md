# rtg

RTG is Regular Tree Grammar validator.
RTG is BNF like syntax checker for prolog complex term.

## Example


    :- use_module(rtg).
    syntax(integer).
    i ::= integer.
    e ::= i | e+e | e-e |e*e | e/e.
    :- i(1).
    :- e(1*2+3/2-1).
    :- halt.

## Installation

This package requires Swi-Prolog 7.x.

    pack_install(rtg).

## Known issues

Sorting is not stable.

## Bug reports/feature requests

Please send bug reports/feature request through the GitHub
project [page](https://github.com/hsk/rtg).

## API documentation

See <http://github.com/hsk/rtg/doc/>.

## Changelog

 * 2017-07-15 v0.0.1

## License

The MIT License. See LICENSE file.
