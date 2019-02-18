/*
* 6081282   -   Roy van Santen
* Programmeertalen Prolog individual exercises
*/
my_append([], Y, Y).

my_append(X, [], X).

my_append([H | T], Y, [H | Z]) :-
  my_append(T, Y, Z).

palindrome([]).

palindrome([_ | []]).

palindrome(X) :-
  X = [H | T],
  reverse(T, R),
  R = [HR | M],
  HR = H,
  palindrome(M).
