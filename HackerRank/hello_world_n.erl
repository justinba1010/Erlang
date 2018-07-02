-module(hello_world_n).
-export([main/0]).

main() ->

    { ok, [N]} = io:fread("", "~d"),
    recur(N-1),
    true.
recur(0) -> io:format("Hello World ~n");
recur(N) ->
    recur(0),
    recur(N-1).
