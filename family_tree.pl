% FAMILY TREE %

%%%%%%%%%%%%%%% FACT %%%%%%%%%%%%%%%
% male(x) : x is a male
male(bob).
male(charlie).
male(david).
male(hans).
male(jim).

% female(x) : x is a female
female(emma).
female(fiona).
female(grace).
female(irene).
female(kelly).
female(lily).

% parent(x,y) : x is a parent of y
parent(alice,charlie).
parent(bob,charlie).
parent(bob,emma).
parent(charlie,fiona).
parent(charlie,grace).
parent(emma,irene).
parent(fiona,david).
parent(fiona,lily).
parent(grace,jim).
parent(grace,kelly).
parent(hans,jim).
parent(hans,kelly).

% adult(x) : x is an adult
adult(alice).
adult(bob).
adult(charlie).
adult(emma).
adult(fiona).
adult(grace).
adult(hans).

% teen(x) : x is a teenager
teen(irene).
teen(david).
teen(lily).

% kid(x) : x is a little child
kid(jim).
kid(kelly).

%%%%%%%%%%%%%%% RULE %%%%%%%%%%%%%%%
% gentleman(x) : x is an adult male
gentleman(X):-male(X),adult(X).

% lady(x) : x is an adult female
lady(X):-female(X),adult(X).

% teen_boy(x) : x is a male teenager
teen_boy(X):-male(X),teen(X).

% teen_girl(x) : x is a female teenager
teen_girl(X):-female(X),teen(X).

% little_boy(x) : x is a male little child
little_boy(X):-male(X),kid(X).

% little_girl(x) : x is a female little child
little_girl(X):-female(X),kid(X).

% child(x,y) : x is a child of y
child(X,Y):-parent(Y,X).

% father(x,y) : x is a father of y
father(X,Y):-parent(X,Y),male(X).

% mother(x,y) : x is a mother of y
mother(X,Y):-parent(X,Y),female(X).

% son(x,y) : x is a son of y
son(X,Y):- child(X,Y),male(X).

% daughter(x,y) : x is a daughter of y
daughter(X,Y):-child(X,Y),female(X).

% grandparent(x,y) : x is a grandparent of y
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

% has_a_child(x) : x has a child
has_a_child(X):-parent(X,Y),(male(Y);female(Y)).

% is_a_daddy(x) : x is a daddy
is_a_daddy(X):-father(X,Y),(male(Y);female(Y)).

% is_a_mommy(x) : x is a mommy
is_a_mommy(X):-mommy(X,Y),(male(Y);female(Y)).

% sibling(x,y) : x is a sibling of y
sibling(X,Y):-parent(Z,X),parent(Z,Y),X\==Y.

% cousin(x,y) : x is a cousin of y
cousin(X,Y):-parent(X,A),parent(Y,B),sibling(A,B).
