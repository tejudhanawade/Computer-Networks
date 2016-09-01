-module(user_telnet).
-export([protocol/0]).

protocol()->
  register(usr,self()),
  ok.
