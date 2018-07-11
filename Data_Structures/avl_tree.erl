  %% @author Justin Baum <jabaum@cec.sc.edu> [http://github.com/justinba1010/]
%% @doc AVL Tree Implementation
%% @copyright 2018 by Justin Baum
%% @version 0.1
%% @todo Testing, and make sure works as designed.



-module(avl_tree).
-export([new/0,push/3,inTree/2, remove/2, rotate/1, depth/1]).
%After reading LYSEFGG
%Decided needs to be cleaner
% @doc new() -> new Tree
% O(1) time
new() -> {null,null,{},{},0}.
% @doc push(Tree, Key, Value) -> pushes Key value into a new tree
% O(log n) for normal push, depth function is n time per.
% O(n log n)
push({null,null,{},{},0}, Key, Value) -> {Key, Value,{},{},0};
push({},Key, Value) ->
  {Key, Value, {},{},0};
push({Key, Value ,Left,Right,_}, NewKey, NewValue) when NewKey < Key ->
  NewLeft = push(Left,NewKey, NewValue),
  rotate({Key,Value, NewLeft ,Right,depth(Right)-depth(NewLeft)});
push({Key, Value ,Left,Right,_}, NewKey, NewValue) ->
  NewRight = push(Right,NewKey, NewValue),
  rotate({Key,Value, Left, NewRight, depth(NewRight)-depth(Left)}).

% @doc inTree(Tree, Key) -> true or false depending on if in tree
% O(log n) time:
inTree({},_) -> false;
inTree({Key,_,_,_,_}, Key) ->
  true;
inTree({Data,_,Left,_,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({_,_,_,Right,_}, Value) ->
  inTree(Right,Value).

% @doc minRight(Tree) -> returns min value in tree as {Key, Value}
% O(log n) time
minRight({Key,Value,{},{},_}) ->
  {Key, Value};
minRight({_,_,Left,_,_}) ->
  minRight(Left).


% @doc remove(Tree, Key) -> returns tree without value
% O(n log n) time
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
remove({Key,_,Left,Right, _}, Key) ->
  {NewKey, NewValue} = minRight(Right),
  NewRight = remove(Right,NewKey),
  rotate({NewKey, NewValue, Left, NewRight, depth(NewRight)-depth(Left)});
remove({Key,Value,Left,Right,_}, RKey) when RKey < Key ->
  rotate({Key,Value,remove(Left, RKey),Right, depth(Right)-depth(remove(Left, RKey))});
remove({Key, Value,Left,Right, _}, RKey) ->
  rotate({Key,Value,Left,remove(Right, RKey), depth(remove(Right, RKey))-depth(Left)}).

% @doc pattern matching rotations of tree
% O(1) time
%Left Rotation

rotate({AKey, AValue, R1, {BKey, BValue, R2, {CKey, CValue, R3, R4,_}, 1}, 2}) ->
  {BKey, BValue, {AKey,AValue,R1,R2,0},{CKey, CValue,R3,R4,0},0};
%Right Rotation
rotate({AKey, AValue, {BKey, BValue, {CKey, CValue, R4, R3,0}, R2, -1}, R1, -2}) ->
  {BKey, BValue, {CKey,CValue,R4,R3,0},{AKey, AValue,R2,R1,0},0};
%Left-Right Rotation
rotate({CKey, CValue,{AKey,AValue,R2,{BKey, BValue,R3,R4,0},1},R1,-2}) ->
  {BKey, BValue, {AKey,AValue,R2,R3,0},{CKey, CValue,R4,R1,0},0};
%Right-Left Rotation
rotate({AKey, AValue, R1, {CKey, CValue, {BKey, BValue, R2, R3,_},R4, -1}, 2}) ->
  {BKey, BValue, {AKey,AValue,R1,R2,0},{CKey, CValue,R3,R4,0},0};
rotate(Tree) ->
  Tree.

% @doc Depth function, tail recursive
% O(n) time
depth(Tree) -> depth(Tree,0).
depth({},Acc) -> Acc;
depth({_,_,Left,Right,_},Acc) ->
  max(depth(Left,Acc+1), depth(Right, Acc+1)).
