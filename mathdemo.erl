%% @author Justin Baum
%% @doc I moved from falling velocities and have been playing with math identities, so no need for the copyrights anymore


-module(mathdemo).
-export([abs/1,sum_fact_denom/1,factorial/1,sin/2,sin/1, cos/1, pi/0, compose/2,normalize/1, pyth/1,e/1]).

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
sin(X) -> sin(normalize(X),35).
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

%% @doc Sine function using Taylor Series.
%% @type sin(X) = float().
cos(X) -> cos(normalize(X),35).
%% @doc Sine function using Taylor Series.
%% @type sin(X,N) = float().
cos(_,0) -> 1;
cos(X,N) when N > 35 -> cos(X,35);
cos(X,N) when N > 0 ->
  case N rem 2 of
    0 -> math:pow(X,2*N)/factorial(2*N) + cos(X,N-1);
    1 -> -1*math:pow(X,2*N)/factorial(2*N) + cos(X,N-1)
  end;
cos(_,_) -> 0.

%% @doc Pi constant.
pi() -> 3.141592653589793.

normalize(X) when X > 6.29 ->
  L = trunc(X / 2 / pi()),
  X - L*2*pi();
normalize(X) when X < -6.29->
  L = ceil(X / 2 / pi()),
  X - L*2*pi();
normalize(X) -> X.


%% @doc Compose functions
compose(X,D) when X == [] -> D;
compose([A | B],D) ->
  E = fun(X) ->
    D(A(X))
  end,
  compose(B,E).

pyth(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A+B+C =< N,
        A*A+B*B == C*C
    ].
e(X) ->
  e(X,0,10).
e(_,C,0) ->
  C+1;
e(X,C,N) ->
  D = C + math:pow(X,-N)/factorial(N),
  e(X,D,N-1).
