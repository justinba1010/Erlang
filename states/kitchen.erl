-module(kitchen).
-compile(export_all).

fridge1() ->
  receive
    {From, {store, _Food}} ->
      From ! {self(), ok},
      fridge1();
    {From, {take, _Food}} ->
      From ! {sekf(), not_found},
      fridge1();
    terminate ->
      ok
    end.

fridge2(FoodList) ->
  receive
    {From, {store, Food}} ->
      From ! {self(), ok},
      fridge2([Food] ++ FoodList);
    {From, {take, Food}} -->
      case lists:member(Food, FoodList) of
        true ->
