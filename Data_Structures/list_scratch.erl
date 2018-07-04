-module(list_scratch).
-export([new/0,push/2,length/1,get/2,remove/2,reverse/1]).


%Singly linked list using head attach
new() -> stack_scratch:new().

push(Value, List) -> stack_scratch:push(Value, List).

length(List) ->
  length(List,0).
length({},Counter) -> Counter;
length({_,List},Counter) ->
  length(List, Counter).

get({},_) -> index_out_of_bounds;
get({Data, _}, 0) -> Data;
get({_,List}, Index) ->
  get(List, Index-1).

remove(OldList, Value) ->
  reverse(remove({}, OldList, Value)).
remove(NewList,{},_) ->
  NewList;
remove(NewList, {Value,TailList}, Value) ->
  remove(NewList,TailList, Value);
remove(NewList,{Head,TailList},Value) ->
  remove({Head,NewList},TailList,Value).

reverse(List) ->
  reverse({},List).
reverse(NewList,{}) -> NewList;
reverse(NewList,{Head,Tail}) ->
  reverse({Head,NewList},Tail).
