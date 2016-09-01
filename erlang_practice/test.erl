-module(test).
-export([test/0]).

test() ->
  register(t1,self()),
  p1 ! 'Helo to test program',
  A = [],
  new_1(A).

new_1(A)->
  receive X ->
            if X==stop -> ok;
              X/= stop-> p1 ! A++X,
                    new_1(A++X)
            end
  end.

