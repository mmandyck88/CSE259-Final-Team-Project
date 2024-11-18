% Singer Marries Widow Who has Grown-up Daugther
husband(singer, widow).
husband(my_father, widow_daughter). % Father is husband marries Grown up daugther

wife(A, B) :- husband(B, A).

% Singer Becomes Father of baby son
father(singer, singer_son).
father(my_father, singer).
father(my_father, my_father_son_in_law). % Father becomes new Son-in-law

% Mother Has Son 
mother(widow, singer_son).
mother(widow, widow_daughter).
mother(widow_daughter, my_father_son_in_law). % Father becomes new Son-in-law

spouse(A, B) :- husband(A, B).
spouse(A, B) :- wife(A, B).

parent(A, B) :- parent1(A, B).
parent(A, B) :- step_parent(A, B).

% Widow's daughter is Step-mom use step-parent for 
step_parent(A, C) :-
    spouse(A, B),
    parent1(B, C), % new parent dynamic 
    \+ parent1(A, C). % negation as failure

% Father is son-in-law and singer is Father in-law
parent_in_law(A, C) :-
    spouse(B, C),
    parent(A, B),
    \+ parent(A, C). % negation as failure

parent1(A, B) :- father(A, B).
parent1(A, B) :- mother(A, B).

%Father and Grown Daugther has Child run_baby then run_baby is Singer and Widow's grandchild
father(my_father,widow) :-
	child(run_baby,my_father),
	child(run_baby,widow).

% Singer is own Grandparent and Wife is Grandmother
grandparent(A, C) :-
    parent(A, B), %new parent dynamic
    parent(B, C). %new parent dynamic

	sibling(A, B) :- new_sibling(sibling1(A, B)).

		sib_in_law(A, B) :- sib_in_law1(A, B).
		sib_in_law(A, B) :- sib_in_law1(B, A).

		sib_in_law1(A, C) :-
  		  spouse(A, B), % Singer baby
		    sibling(B, C).
				% Father
		sibling1(A, B) :-
		    parent(C, A),
 		   parent(C, B),
 		   A \= B.
% baby is uncle brother, widow’s daughter is singer’s baby’s aunt use pibling
pibling(A, C) :-
    sibling(A, B),
    parent(B, C).
