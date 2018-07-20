-module(solution).
-export([main/0]).
-import(os, [getenv/1]).

% Complete the lagDuration function below.
lagDuration(H1, M1, H2, M2, K) ->
    M1 - M2 + 60*(H1-H2+K).

main() ->
    {ok, Fptr} = file:open(getenv("OUTPUT_PATH"), [write]),

    {Q, _} = string:to_integer(string:chomp(io:get_line(""))),

    lists:foreach(fun(QItr) ->
        H1M1H2M2 = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

        {H1, _} = string:to_integer(lists:nth(1, H1M1H2M2)),

        {M1, _} = string:to_integer(lists:nth(2, H1M1H2M2)),

        {H2, _} = string:to_integer(lists:nth(3, H1M1H2M2)),

        {M2, _} = string:to_integer(lists:nth(4, H1M1H2M2)),

        {K, _} = string:to_integer(string:chomp(io:get_line(""))),

        Result = lagDuration(H1, M1, H2, M2, K),

        io:fwrite(Fptr, "~w~n", [Result]) end,
    lists:seq(1, Q)),

    file:close(Fptr),

    ok.
