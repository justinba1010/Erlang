-module(solution).
-export([main/0]).
-import(os, [getenv/1]).

% Complete the minuteToWinIt function below.
minuteToWinIt(A, K) ->
    % Return the minimum amount of time in minutes.

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
