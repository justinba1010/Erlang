-module(graph).
-export([blank/0, addVertex/2]).


-record(  graph,  {vertices = [] :: [vertex]}).
-record(  vertex, {vertex = undefined, edges = []}).
-record
blank() ->
  #graph{}.

addVertex(Graph, Vertex) ->
  Vertices = Graph#graph.vertices,
  Edges = Graph#graph.edges,
  #graph{vertices = [Vertex] ++ Vertices, edges = Edges}.
