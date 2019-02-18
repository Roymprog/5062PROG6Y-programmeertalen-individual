concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :-
  concat_lists(List1, List2, List3).

analyse_list([]) :-
  write("This is an empty list.!"), nl.
analyse_list([H | T]) :-
  write("This is the head of your list: "), write(H), nl, 
  write("This is the tail of your list: "), write(T), nl.

membership(_, []) :-
  false.
membership(X, [H | T]) :-
  X = H;
  membership(X,T).

% Remove duplicates /2
remove_duplicates(List, Set) :-
 remove_duplicates_helper(List, [], Set).

remove_duplicates_helper([], Acc, Acc).

remove_duplicates_helper([H | T], Acc, Set) :-
  member(H, Acc),
  remove_duplicates_helper(T, Acc, Set).

remove_duplicates_helper([H | T], Acc, Set) :-
  remove_duplicates_helper(T, [H | Acc], Set).

% Reverse list /2
reverse_list(List, Reverse) :-
  reverse_list_helper(List, [], Reverse).

reverse_list_helper([], Acc, Acc).

reverse_list_helper([H | T], Acc, Reverse) :-
  reverse_list_helper(T, [H | Acc], Reverse).

whoami([]).

whoami([_,_|Rest]) :-
  whoami(Rest).
 
% Returns last using recursion
last1([H|[]], H).

last1([_ | T], Y) :-
  last1(T, Y).

% Returns whether list is longer
longer(X, Y) :- 
  length(X,Z),
  length(Y, ZZ),
  ZZ > Z.
