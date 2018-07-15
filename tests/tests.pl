:- use_module(prolog/rtg).

enum ::= a | b | c.
syntax(integer).
i ::= integer.
e ::= i|e+e|e-e|e*e|e/e.

:- begin_tests(rtg_enum).

test(enum1) :- enum(a),enum(b),enum(c).

:- end_tests(rtg_enum).


:- begin_tests(rtg_calc).

test(i) :- i(1).
test(e) :- e(1),e(1+1),e(1-2),e(1*2),e(1/2).
test(e2):- e(1*2/3+5*4-6).
test(paren):- e(1*2/3+5*(4-6)).

:- end_tests(rtg_calc).
