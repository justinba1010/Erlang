-module(stack_scratch).
-export([new/0,push/2,pop/1,stackToList/1]).

%I think I figured out how to make a list/stack from scratch
%I was thinking of it mathematically, and thought of it as nested tuples over and over, the one painful thing would be traversing, and reversing where you would need to create a new one every time.


new() -> {}.

push(Value, Stack) ->
  {Value, Stack}.

pop({}) -> empty;
pop(Stack) -> %Use pattern matching to get head, and rest of stack.
  Stack.
%%%   {Head, NewStack} = pop(OldStack). %%%
stackToList(Stack) -> stackToList(Stack,[]).

stackToList({},Stack) -> List;
stackToList({Data,Stack},List) ->
  stackToList(Stack, [Data]++List).
