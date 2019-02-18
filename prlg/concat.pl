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
  