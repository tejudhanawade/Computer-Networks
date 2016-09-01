-module(eratos).
-export([main/0,seive/0,filterloop/2,gen/1]).
-define (MAX,100).
gen(Proc)-> gen(Proc,2).
gen(Proc,N)->
  if N =< ?MAX -> Proc ! N,
                  gen(Proc,N+1);
     true -> stop
  end.
filterloop(Prime,NS)  -> % NS is 
  receive 
    N when is_integer(N)->
      if N rem Prime =/= 0 -> NS ! N;
         true -> ok
      end,
      filterloop(Prime,NS);
    stop -> ok;
    X -> io:format("Something Streng ~w~n",[X])
  end.

seive()->
  receive Prime ->
            io:format("~w~n",[Prime])
  end,
    NS = spawn(eratos,seive,[]),
    filterloop(Prime,NS).




main() ->   gen(spawn(fun seive/0)).
