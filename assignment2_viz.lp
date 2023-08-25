% clingraph visualisation script for smartgames iq puzzler pro solver - assignment 2 ModelBased AI 

%define graph and default node style
graph(solution).
attr(graph, solution, layout, dot).
attr(graph, solution, rankdir, "LR").
attr(graph_nodes, solution, shape, square).
attr(graph_nodes, solution, style, filled).

%add nodes
node(vak(X,Y), solution) :- at(N, vak(X,Y)).

%add node labels
attr(node, vak(X,Y), label, N) :- at(N, vak(X,Y)).

%set colors of nodes to that of the pieces occupying them just like in smartgames iq puzzler pro
attr(node, vak(X,Y), fillcolor, blue2) :- at(1, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, cadetblue1) :- at(2, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, aquamarine4) :- at(3, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, brown) :- at(4, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, red) :- at(5, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, yellow) :- at(6, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, webpurple) :- at(7, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, dodgerblue) :- at(8, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, hotpink) :- at(9, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, olivedrab2) :- at(10, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, aquamarine) :- at(11, vak(X,Y)).
attr(node, vak(X,Y), fillcolor, darkorange) :- at(12, vak(X,Y)).

%define edges
edge((vak(X,Y), vak(X2,Y2)), solution) :- at(N, vak(X,Y)), at(N2, vak(X2,Y2)), X=X2+1, Y=Y2.
edge((vak(X,Y), vak(X2,Y2)), solution) :- at(N, vak(X,Y)), at(N2, vak(X2,Y2)), X=X2, Y=Y2+1.

% force placement of nodes into a raster by not letting edges from left to right influence node ranking :
attr(edge,(vak(X,Y), vak(X2,Y2)), constraint, false) :- at(N, vak(X,Y)), at(N2, vak(X2,Y2)), X2=X, Y=Y2+1.
% note however this seems not to work entirely all the time
