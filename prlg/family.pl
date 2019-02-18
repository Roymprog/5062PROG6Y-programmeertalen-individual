female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dick).
male(bob).
male(harry).
parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dick).
parent(mary, sandra).

father(X, Y) :- parent(X,Y), male(X).
sister(X, Y) :- parent(_,X), parent(_,Y), female(X).
same_parent(X,Y) :- parent(_,X), parent(_,Y).
grandmother(X,Z) :- parent(X,Y), parent(Y,Z), female(X).
cousin(X,Y) :- parent(Z,X), parent(ZZ,Y), same_parent(Z, ZZ).