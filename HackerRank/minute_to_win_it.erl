-module(solution).
-export([main/0]).
-import(os, [getenv/1]).

% Complete the minuteToWinIt function below.
minuteToWinIt(A, K) ->
    {Dict, Length} = getDict(A, K, dict:new(), 0),
    Length - getMax(dict:to_list(Dict)).

getMax(List) ->
    [{_,Value}|_] = List,
    getMax(List, Value).

getMax([], Max) -> Max;
getMax([{_, Value}| Tail], Max) when Value > Max ->
    getMax(Tail, Value);
getMax([_| Tail], Max) ->
    getMax(Tail, Max).


addOne(X) ->
    X + 1.

getDict([], _, Dict, Counter) ->
    {Dict,Counter};
getDict([A|Tail], K, Dict, Counter)->
    case dict:is_key(A - Counter*K, Dict) of
        true -> getDict(Tail, K, dict:update(A-Counter*K, fun (X) -> X+1 end, Dict), Counter+1);
        false -> getDict(Tail, K, dict:store(A-Counter*K, 1, Dict), Counter+1) end.

read_multiple_lines_as_list_of_strings(N) ->
    read_multiple_lines_as_list_of_strings(N, []).

read_multiple_lines_as_list_of_strings(0, Acc) ->
    lists:reverse(Acc);
read_multiple_lines_as_list_of_strings(N, Acc) when N > 0 ->
    read_multiple_lines_as_list_of_strings(N - 1, [string:chomp(io:get_line("")) | Acc]).

main() ->
    {ok, Fptr} = file:open(getenv("OUTPUT_PATH"), [write]),

    Nk = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

    {N, _} = string:to_integer(lists:nth(1, Nk)),

    {K, _} = string:to_integer(lists:nth(2, Nk)),

    ATemp = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

    A = lists:map(fun(X) -> {I, _} = string:to_integer(X), I end, ATemp),

    Result = minuteToWinIt(A, K),

    io:fwrite(Fptr, "~w~n", [Result]),

    file:close(Fptr),

    ok.
