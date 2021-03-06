-module(stack).
-export([new/0,push/2,pop/1, peek/1]).

new() -> [].

push(Value, OldStack) -> [Value|OldStack].

pop([]) -> empty;
pop([Value|RestStack]) -> {Value, RestStack}.

peek([]) -> empty;
peek([Head|_]) ->
  Head.
