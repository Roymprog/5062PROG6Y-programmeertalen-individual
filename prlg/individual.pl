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

domain(1).
domain(2).
domain(3).
domain(4).
domain(5).
domain(6).
domain(7).
domain(8).
domain(9).

% Returns whether list contains only unique entries
is_set([]).

is_set(X) :-
  is_set_helper(X, []).

% Complicated way to ignore wildcards in searching list for uniqueness
is_set_helper([], _).

is_set_helper([H | T], Y) :-
  number(H),
  \+ member(H, Y),
  is_set_helper(T, [H | Y]).

is_set_helper([H | T], Y) :-
  \+ number(H),
  is_set_helper(T, Y).

% Ensure rows is matrix only contain unique values
matrix_rows_sets([]).
matrix_rows_sets([H | T]) :-
  is_set(H),
  matrix_rows_sets(T).

% Returns whether all values in list are within allowed domain
list_in_domain([]).
list_in_domain([H | T]) :-
  domain(H),
  list_in_domain(T).

% Ensures matrix values are between 1-9
matrix_valid([]).
matrix_valid([H | T]) :-
  list_in_domain(H),
  matrix_valid(T).

% Transposes row into column
transpose_row([],[]).
transpose_row([H | T], [[H]|Y]) :-
  transpose_row(T, Y).

% Very ugly way of combining rows to make a matrix of columns
zip_list([], [], [], [], [], [], [], [], [], []).
zip_list([[H1|_] | T1], [[H2|_] | T2], [[H3|_] | T3], [[H4|_] | T4], [[H5|_] | T5], [[H6|_] | T6], [[H7|_] | T7], [[H8|_] | T8], [[H9|_] | T9], [[H1 , H2, H3, H4, H5, H6, H7, H8, H9] | Z]) :-
  zip_list(T1, T2, T3, T4, T5, T6, T7, T8, T9, Z).

sudoku9([], []).

sudoku9(Rows, Solution) :-
  
  % Very ugly way to disassemble rows and transpose 
  Rows = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
  transpose_row(R1, T1),
  transpose_row(R2, T2),
  transpose_row(R3, T3),
  transpose_row(R4, T4),
  transpose_row(R5, T5),
  transpose_row(R6, T6),
  transpose_row(R7, T7),
  transpose_row(R8, T8),
  transpose_row(R9, T9),
  zip_list(T1, T2, T3, T4, T5, T6, T7, T8, T9, Columns),
  
  matrix_valid(Rows),
  matrix_rows_sets(Rows),
  matrix_rows_sets(Columns),
  
  subgrid_valid(R1, R2, R3),
  subgrid_valid(R4, R5, R6),
  subgrid_valid(R7, R8, R9),

  Solution = [R1,R2,R3,R4,R5,R6,R7,R8,R9].

% Ensures sudoku subgrids are valid
subgrid_valid([], [], []).
subgrid_valid([S1, S2, S3 | T1], [S4, S5, S6 | T2], [S7, S8, S9 | T3]) :-
  is_set([S1, S2, S3, S4, S5, S6, S7, S8, S9]),
  list_in_domain([S1, S2, S3, S4, S5, S6, S7, S8, S9]),
  subgrid_valid(T1, T2, T3).
