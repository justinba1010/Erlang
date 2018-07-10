-module(avl_tree).
-export([new/0,push/3,inTree/2, remove/2, len/2]).
%After reading LYSEFGG
%Decided needs to be cleaner
new() -> {null,null,{},{}}.

push({null,null,{},{},null}, Key, Value) -> {Key, Value,{},{}};
push({},Key, Value) ->
  {Key, Value, {},{}};
push({Key, Value ,Left,Right,_}, NewKey, NewValue) when NewKey < Key ->
  {Key,Value, push(Left,NewKey, NewValue),Right,_};
push({Key, Value ,Left,Right,_}, NewKey, NewValue) ->
  {Key,Value, Left,push(Right,NewKey, NewValue),_}.

inTree({},_) -> false;
inTree({Key,_,_,_,_}, Key) ->
  true;
inTree({Data,_,Left,_,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({_,_,_,Right,_}, Value) ->
  inTree(Right,Value).
minRight({Key,Value,{},{},_}) ->
  {Key, Value};
minRight({_,_,Left,_,_}) ->
  minRight(Left).


%End of Tree
remove({},_) -> {};
%Remove Leaf
remove({_, _,{},{}}, _) ->
  {};
%One child Right
remove({Key, _,{},Right,_}, Key) ->
  Right;
%One child Left
remove({Key,_,Left,{},_}, Key) ->
  Left;
%Two children
remove({Key,_,Left,Right, BalanceFactor}, Key) ->
  {NewKey, NewValue} = minRight(Left),
  {NewKey, NewValue, remove(Left,NewKey), Right, BalanceFactor},;
remove({Key,Value,Left,Right,BalanceFactor}, RKey) when RKey < Key ->
  {Key,Value,remove(Left, RKey),Right, BalanceFactor};
remove({Key, Value,Left,Right, BalanceFactor}, RKey) ->
  {Key,Value,Left,remove(Right, RKey), BalanceFactor}.


max(X,Y) when X > Y -> X;
max(X,Y) -> Y.
min(X,Y) when X > Y -> Y;
min(X,Y) -> X.
