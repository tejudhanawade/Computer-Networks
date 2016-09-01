-module (fun_prog).
-export([listlength/1]).
-export([factorial/1]).
-export([ length1/1]).
-export([ divby1/1]).
listlength([])->0;
listlength([H|T])->1+listlength(T).

factorial(0)->1;
factorial(N)->N*factorial(N-1).

length1(X)->lenght2(X,0).
lenght2([],Y)->Y;
lenght2([H|T],Y) -> lenght2(T,Y+1).

divby1(J)->
  try (5/J) of
    J-> J
  catch
    error:Z -> io:format("Except is ~w~n",[Z])
  end.
