%% @author Simon St.Laurent <simonstl@simonstl.com> [http://simonstl.com]
%% @doc mathdemo
%% @reference from <a href= "http://shop.oreilly.com/product/0636920025818.do" >
%% Introducing Erlang</a>,
%% O'Reilly Media, Inc., 2017.
%% @copyright 2017 by Simon St.Laurent
%% @version 0.1


-module(mathdemo).
-export([abs/1,sum_fact_denom/1,factorial/1]).

abs(Number) when Number < 0 -> -Number;
abs(Number) when Number >= 0 -> Number.

%% Recursion only.
sum_fact_denom(Number) when Number < 0 -> 0;
sum_fact_denom(Number) when Number =< 10 -> 1/factorial(Number) + sum_fact_denom(Number-1);
sum_fact_denom(Number) when Number > 10 -> sum_fact_denom(10).

factorial(0) -> 1;
factorial(1) -> 1;
factorial(Number) when Number < 0 -> 0;
factorial(Number) -> Number*factorial(Number-1).
