-module(stack_scratch).
-export([new/0,push/2,pop/1]).

%I think I figured out how to make a list/stack from scratch
%I was thinking of it mathematically, and thought of it as nested tuples over and over, the one painful thing would be traversing, and reversing where you would need to create a new one every time.


new() -> {}.

push(Value, List) ->
  {Value, List}.

pop({}) -> empty;
pop(List) -> %Use pattern matching to get head, and rest of stack.
  List.
%%%   {Head, NewStack} = pop(OldStack). %%%
