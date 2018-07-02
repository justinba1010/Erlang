% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(list_replication).
-export([main/0]).

main() ->
  {ok, [X]} = io:fread("", "~d"),
  List = getListInt(),
  print_list(List,X-1,X).

getListInt() -> getListInt([]).
getListInt(List) ->
  Line = io:get_line(""),
  case Line of
    eof -> lists:reverse(List);
    "eof\n" -> lists:reverse(List);
    Number ->
      [Y|_] = string:split(Number,"\n"),
      {YY,_} = string:to_integer(Y),
      getListInt([YY] ++ List)
    end.

print_list([],_,_) -> ok;
print_list([Head|Tail],0,OX) ->
  io:format("~w~n",[Head]),
  print_list(Tail,OX-1,OX);

print_list(List,X,OX) ->
  [Head|_] = List,
  io:format("~w~n",[Head]),
  print_list(List,X-1,OX).
