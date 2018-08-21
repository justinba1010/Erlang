-module(fall_velocity).
-export([fall/1, fall/2]).

fall(X) ->
  fall(earth, X).

fall(earth, X) ->
  fall(4.9, X);
fall(mars, X) ->
  fall(3.9, X);
fall(sun, X) ->
  fall(500, X);
fall(Y, X) when Y > 0 ->
  Y*X*X;
fall(_,_) ->
  error.
