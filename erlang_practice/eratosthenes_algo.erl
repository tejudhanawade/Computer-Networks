-module(eratosthenes_algo).
-export([gene_number/1]).%%,process_spawn/1]).

gene_number(0)->  1;
gene_number(N)->
  io:format("~.B~n", [N]),
  %%N+1,
  process_spawn(N+1).

process_spawn(12)-> 12;
process_spawn(M)->
  spawn(eratosthenes_algo,gene_number,[M]).


