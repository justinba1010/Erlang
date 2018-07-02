-module(list_len).
-export([main/0]).

main() ->
  List = getListInt(),
  print_list(List,0).

getListInt() -> getListInt([]).
getListInt(List) ->
  Line = io:get_line(""),
  case Line of
    eof -> List;%Order doesn't matter
    "eof\n" -> List;
    Number ->
      [Y|_] = string:split(Number,"\n"),
      {YY,_} = string:to_integer(Y),
      getListInt([YY] ++ List)
    end.
print_list([],Counter) -> io:format("~w~n",[Counter]);
print_list([_|Tail],Counter)->
  print_list(Tail,Counter+1).
