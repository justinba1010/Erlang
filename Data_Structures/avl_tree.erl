-module(avl_tree).
-export([new/0,push/2,inTree/2, remove/2]).

new() -> {null,0,{},{}}.


%% {value, depth, right, left}
push(Tree,Data) ->
  push(Tree,Data,0).
push({null,_,_,_}, Data,Acc) -> {Data,Acc,{},{}};
push({},Data,Acc) ->
  {Data,Acc,{},{}};
push({Data,Depth,Left,Right}, Value, Acc) when Value < Data ->
  {Data,Depth,push(Left,Value,Acc+1),Right};
push({Data,Depth,Left,Right}, Value, Acc) ->
  {Data,Depth,Left,push(Right,Value,Acc+1)}.

inTree({},_) -> false;
inTree({Data,_,_,_}, Data) ->
  true;
inTree({Data,_,Left,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({_,_,_,Right}, Value) ->
  inTree(Right,Value).




minRight({Data,_,{},{}}) ->
  Data;
minRight({_,_,Left,_}) ->
  minRight(Left).

%End of Tree
remove({},_) -> {};
%Remove Leaf
remove({Data,_,{},{}}, Data) ->
  {};
%One child Right
remove({Data,_,{},Right}, Data) ->
  Right;
%One child Left
remove({Data,_,Left,{}}, Data) ->
  Left;
%Two children
remove({Data,_,Left,Right}, Data) ->
  Min = minRight(Left),
  {Min, remove(Left,Min), Right};
remove({Data,_,Left,Right}, Value) when Value < Data ->
  {Data,remove(Left, Value),Right};
remove({Data,Left,Right}, Value) ->
  {Data,Left,remove(Right, Value)}.
