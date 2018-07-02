% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(filter_array).
-export([main/0]).

main() ->
    [X|_] = string:split(io:get_line(""),"\n"),
    {Z,_} = string:to_integer(X),
    List = getList(),
    NewList = filter_list(List,[],Z),
    print_list(NewList).

getList() -> getList([]).
getList(List) ->
    Line = io:get_line(""),
    case Line of
        eof -> lists:reverse(List);
        "eof\n" -> lists:reverse(List);
        Number ->
            [Y|_] = string:split(Number,"\n"),
            YY = string:to_integer(Y),
            {YYY,_} = YY,
            getList([YYY] ++ List)
    end.


filter_list([], List2, _) ->
  lists:reverse(List2);

filter_list(List1, List2, X) ->
  [Head|Tail] = List1,
  if
    Head < X ->
      filter_list(Tail, [Head] ++ List2, X);
    true ->
      filter_list(Tail, List2, X)
    end.

print_list([]) -> ok;
print_list(List) ->
  [Head|Tail] = List,
  io:format("~w~n",[Head]),
  print_list(Tail).
