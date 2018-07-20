-module(queue).
-export([new/0,push/2,pop/1, peek/1]).

new() -> [].

push(Value, OldQueue) ->
  reverse([Value]++reverse(OldQueue)).
pop([Value|Queue]) ->
  {Value,Queue}.

peek([Value|_]) ->
  Value.


reverse(Queue) ->
  reverse(Queue,[]).
reverse([],NewQueue) -> NewQueue;
reverse([Head|Tail],NewQueue) ->
  reverse(Tail,[Head] ++ NewQueue).
