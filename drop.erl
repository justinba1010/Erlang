%% @author Simon St.Laurent <simonstl@simonstl.com> [http://simonstl.com]
%% @doc Functions calculating velocities achieved by objects
%% dropped in a vacuum.
%% @reference from <a href= "http://shop.oreilly.com/product/0636920025818.do" >
%% Introducing Erlang</a>,
%% O'Reilly Media, Inc., 2017.
%% @copyright 2017 by Simon St.Laurent
%% @version 0.1

-module(drop).
-export([fall_velocity/1,mps_to_mph/1,mps_to_kph/1,height_to_mph/1]).

fall_velocity(Distance) ->
    X = 2 * 9.8 * Distance,
    math:sqrt(X).

mps_to_mph(Mps) -> 2.23693629 * Mps.
mps_to_kph(Mps) -> 3.6 * Mps.

height_to_mph(Distance) -> mps_to_mph(fall_velocity(Distance)).
