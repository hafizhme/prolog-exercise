% ELEMENTARY GRAPH MODELLING IN PROLOG

%%%%%%%%%%%%%%% FACT %%%%%%%%%%%%%%%
% edge(x,y) : node x be neighbor to node y : x --> y
edge(a,b).
edge(a,d).
edge(b,e).
edge(b,c).
edge(c,e).
edge(c,f).
edge(e,d).
edge(e,f).
edge(f,f).

%%%%%%%%%%%%%%% RULE %%%%%%%%%%%%%%%
% neighbor_to(x,y) : true if there exist an edge
%   that connecting node x to node y
neighbor_to(X,Y):- edge(X,Y).

% neighbor_to(x,y) : true if there exist an edge
%   that connecting node y to node x
neighbor_from(X,Y):- edge(Y,X).

% strong_connect(x,y) : true if node x be neighbor to node y and likewise
strong_connect(X,Y):- neighbor_to(X,Y),neighbor_from(X,Y).

% weak_connect(x,y) : true if node x be neighbor to node y or likewise
%   but not both
weak_connect(X,Y):- (neighbor_to(X,Y),not(neighbor_from(X,Y)));
                    (neighbor_to(Y,X),not(neighbor_from(Y,X))).

% path1(x,y) : node y can be reached from node x by a path
%   that its length is 1
path1(X,Y):- edge(X,Y).

% path2(x,y) : node y can be reached from node x by a path
%   that its length is 2
path2(X,Y):- edge(X,Z),edge(Z,Y).

% path3(x,y) : node y can be reached from node x by a path
%   that its length is 3
path3(X,Y):- edge(X,Z),edge(Z,W),edge(W,Y).

% near(x,y) :node y can be reached from node x by a path
%   that its length is not more than 3
near(X,Y):- X=Y;path1(X,Y);path2(X,Y);path3(X,Y).

%path(x,y) : node y can be reached from node x by any true path
path(X,Y):- X=Y;edge(X,Y);(edge(X,Z),path(Z,Y)).

% path_min1(x,y) : node y can be reached from node x by any true path
%   that its length is at least 1
path_min1(X,Y):-edge(X,Y);(edge(X,Z),path(Z,Y)).
