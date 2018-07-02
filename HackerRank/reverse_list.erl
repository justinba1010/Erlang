-module(reverse_list).
-export([main/0]).

main() ->
  List = getListInt(),
  print_list(List).

getListInt() -> getListInt([]).
getListInt(List) ->
  Line = io:get_line(""),
  case Line of
    eof -> List;
    "eof\n" -> List;
    Number ->
      [Y|_] = string:split(Number,"\n"),
      {YY,_} = string:to_integer(Y),
      getListInt([YY] ++ List)
    end.
print_list([]) -> ok;
print_list([Head|Tail]) ->
  io:format("~w~n",[Head]),
  print_list(Tail).
