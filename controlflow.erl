-module(controlflow).
-export([main/0]).


get_next() ->
  {_, [Answer]} = io:fread("How many things to add ","~d"),
  listMaker:addList(Answer).

main() ->
  {_,[Answer]} = io:fread("1 to continue, 0 to stop ","~d"),
  case Answer of
    1 ->
      List = get_next(),
      main(List);
    0 ->
      []
  end.
main(List) ->
  List ++ main().
