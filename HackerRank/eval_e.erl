-module(eval_e).
-export([main/0,e/1]).


factorial(0) -> 1;
factorial(1) -> 1;
factorial(Number) when Number < 0 -> 0;
factorial(Number) -> Number*factorial(Number-1).

e(0) -> 1;
e(X) ->
  e(X,0,10).
e(_,C,0) ->
  C+1;
e(X,C,N) ->
  D = C + math:pow(X,N)/factorial(N),
  e(X,D,N-1).

main() ->
  _ = io:get_line(""),
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
   io:format("~w~n",[e(Head)]),
  print_list(Tail).
