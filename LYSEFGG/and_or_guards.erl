-module(and_or_guards).
-export([term/0]).


old_enough(X) when X >= 16, X =< 104 ->
  true;
old_enough(X) ->
  false.

wrong_age(X) when X < 16; x > 104 ->
  true;
wrong_age(X) ->
  false.
