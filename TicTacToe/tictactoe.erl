-module(tictactoe).
-export([blank/0, legalMove/3, getSpot/3, makeMove/4]).

blank() ->
  [[1,2,3],[4,5,6],[7,8,9]].

legalMove(Board, Row, Column) ->
  if
    (Row >= 2) or (Row < 0) or (Column >= 2) or (Column < 0) ->
      false;
    true ->
      getSpot(Board, Row, Column) == 0
  end.

getSpot([[Head|_] | _], 0, 0) ->
  Head;
getSpot([[_ | Tail]|_], 0, Column) ->
  getSpot([Tail], 0, Column-1);
getSpot([_ | Tail], Row, Column) ->
  getSpot(Tail, Row - 1, Column).


makeMove(Board, Player, Row, Column) ->
  makeMove(Board, Player, Row, Column, [[],[],[]]).

makeMove([[_ | Tail] | Tail2], Player, 0, 0, [Head2 | Tail4]) ->
  lists:reverse([lists:reverse([lists:reverse(Tail) ++ [Player] ++ Head2]) ++ lists:reverse(Tail2) ++ Tail4]);
%Continue
makeMove(_,_,_,_,_) -> ok.
