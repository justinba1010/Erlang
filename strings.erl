-module(strings).
-export([concat/1,concatReverse/1]).

concat([]) ->
  "";
concat([Head | Tail]) ->
  Head ++ concat(Tail).

concatReverse(List) ->
  concat(list:reverse(List)).
