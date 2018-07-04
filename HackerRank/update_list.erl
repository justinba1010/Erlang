-module(list_len).
-export([main/0]).

main() ->
  List = getListInt(),
  print_list(List).

getListInt() -> getListInt([]).
getListInt(List) ->
  Line = io:get_line(""),
  case Line of
    eof -> lists:reverse(List);
    "eof\n" -> lists:reverse(List);
    Number ->
      [Y|_] = string:split(Number,"\n"),
      {YY,_} = string:to_integer(Y),
      getListInt([abs(YY)] ++ List)
    end.
print_list([]) -> ok;
print_list([Head|Tail])->
   io:format("~w~n",[Head]),
  print_list(Tail).
