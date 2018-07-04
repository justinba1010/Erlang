% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(area_curve).
-export([main/0]).

main() ->
  Line1 = io:get_line(""),
  Line2 = io:get_line(""),
  Line3 = io:get_line(""),
  Coefficients = getListInt(isolate(Line1)),
  Powers = getListInt(isolate(Line2)),
  Bounds = getListInt(isolate(Line3)),
  io:format("~w~n",[area(Powers, Coefficients, Bounds)]).




isolate(String) ->
  [Head|_] = string:replace(String,"\n", all),
  string:split(Head," ",all).

getListInt(StringList) -> getListInt(StringList,[]).
getListInt([],List) -> lists:reverse(List);
getListInt([Head|Tail],List) ->
  [Y|_] = string:split(Head,"\n"),
  {YY,_} = string:to_integer(Y),
  getListInt(Tail,[YY]++List).

area(Powers, Coefficients, Bounds) -> area(Powers, Coefficients, Bounds, 0).

area([],_,_,Sum) -> Sum;
area(_,[],_,Sum) -> Sum;
area([FirstPower|Powers], [FirstCoefficient|Coefficients], Bounds, Sum) ->
  area(Powers,Coefficients,Bounds,Sum+(S2-S1)).

eval(Power, Coefficient, Value) ->
   math:pow(Value,FirstPower+1)/(FirstPower+1)*FirstCoefficient
