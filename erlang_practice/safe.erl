-module(safe).
-export([safe/1,checking_loop/3]).

safe(Key)->
  Len = length(Key),
  Ent = [],
  register(s1,self()),
  %%io:format("~w~n",[self()]),
  checking_loop(Key,Len,Ent).

checking_loop(Key,Len,Ent) ->
   receive
     X ->
       case (Ent++X) of
         Key -> open_state();
         Y when length(Y)< Len
                 -> checking_loop(Key, Len, Ent ++ X);
         _-> checking_loop(Key,Len,[])
       end
   end.


open_state()->
  io:format("Opened"),
  ok.
%%receive
%%  after 100->
        %% io:format("Closed")
%%  end.




