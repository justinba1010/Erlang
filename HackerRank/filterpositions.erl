-module(filterpositions).
-export([main/0]).

main() ->
  List = getListInt(),
  print_list(List,0).

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
print_list([],_) -> ok;
print_list([Head|Tail],Counter) when Counter rem 2 == 1 ->
  io:format("~w~n",[Head]),
  print_list(Tail,Counter+1);
print_list([_|Tail],Counter)->
  print_list(Tail,Counter+1).
