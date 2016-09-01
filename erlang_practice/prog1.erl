-module(prog1).
-export([add1/2]).
-export([currying/1]).
-export([relative1/1]).
add1(B,A)->A+B.
%%add2(Z)->Z.

currying(F)->
  fun(X)->
      (fun(Y)->
      F(X,Y) end) end.

map(F,[])->[];
map(F,[H|T])->[F(H)|map(F,T)].

relative1({C,D})->
  if
    C < D ->smaller;
    C > D -> bigger;
    true -> equal
  end.

%%armstrong book chp no: 3, 4 and 6.
