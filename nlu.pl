/* Rules: 
1) A block consist of colour(red, blue, green), size (small, medium, large) and shape (Cube, Pyramid and wedge).
2) A block is located on a table or on another block.
3) Each block is on AT MOST one other block (MUST BE A CUBE).
4) Each block has AT MOST one other block on top of it (CANNOT PUT ANY BLOCKS ON TOP OF PYRAMIDS OR WEDGES, BUT PYRAMIDS AND WEDGES CAN BE ON TOP TOWER OF CUBES).
5) The surface of the table is divided into 5 or 6 desinated areas.
6) Each block or pile of blocks is located exactly in one of those areas.

Predicates:
1) cube(Name), wedge(Name), pyramid(Name). \\ Defines the type of block with a unique name
2) colour(Block,Colour) \\ Takes block name and assigns it a colour
3) size(Block,Size) \\ Takes block name and assigns it a size
4) locatedOn(Block,Loc). 	 \\ Defines where block is located, ethier on a Cube or a Table Area (1,2,3,4,5,6).
5) justLeftOf(Area1,Area2).  \\ States that Area1 is the area on the table immediatly to the left of Area2.
6) beside(BlockX,BlockY). \\ Holds when Block X is next to Block Y.
7) above(BlockX,BlockY). \\ Hold when Block X is somewhere above Block Y.
8) leftOf(BlockX,BlockY). \\ True if X is ANYWHERE to the left of Y.

Helping Predicates:
1) findall(Temp, Goal, List) \\ Produces a list of all possible solutions for the query inputted in Goal.
2) length(Count, List) \\ Produces the length of the list inputted in List.

Table Layout:
 -----------------------
|	|	|	|	|	|	|
| 1 | 2 | 3 | 4 | 5 | 6 |
|	|	|	|	|	|	|
 -----------------------
*/

cube(cube01).
cube(cube02).
cube(cube03).
cube(cube04).
cube(cube05).
cube(cube06).

wedge(wedge01).
wedge(wedge02).
wedge(wedge03).

pyramid(pyramid01).
pyramid(pyramid02).
pyramid(pyramid03).

size(cube01,small).
size(wedge01,small).
size(pyramid01,small).
size(cube02,medium).
size(wedge02,medium).
size(pyramid02,medium).
size(cube03,large).
size(wedge03,large).
size(cube04,medium).
size(cube05,large).
size(cube06,small).
size(pyramid03,large).

colour(cube01,red).
colour(wedge01,blue).
colour(pyramid01,green).
colour(cube02,blue).
colour(wedge02,green).
colour(pyramid02,red).
colour(cube03,green).
colour(wedge03,red).
colour(cube04,green).
colour(cube05,blue).
colour(cube06,green).
colour(pyramid03,blue).

locatedOn(cube01,1).
locatedOn(wedge01,cube01).
locatedOn(pyramid01,5).
locatedOn(cube02,2).
locatedOn(wedge02,cube02).
locatedOn(pyramid02,cube03).
locatedOn(cube03,3).
locatedOn(wedge03,6).
locatedOn(cube04,4).
locatedOn(cube05,cube04).
locatedOn(cube06,cube05).
locatedOn(pyramid03,cube06).

justLeftOf(5,6).
justLeftOf(4,5).
justLeftOf(3,4).
justLeftOf(2,3).
justLeftOf(1,2).

beside(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), justLeftOf(Z,Q).
beside(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), justLeftOf(Q,Z).

/*
These predicates below define the less restrictive meaning of beside, meaning that towers are justified to be beside each other not just blocks on the table.

beside(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), beside(X,Q).
beside(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), beside(Z,Y).

*/

getArea(X,A) :- locatedOn(X,Z), not(Z is cube), A is Z.
getArea(X,A) :- locatedOn(X,Z), getArea(Z,A).

above(X,Y) :- locatedOn(X,Y).
above(X,Y) :- locatedOn(X,Z), above(Z,Y).

leftOf(X,Y) :- getArea(X,Z), getArea(Y,Q), Q>Z.
leftOf(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), not(Z is cube), not(Q is cube), Q>Z.

rightOf(X,Y) :- getArea(X,Z), getArea(Y,Q), Q<Z.
rightOf(X,Y) :- locatedOn(X,Z), locatedOn(Y,Q), not(Z is cube), not(Q is cube), Q<Z.

/*
Lexicon

Articles: a, any, the.
Adjectives: [huge, large, big], [blue, green, yellow, orange, pink, red], small, medium.
Common Nouns: wedge, pyramid, cube, block, table.
Prepostions: on, beside, below, above.

*/

article(a).
article(any).

common_noun(cube,X) :- cube(X).
common_noun(wedge,X) :- wedge(X).
common_noun(pyramid,X) :- pyramid(X).
common_noun(block,X) :- cube(X).
common_noun(block,X) :- pyramid(X).
common_noun(block,X) :- wedge(X).
common_noun(table,1).
common_noun(table,2).
common_noun(table,3).
common_noun(table,4).
common_noun(table,5).
common_noun(table,6).

adjective(huge,X) :- size(X,large).
adjective(large,X) :- size(X,large).
adjective(big,X) :- size(X,large).
adjective(small,X) :- size(X,small).
adjective(medium,X) :- size(X,medium).
adjective(blue,X) :- colour(X,blue).
adjective(green,X) :- colour(X,green).
adjective(yellow,X) :- colour(X,yellow).
adjective(orange,X) :- colour(X,orange).
adjective(pink,X) :- colour(X,pink).
adjective(red,X) :- colour(X,red).

preposition(on,X,Y) :- locatedOn(X,Y).
preposition(beside,X,Y) :- beside(X,Y).
preposition(above,X,Y) :- above(X,Y).
preposition(below,X,Y) :- above(Y,X).
preposition(between,B,X) :- leftOf(X,B).
preposition(and,B,X) :- rightOf(X,B).

/******************* parser **********************/

what(Words, Ref) :- np(Words, Ref).

/* Noun phrase can be a proper name or can start with an article */

np([Name],Name) :- proper_noun(Name).
np([the|Rest], Who) :- findall(X,np2(Rest, Who),L), length(L,Y), Y = 1, np2(Rest, Who).
np([Art|Rest], Who) :- article(Art), np2(Rest, Who).


/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

np2([Adj|Rest],Who) :- adjective(Adj,Who), np2(Rest, Who).
np2([Noun|Rest], Who) :- common_noun(Noun, Who), mods(Rest,Who).


/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */

mods([], _).
mods(Words, Who) :-
	appendLists(Start, End, Words),
	prepPhrase(Start, Who),	mods(End, Who).
	
prepPhrase([Prep|Rest], Who) :-
	preposition(Prep, Who, Ref), np(Rest, Ref).

appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).

