-module(solution).
-export([main/0]).
-import(os, [getenv/1]).

% Complete the whichSection function below.
whichSection(N, K, A) ->
    whichSection(N, K, A, 0, 0).
whichSection(_, _, [], _, Section) -> Section;
whichSection(_, K, _, Acc, Section) when K =< Acc -> Section;
whichSection(N, K, [An | Tail], Acc, Section) ->
    whichSection(N, K, Tail, Acc + An, Section + 1).

read_multiple_lines_as_list_of_strings(N) ->
    read_multiple_lines_as_list_of_strings(N, []).

read_multiple_lines_as_list_of_strings(0, Acc) ->
    lists:reverse(Acc);
read_multiple_lines_as_list_of_strings(N, Acc) when N > 0 ->
    read_multiple_lines_as_list_of_strings(N - 1, [string:chomp(io:get_line("")) | Acc]).

main() ->
    {ok, Fptr} = file:open(getenv("OUTPUT_PATH"), [write]),

    {T, _} = string:to_integer(string:chomp(io:get_line(""))),

    lists:foreach(fun(TItr) ->
        Nkm = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

        {N, _} = string:to_integer(lists:nth(1, Nkm)),

        {K, _} = string:to_integer(lists:nth(2, Nkm)),

        {M, _} = string:to_integer(lists:nth(3, Nkm)),

        ATemp = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

        A = lists:map(fun(X) -> {I, _} = string:to_integer(X), I end, ATemp),

        Result = whichSection(N, K, A),

        io:fwrite(Fptr, "~w~n", [Result]) end,
    lists:seq(1, T)),

    file:close(Fptr),

    ok.
