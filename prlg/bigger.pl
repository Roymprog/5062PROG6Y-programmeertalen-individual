bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

is_bigger(X,Z) :- bigger(X,Y), is_bigger(Y,Z).
is_bigger(X,Z) :- bigger(X,Z).