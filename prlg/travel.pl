byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

go(X,Y) :-
  byCar(X,Y).

go(X,Y) :-
  byTrain(X,Y).

go(X,Y) :-
  byPlane(X,Y).

go(X,Y) :-
  go(X,Z),
  go(Z,Y).

travel(X,Y,_) :-
  go(X,Z),
  go(Z,Y),
  travel(X, Z, go(Z,Y)).

travel(X,Y,Z) :-
  go()