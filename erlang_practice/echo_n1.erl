-module(echo_n1).
-export([go/0,loop/0]).

go()->
  Pid = spawn(echo_n1,loop,[]),
      io:format("~w~n",[Pid]),
  Pid !{self(),'hellonew how r u?'},
  receive
    {Pid,Msg}->
      io:format("~w~n",[Msg])
  end,
  Pid ! stop.

loop()->
  receive
    {From,Msg}->
      From ! {self(),Msg},
      loop();
    stop->
      true
  end.

