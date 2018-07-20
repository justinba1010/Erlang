-module(solution).
-export([main/0]).
-import(os, [getenv/1]).

%
% Complete the twosCompliment function below.
%
twosCompliment(A, B) ->
    twosCompliment(A,B,0).
twosCompliment(A,A,OneSum) -> OneSum + ones(A,0);
twosCompliment(A, B, OneSum) ->
    twosCompliment(A+1, B, OneSum + ones(A,0)).
ones(0, Acc) ->
    Acc;
ones(X, 0) when X < 0 ->
    %In this case we want to count the 0s in a 32 bit number, because we are flipping each bit. We are not adding 1 as in twos compliment, because that would be redundant as we ca
    32-ones((bnot X) band 2#11111111111111111111111111111111,0);
ones(X,Acc) ->
    ones(X bsr 1, Acc + (X band 1)).

main() ->
    {ok, Fptr} = file:open(getenv("OUTPUT_PATH"), [write]),

    {T, _} = string:to_integer(string:chomp(io:get_line(""))),

    lists:foreach(fun(TItr) ->
        Ab = re:split(string:chomp(io:get_line("")), "\\s+", [{return, list}, trim]),

        {A, _} = string:to_integer(lists:nth(1, Ab)),

        {B, _} = string:to_integer(lists:nth(2, Ab)),

        Result = twosCompliment(A, B),

        io:fwrite(Fptr, "~w~n", [Result]) end,
    lists:seq(1, T)),

    file:close(Fptr),

    ok.
