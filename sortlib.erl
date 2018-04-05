%% @author Michael-Keith Bernard
%% @doc https://gist.github.com/SegFaultAX/2847710#file-gistfile1-erl 


-module(sortlib).

-export([qsort/1, bsort/1, ssort/1, isort/1, msort/2,
         msort_lte/1, msort_gte/1]).
-export([test_sort/0, test_sort/1, shuffle/1, split/1, merge/3]).

-import(lists, [reverse/1]).

%% Various sorting algorithms implemented in Erlang

test_sort() ->
  List = shuffle(lists:seq(1, 20)),
  test_sort(List),
  ok.

test_sort(L) ->
  Funcs = [qsort, bsort, ssort, isort, msort_lte, msort_gte],
  io:format("Input List: ~p~n", [L]),
  lists:foreach(fun(F) ->
        io:format("~p: ~p~n", [F, ?MODULE:F(L)])
    end, Funcs),
  ok.

%% Fisher-Yates shuffling alogrithm
%% Collected from: http://en.literateprograms.org/index.php?title=Special:DownloadCode/Fisher-Yates_shuffle_(Erlang)
%% Collected on: May 31, 2012
shuffle(List) -> shuffle(List, []).

shuffle([], Acc) -> Acc;
shuffle(List, Acc) ->
  {Leading, [H | T]} = lists:split(random:uniform(length(List)) - 1, List),
  shuffle(Leading ++ T, [H | Acc]).

qsort([H|T]) ->
  qsort([E || E <- T, E < H]) ++
  [H] ++
  qsort([E || E <- T, E >= H]);
qsort([]) ->
  [].

bsort(L) ->
  bsort(L, [], true).

bsort([], L, true) ->
  reverse(L);
bsort([], L, false) ->
  bsort(reverse(L), [], true);
bsort([A,B|T], Sorted, _) when A > B ->
  bsort([A|T], [B|Sorted], false);
bsort([H|T], Sorted, Halt) ->
  bsort(T, [H|Sorted], Halt).

remove_min([H|T]) ->
  remove_min(T, [], H).

remove_min([], Rest, Min) ->
  {Rest, Min};
remove_min([H|T], Rest, Min) when H < Min ->
  remove_min(T, [Min|Rest], H);
remove_min([H|T], Rest, Min) ->
  remove_min(T, [H|Rest], Min).

ssort(L) ->
  ssort(L, []).

ssort([], Sorted) ->
  reverse(Sorted);
ssort(L, Sorted) ->
  {Rest, Min} = remove_min(L),
  ssort(Rest, [Min|Sorted]).

split(L) ->
  split(L, L, []).

split([], L1, L2) ->
  {reverse(L2), L1};
split([_], L1, L2) ->
  {reverse(L2), L1};
split([_,_|TT], [H|T], L2) ->
  split(TT, T, [H|L2]).

merge(_, [], L2) ->
  L2;
merge(_, L1, []) ->
  L1;
merge(Comp, [H1|T1], [H2|T2]) ->
  case Comp(H1, H2) of
    true ->
      [H1 | merge(Comp, T1, [H2|T2])];
    false ->
      [H2 | merge(Comp, [H1|T1], T2)]
  end.

msort(_, []) ->
  [];
msort(_, [H]) ->
  [H];
msort(Comp, L) ->
  {Left, Right} = split(L),
  merge(Comp, msort(Comp, Left), msort(Comp, Right)).

msort_gte(L) ->
  msort(fun(A, B) -> A >= B end, L).

msort_lte(L) ->
  msort(fun(A, B) -> A =< B end, L).

isort(L) ->
  isort(L, []).

isort([], Sorted) ->
  Sorted;
isort([H|T], Sorted) ->
  isort(T, insert(H, Sorted, [])).

insert(N, [H|Left], Right) when H < N ->
  insert(N, Left, [H|Right]);
insert(N, Left, Right) ->
  reverse(Right) ++ [N|Left].
