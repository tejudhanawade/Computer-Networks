-module(echo_new).
-export([echo/0]).  %%send_mesg/1,send_stop/0,loop_fun/0]).

echo()->
  register('echo_new1',self()),
  loop_receive("").
loop_receive(Y)->
  receive
    {Sender,X} -> Sender ! Y++X,
                  loop_receive(Y++X);
    stop -> ok
  end.

%%send_mesg(X) -> 'echo_new1' ! {self(),X}.

%%send_stop() -> 'echo_new1' ! stop.
