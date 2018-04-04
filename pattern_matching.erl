%% @author Simon St.Laurent <simonstl@simonstl.com> [http://simonstl.com]
%% @doc pattern_matching
%% @reference from <a href= "http://shop.oreilly.com/product/0636920025818.do" >
%% Introducing Erlang</a>,
%% O'Reilly Media, Inc., 2017.
%% @copyright 2017 by Simon St.Laurent
%% @version 0.1


-module(pattern_matching).
-export([fall_velocity/1,fall_velocitycase/1]).

fall_velocity({earth, Distance}) when Distance >= 0 -> math:sqrt(2 * 9.8 * Distance);
fall_velocity({moon, Distance}) when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity({mars, Distance}) when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance);
fall_velocity({_ ,Distance}) when Distance >= 0 -> fall_velocity({earth, Distance});
fall_velocity({_Distance}) -> 0.

fall_velocitycase({Planemo, Distance}) when Distance >= 0 ->
  Gravity = case Planemo of
    moon -> 1.6;
    mars -> 3.71;
    _ -> 9.8
  end,
  math:sqrt(2 * Gravity * Distance);
fall_velocitycase({Planemo, Distance}) when Distance < 0 ->
  fall_velocitycase({Planemo, -Distance}).
