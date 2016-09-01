-module(error_tmout).
-export([read/1,flush/0,send_after/2,send/3,sleep/1]).

read(Key)->
  flush(),
  p2 ! {self(),{read,Key}},
  receive
    {read,R} -> {ok,R};
    {error,Reaason} -> {error,Reaason}
      after 1000 -> {error,timeout}
  end.
flush() ->
  receive
    {read,_} -> flush();
    {error,_} -> flush()
  after 0 -> ok
  end.

send_after(Time, Msg) ->
  spawn(error_tmout, send, [self(),Time,Msg]).

send(Pid, Time, Msg) ->
  receive
  after  Time ->
           Pid ! Msg
  end.

sleep(T) ->
  receive
  after T ->
          true
  end.
