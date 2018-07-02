-module(sum_odd).
-export([main/0]).

main() ->
  List = getListInt(),
  io:format("~w~n",[print_list(List,0)]).


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
print_list([],Sum) -> Sum;
print_list([Head|Tail],Sum) when abs(Head rem 2) == 1 ->
  print_list(Tail,Sum+Head);
print_list([_|Tail],Sum)->
  print_list(Tail,Sum).
