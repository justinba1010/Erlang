%% @author Simon St.Laurent <simonstl@simonstl.com> [http://simonstl.com]
%% @doc mathdemo
%% @reference from <a href= "http://shop.oreilly.com/product/0636920025818.do" >
%% Introducing Erlang</a>,
%% O'Reilly Media, Inc., 2017.
%% @copyright 2017 by Simon St.Laurent
%% @version 0.1


-module(mathdemo).
-export([abs/1,sum_fact_denom/1,factorial/1,sin/2,sin/1, pi/0, compose/2]).

%% @doc Absolute value; abs(3) = 3. abs(-3) = 3
abs(Number) when Number < 0 -> -Number;
abs(Number) when Number >= 0 -> Number.

%% @doc Factorial denominator summation : sum_fact_denom ~ e
sum_fact_denom(Number) when Number < 0 -> 0;
sum_fact_denom(Number) when Number =< 10 -> 1/factorial(Number) + sum_fact_denom(Number-1);
sum_fact_denom(Number) when Number > 10 -> sum_fact_denom(10).

%% @doc Factorial using recursion
factorial(0) -> 1;
factorial(1) -> 1;
factorial(Number) when Number < 0 -> 0;
factorial(Number) -> Number*factorial(Number-1).


%% @doc Sine function using Taylor Series.
%% @type sin(X) = float().
sin(X) -> sin(X,100).
%% @doc Sine function using Taylor Series.
%% @type sin(X,N) = float().
sin(X,0) -> X;
sin(X,N) when N > 35 -> sin(X,35);
sin(X,N) when N > 0 ->
  case N rem 2 of
    0 -> math:pow(X,2*N+1)/factorial(2*N+1) + sin(X,N-1);
    1 -> -math:pow(X,2*N+1)/factorial(2*N+1) + sin(X,N-1);
    _ -> 0
  end;
sin(_,_) -> 0.

%% @doc Pi constant.


pi() -> 3.141592653589793.



%% @doc Compose functions
compose(X,D) when X == [] -> D;
compose([A | B],D) ->
  E = fun(X) ->
    D(A(X))
  end,
  compose(B,E).
