-module(graph).
-export([]).

% {[{Key, Value, [Edges(Key)]},...], Keys}

new() -> {[],0}.


addVertex({Graph, Keys},Vertex) ->
  {[{Keys, Vertex,[]}] ++ Graph, Keys+1}.

addDirEdge({[]}, Vertex1, Vertex2) when inList(getEdges(Vertex1), Vertex2) ->


getEdges({[]},_) -> [];
getEdges({[{Vertex1, _, Edges}|Tail],_},Vertex1) ->
  Edges;
getEdges({[_|Tail]},Vertex1) -> getEdges(Tail,Vertex1).


inList([],_) -> false;
inList([Data,_],Data) -> true;
inList([_,Tail],Data) -> inList(Tail,Data).
