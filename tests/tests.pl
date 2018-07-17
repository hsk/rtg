:- use_module(prolog/rtg).
:- op(600,xf,*).
enum ::= a | b | c.
syntax(integer).
i ::= integer.
e ::= i|e+e|e-e|e*e|e/e.

syntax(maplist(_)).
list(T) ::= maplist(T).
ls ::= list(i).

:- begin_tests(rtg_enum).

test(enum1) :- enum(a),enum(b),enum(c).

:- end_tests(rtg_enum).

:- begin_tests(rtg_calc).

test(i) :- i(1).
test(e) :- e(1),e(1+1),e(1-2),e(1*2),e(1/2).
test(e2):- e(1*2/3+5*4-6).
test(paren):- e(1*2/3+5*(4-6)).

:- end_tests(rtg_calc).

:- begin_tests(rtg_list).

test(list) :- list(i,[1,2,3]).
test(list) :- ls([1,2,3]).

:- end_tests(rtg_list).

test3 ::= add*i | sub*i.

:- begin_tests(rtg_match).

test(match1) :- test3(add*1).
test(match2) :- test3(sub*1).

:- end_tests(rtg_match).

:- run_tests.
:- halt.
