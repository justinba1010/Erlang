%Erlang is a single linked list I believe, reverse by hand
% @author Justin Baum
% @doc Lists are weird, works as a single linked list. Needs quite a bit of manipulation to get it to work how you want them to.

-module(list).
-export([reverse/1,listlen/1, get_item/2, shuffle/1, get_index/2]).

% @doc n time
reverse(List) -> reverse(List,[]).

reverse([], NewList) -> NewList;
reverse([Head | Tail],NewList) -> reverse(Tail, [Head | NewList]).

% @doc listlen
listlen([]) -> 0;
listlen([_ | Tail]) -> listlen(Tail) + 1.


%@ doc getItem
get_item([],_) -> false;
get_item([Head | _], 0) -> Head;
get_item(_,X) when X < 0 -> false;
get_item([_ | Tail], X) -> get_item(Tail,X-1).

% @doc Fisher–Yates shuffle algorithm
shuffle(List) -> shuffle(List,[]).

% @doc shuffle
shuffle([],NewList) -> NewList;
shuffle(List,NewList) ->
  X = get_item(List, rand:uniform(listlen(List))-1),
  shuffle(List -- [X], NewList ++ [X]).


% this took way too long to figure out...
get_index(List, X) ->
  case get_item(List,X) of
    false -> false;
    _ -> get_indexP(List,X,0)
  end.

get_indexP([], _, _) -> false;
get_indexP([Head | Tail], X, C) ->
  case Head of
    X -> C;
    _ -> get_indexP(Tail, X, C + 1)
  end.
