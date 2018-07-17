:- module(rtg,[op(1200, xfx, [::=])]).
% rtg.pl : Regular Tree Grammer validator generator

:- op(1200, xfx, [::=]).

user:term_expansion(A::=B, A_ :- syntax(A_,M,B)) :- assert(syntax(A)), apply_expansion(A,[M],A_).
%goal_expansion(A,_) :- writeln(goal(A)),fail.
user:term_expansion(syntax(A),syntax_ignore) :- assert(syntax(A)).
user:goal_expansion(syntax(_,M,A),B_) :- syntax_expansion(M,A,B_).

apply_expansion(A,M,L) :- atom(A), L =.. [A|M].
apply_expansion(A,M,L) :- A=..B,append(B,M,R), L =.. R.

syntax_expansion(M,A,R) :- var(A),apply_expansion(call,[A,M],R).
syntax_expansion(M,B|Bs,(B_,!);Bs_) :- syntax_expansion(M,B,B_), syntax_expansion(M,Bs,Bs_).
syntax_expansion(M,A,R)   :- syntax(A),apply_expansion(A,[M],R).
syntax_expansion(M,A,M=A) :- atom(A),!.
syntax_expansion(M,A,(M=B,!,B_))  :- A =.. [A_|Ps], maplist(syntax_expansion,Ms,Ps,Es), B =.. [A_|Ms],!,
                                     reverse(Es,Es1),foldl([A1,B1,(A1,B1)]>>!,Es1,!,B_).

syntax(atom).
:- user:discontiguous(syntax/1).
:- user:discontiguous(syntax_ignore/0).
