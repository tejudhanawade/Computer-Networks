-module(records).
-export([display/1,display1/1]).

-record(person,{name,phone,age}).
display(#person{age=21,name="Praju"})->ok;
display(_)-> notok.

display1(#person{age=Age,name = "Dip"}=P) -> P#person{age=Age+1};
display1(P) -> P.
