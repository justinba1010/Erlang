
-module(listMaker).
-export([addList/1, addList/2]).


addList(Number) ->
  addList(Number,[]).
addList(Number, AList) when Number =< 0 ->
  AList;
addList(Number, AList) ->
  {_,[Item]} = io:fread("Enter a thing for list: ","~d"),
  addList(Number-1, AList ++ [Item]).
