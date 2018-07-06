-module(bst_scratch).
-export([new/0,push/2]).

new() -> {null,{},{}}.

push({null,_,_}, Data) -> {Data,{},{}};\
push({Data,Left,Right}, Value) when Value < Data ->
  {Data,push(Left,Value),Right};
push({Data,Left,Right}, Value) ->
  {Data,Left,push(Right,Value)}.

inTree({},_) -> false;
inTree({Data,_,_}, Data) ->
  true;
inTree({Data,Left,_}, Value) when Value < Data ->
  inTree(Left,Value);
inTree({Data,_,Right}, Value) ->
  inTree(Right,Value).



remove({},Value) -> {};
remove({Data,_,_}, Data) ->
  %Need algorithm to take bottom of one tree, bring up, etc
  %For now chop tree from there
  %push rest into new tree % function remove readd
  {}
remove({Data,Left,Right}, Value) when Value < Data ->
  {Data,remove(Left, Value),Right};
remove({Data,Left,Right}, Value) ->
  {Data,Left,remove(Right, Value)}.

remove_readd() -> {}.
