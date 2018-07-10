-module(bst2_scratch).
-export([new/0,push/3,inTree/2, remove/2]).
%After reading LYSEFGG
%Decided needs to be cleaner
new() -> {null,null,{},{}}.

push({null,null,{},{}}, Key, Value) -> {Key, Value,{},{}};
push({},Key, Value) ->
  {Key, Value, {},{}};
push({Key, Value ,Left,Right}, NewKey, NewValue) when NewKey < Key ->
  {Key,Value, push(Left,NewKey, NewValue),Right};
push({Key, Value ,Left,Right}, NewKey, NewValue) ->
  {Key,Value, Left,push(Right,NewKey, NewValue)}.

inTree({},_) -> false;
inTree({Key,_,_}, Key) ->
  true;
inTree({Data,_,Left,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({_,_,_,Right}, Value) ->
  inTree(Right,Value).
       esfd
minRight({Key,Value,{},{}}) ->
  {Key, Value};
minRight({_,_,Left,_}) ->
  minRight(Left).

%End of Tree
remove({},_) -> {};
%Remove Leaf
remove({_, _,{},{}}, _) ->
  {};
%One child Right
remove({Key, _,{},Right}, Key) ->
  Right;
%One child Left
remove({Key,Left,{}}, Key) ->
  Left;
%Two children
remove({Key,Left,Right}, Key) ->
  {NewKey, NewValue} = minRight(Left),
  {NewKey, NewValue, remove(Left,NewKey), Right};
remove({Key,Value,Left,Right}, RKey) when RKey < Key ->
  {Data,Value,remove(Left, RKey),Right};
remove({Key, Value ,Left,Right}, RKey) ->
  {Data,Value,Left,remove(Right, RKey)}.
