%% @author Simon St.Laurent <simonstl@simonstl.com> [http://simonstl.com]
%% @doc mathdemo
%% @reference from <a href= "http://shop.oreilly.com/product/0636920025818.do" >
%% Introducing Erlang</a>,
%% O'Reilly Media, Inc., 2017.
%% @copyright 2017 by Simon St.Laurent
%% @version 0.1


-module(mathdemo).
-export([abs/1]).

abs(Number) when Number < 0 -> -Number;
abs(Number) when Number >= 0 -> Number.
