
-module(filter_array2).
-export([main/0]).

main() ->
    [X|_] = string:split(io:get_line(""),"\n"),
    {Z,_} = string:to_integer(X),
    List = getList(),
    print_list(List, Z).

getList() -> getList([]).
getList(List) ->
  Line = io:get_line(""),
  case Line of
    eof -> lists:reverse(List);
    "eof\n" -> lists:reverse(List);
    Number ->
      [Y|_] = string:split(Number,"\n"),
      {YY,_} = string:to_integer(Y),
      getList([YY] ++ List)
    end.

print_list([],_) -> ok;
print_list([Head | Tail],X) when Head < X ->
  io:format("~w~n", [Head]),
  print_list(Tail,X);
print_list([_ | Tail], X) ->
  print_list(Tail,X).
