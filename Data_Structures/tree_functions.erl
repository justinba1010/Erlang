-module(and_or_guards).
-export([max/2,min/2]).

max(X,Y) when not erlang:is_integer(X); not erlang:is_integer(Y) ->
  {error, not_integers};
max(X,Y) when X > Y ->
  {ok, X};
max(X,Y) -> {ok, Y}.

min(X,Y) when not erlang:is_integer(X); not erlang:is_integer(Y) ->
  {error, not_integers};
min(X,Y) when X < Y ->
  {ok, X};
min(X,Y) -> {ok, Y}.
