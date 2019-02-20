squares([
  [X11, X12, X13, X14, X15, X16, X17, X18, X19],
  [X21, X22, X23, X24, X25, X26, X27, X28, X29],
  [X31, X32, X33, X34, X35, X36, X37, X38, X39],
  [X41, X42, X43, X44, X45, X46, X47, X48, X49],
  [X51, X52, X53, X54, X55, X56, X57, X58, X59],
  [X61, X62, X63, X64, X65, X66, X67, X68, X69],
  [X71, X72, X73, X74, X75, X76, X77, X78, X79],
  [X81, X82, X83, X84, X85, X86, X87, X88, X89],
  [X91, X92, X93, X94, X95, X96, X97, X98, X99]
],
[
  [X11, X12, X13, X21, X22, X23, X31, X32, X33],
  [X41, X42, X43, X51, X52, X53, X61, X62, X63],
  [X71, X72, X73, X81, X82, X83, X91, X92, X93],
  [X14, X15, X16, X24, X25, X26, X34, X35, X36],
  [X44, X45, X46, X54, X55, X56, X64, X65, X66],
  [X74, X75, X76, X84, X85, X86, X94, X95, X96],
  [X17, X18, X19, X27, X28, X29, X37, X38, X39],
  [X47, X48, X49, X57, X58, X59, X67, X68, X69],
  [X77, X78, X79, X87, X88, X89, X97, X98, X99]
]).

transpose([[A]],[[A]]).
transpose([[A|H]|T],[[A|HH]|TT]):-
set_heads(T,HH,R),
set_heads(TT,H,RR),
transpose(R,RR).

set_heads([],[],[]).
set_heads([[H|T]|L],[H|TT],[T|R]):-
set_heads(L,TT,R).

all_different_list([]).
all_different_list([H|T]) :-
fd_all_different(H),
all_different_list(T).

domain(1).
domain(2).
domain(3).
domain(4).
domain(5).
domain(6).
domain(7).
domain(8).
domain(9).

domain_array([]).
domain_array([H|T]) :-
domain(H),
domain_array(T).

domain_matrix([]).
domain_matrix([H|T]) :-
domain_array(H),
domain_matrix(T).

sudoku(Rows) :-
domain_matrix(Rows),

transpose(Rows, Columns),
squares(Rows, Squares),

all_different_list(Rows),
all_different_list(Columns),
all_different_list(Squares).

test1 :-
L = [
 [_,6,_,1,_,4,_,5,_],
 [_,_,8,3,_,5,6,_,_],
 [2,_,_,_,_,_,_,_,1],
 [8,_,_,4,_,7,_,_,6],
 [_,_,6,_,_,_,3,_,_],
 [7,_,_,9,_,1,_,_,4],
 [5,_,_,_,_,_,_,_,2],
 [_,_,7,2,_,6,9,_,_],
 [_,4,_,5,_,8,_,7,_]
],
sudoku(L),
pp(L).


test3 :-
L = [
[_,4,3,_,8,_,2,5,_],
[6,_,_,_,_,_,_,_,_],
[_,_,_,_,_,1,_,9,4],
[9,_,_,_,_,4,_,7,_],
[_,_,_,6,_,8,_,_,_],
[_,1,_,2,_,_,_,_,3],
[8,2,_,5,_,_,_,_,_],
[_,_,_,_,_,_,_,_,5],
[_,3,4,_,9,_,7,1,_]
],
sudoku(L),
pp(L).


test5 :-
L = [
[_,_,_,1,5,_,_,7,_],
[1,_,6,_,_,_,8,2,_],
[3,_,_,8,6,_,_,4,_],
[9,_,_,4,_,_,5,6,7],
[_,_,4,7,_,8,3,_,_],
[7,3,2,_,_,6,_,_,4],
[_,4,_,_,8,1,_,_,9],
[_,1,7,_,_,_,2,_,8],
[_,5,_,_,3,7,_,_,_]
],
sudoku(L),
pp(L).

testHard :-
L = [
[1, _, _,  _, _, 7,  _, 9, _],
[_, 3, _,  _, 2, _,  _, _, 8],
[_, _, 9,  6, _, _,  5, _, _],
%%%%%%%%%  %%%%%%%%  %%%%%%%%%
[_, _, 5,  3, _, _,  9, _, _],
[_, 1, _,  _, 8, _,  _, _, 2],
[6, _, _,  _, _, 4,  _, _, _],
%%%%%%%%%  %%%%%%%%  %%%%%%%%%
[3, _, _,  _, _, _,  _, 1, _],
[_, 4, _,  _, _, _,  _, _, 7],
[_, _, 7,  _, _, _,  3, _, _]
],
sudoku(L),
pp(L).

pp([]).
pp([H|T]) :-
write(H),nl,
pp(T).