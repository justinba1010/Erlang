-module(bst_scratch).
-export([new/0,push/2,inTree/2, remove/2]).

new() -> {null,{},{}}.

push({null,_,_}, Data) -> {Data,{},{}};
push({},Data) ->
  {Data,{},{}};
push({Data,Left,Right}, Value) when Value < Data ->
  {Data,push(Left,Value),Right};
push({Data,Left,Right}, Value) ->
  {Data,Left,push(Right,Value)}.

inTree({},_) -> false;
inTree({Data,_,_}, Data) ->
  true;
inTree({Data,Left,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({_,_,Right}, Value) ->
  inTree(Right,Value).


minRight({Data,{},{}}) ->
  Data;
minRight({_,Left,_}) ->
  minRight(Left).

%End of Tree
remove({},_) -> {};
%Remove Leaf
remove({Data,{},{}}, Data) ->
  {};
%One child Right
remove({Data,Right,{}}, Data) ->
  Right;
%One child Left
remove({Data,Left,{}}, Data) ->
  Left;
%Two children
remove({Data,Left,Right}, Data) ->
  Min = minRight(Left),
  {Min, remove(Left,Min), Right};
remove({Data,Left,Right}, Value) when Value < Data ->
  {Data,remove(Left, Value),Right};
remove({Data,Left,Right}, Value) ->
  {Data,Left,remove(Right, Value)}.
