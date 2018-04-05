%% @author Simon St. Laurent
%% @doc Book Exercise Page 44.

-module(count).
-export([countdown/1]).

countdown(From) when From > 0 ->
  io:format("~w!~n", [From]),
  countdown(From-1);
countdown(0) ->
  io:format("blastoff!~n");
countdown(From) ->
  if(From > -1) -> io:format("Blastoff~n")
  end,
  0.
