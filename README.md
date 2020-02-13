# Artificial-Intelligence-Natural-Language-Understanding
CPS 721 Artificial Intelligence - Natural Language Understanding Project completed in Prolog

<b>Rules</b>
1) A block consist of colour(red, blue, green), size (small, medium, large) and shape (Cube, Pyramid and wedge).
2) A block is located on a table or on another block.
3) Each block is on AT MOST one other block (MUST BE A CUBE).
4) Each block has AT MOST one other block on top of it (CANNOT PUT ANY BLOCKS ON TOP OF PYRAMIDS OR WEDGES, BUT PYRAMIDS AND WEDGES CAN BE ON TOP TOWER OF CUBES).
5) The surface of the table is divided into 5 or 6 desinated areas.
6) Each block or pile of blocks is located exactly in one of those areas.

<b>Predicates Defined</b>
1) cube(Name), wedge(Name), pyramid(Name). \\ Defines the type of block with a unique name
2) colour(Block,Colour) \\ Takes block name and assigns it a colour
3) size(Block,Size) \\ Takes block name and assigns it a size
4) locatedOn(Block,Loc). 	 \\ Defines where block is located, ethier on a Cube or a Table Area (1,2,3,4,5,6).
5) justLeftOf(Area1,Area2).  \\ States that Area1 is the area on the table immediatly to the left of Area2.
6) beside(BlockX,BlockY). \\ Holds when Block X is next to Block Y.
7) above(BlockX,BlockY). \\ Hold when Block X is somewhere above Block Y.
8) leftOf(BlockX,BlockY). \\ True if X is ANYWHERE to the left of Y.

<b>Helping Predicates</b>
1) findall(Temp, Goal, List) \\ Produces a list of all possible solutions for the query inputted in Goal.
2) length(Count, List) \\ Produces the length of the list inputted in List.

<b>EXAMPLE INPUTS</b> <br>

?- cube(X). <br>
X = cube01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- wedge(X). <br>
X = wedge01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- pyramid(X). <br>
X = pyramid01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- cube(X), size(X, small), colour(X, red). <br>
X = cube01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- pyramid(X), size(X, small), colour(X, red). <br>
No (0.00s cpu) <br>
?- wedge(X), size(X, small), colour(X, red). <br>
No (0.00s cpu) <br>
?- wedge(X), size(X, large), colour(X, red), locatedOn(X, Y), not Y = cube. <br>
X = wedge03 <br>
Y = 6 <br>
Yes (0.00s cpu) <br>
?- size(X, small), colour(X, green). <br>
X = pyramid01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
X = cube06 <br>
Yes (0.00s cpu, solution 2) <br>
?- pyramid(X), colour(X, blue), size(Y, small), locatedOn(X, Y), Y is cube. <br>
X = pyramid03 <br>
Y = cube06 <br>
Yes (0.00s cpu) <br>
?- pyramid(X), wedge(Y), colour(Y, red), beside(X, Y). <br>
X = pyramid01 <br>
Y = wedge03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- wedge(X), colour(Y, blue), above(X, Y), cube(Z), colour(Z, green), size(Z, large), beside(Y, Z). <br>
X = wedge02 <br>
Y = cube02 <br>
Z = cube03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- pyramid(X), colour(X, blue), size(X, large), cube(Y), size(Y, large), beside(Z, Y), above(X, Z). <br>
X = pyramid03 <br>
Y = cube03 <br>
Z = cube04 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>


?- what([a, large, red, wedge, on, the, table], X). <br>
X = wedge03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([any, small, green, block], X). <br>
X = pyramid01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
X = cube06 <br>
Yes (0.00s cpu, solution 2, maybe more) <br>
?- what([any, blue, pyramid, on, a, small, cube], X). <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, pyramid, beside, a, red, wedge], X). <br>
X = pyramid01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, wedge, above, a, blue, block, beside, a, large, green, cube], X). <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, large, blue, pyramid, above, a, block, beside, a, large, cube], X). <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>

NEW <br>
?- what([a, small, wedge, above, a, small, block], X). <br>
X = wedge01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, red, pyramid, above, a, large, block, beside, a, medium, block], X). <br>
X = pyramid02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, large, pyramid, above, a, medium, block], X). <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, medium, green, cube, below, a, large, blue, block], X). <br>
X = cube04 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, large, cube, below, a, small, cube, beside, a, pyramid], X). <br>
No (0.00s cpu) <br>
?- what([a, block, above, a, block, beside, a, block], X). <br>
X = cube05 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
X = cube05 <br>
Yes (0.00s cpu, solution 2, maybe more) <br>
X = cube06 <br>
Yes (0.00s cpu, solution 3, maybe more) <br>
X = cube06 <br>
Yes (0.00s cpu, solution 4, maybe more) <br>
X = pyramid02 <br>
Yes (0.00s cpu, solution 5, maybe more) <br>
X = pyramid02 <br>
Yes (0.00s cpu, solution 6, maybe more) <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 7, maybe more) <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 8, maybe more) <br>
X = wedge01 <br>
Yes (0.00s cpu, solution 9, maybe more) <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 10, maybe more) <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 11, maybe more) <br>
?- what([a, cube, below, a, pyramid, beside, a, block, below, a, wedge], X). <br>
X = cube03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, block, above, a, block, beside, a, pyramid], X). <br>
X = cube05 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, wedge, beside, a, pyramid, beside, a, block], X). <br>
X = wedge03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, wedge, above, a, block, beside, a, block, below, a, pyramid], X). <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
 <br>
?- what([the, red, block], X). <br>
No (0.00s cpu) <br>
?- what([the, pyramid, above, the, cube], X). <br>
No (0.00s cpu) <br>
?- what([the, wedge, above, a, cube, beside, the, cube], X). <br>
No (0.00s cpu) <br>
?- what([a, wedge, above, a, cube, beside, a, cube], X). <br>
X = wedge01 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([the, green, wedge, above, a, cube], X). <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([the, blue, cube, above, a, green, cube], X). <br>
X = cube05 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([the, blue, pyramid, above, a, small, green, cube], X). <br>
X = pyramid03 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([the, cube, below, a, wedge], X). <br>
No (0.00s cpu) <br>
 <br>
?- what([a, cube, between, a, pyramid, and, a, pyramid], X). <br>
X = cube04 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, cube, between, a, pyramid, and, a, wedge], X). <br>
X = cube04 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, cube, between, a, cube, and, a, block], X). <br>
X = cube02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, block, between, a, pyramid, and, a, wedge], X). <br>
X = cube04 <br>
Yes (0.01s cpu, solution 3, maybe more) <br>
X = cube05 <br>
Yes (0.01s cpu, solution 4, maybe more) <br>
X = cube06 <br>
Yes (0.01s cpu, solution 6, maybe more) <br>
X = pyramid01 <br>
Yes (0.03s cpu, solution 13, maybe more) <br>
X = pyramid03 <br>
Yes (0.03s cpu, solution 14, maybe more) <br>
X = wedge03 <br>
Yes (0.05s cpu, solution 21, maybe more) <br>
No (0.05s cpu) <br>
?- what([the, cube, between, a, cube, and, a, cube], X). <br>
No (0.00s cpu) <br>
?- what([a, blue, large, cube, between, a, red, pyramid, and, a, red, wedge], X). <br>
X = cube05 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, red, pyramid, above, a, cube, between, a, block, and, a, pyramid], X). <br>
X = pyramid02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
?- what([a, small, green, cube, below, a, pyramid, between, a, green, wedge, and, a, small, pyramid], X). <br>
X = cube06 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
what([a,green,wedge,between,a,small,red,cube,and,a,small,green,cube,above,a,large,blue,cube],X) <br>
?- what([a, green, wedge, between, a, small, red, cube, and, a, small, green, cube, above, a, large, blue, ...], X). <br>
X = wedge02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
what([a,red,pyramid,above,a,cube,between,a,wedge,and,a,pyramid,above,a,cube],X) <br>
?- what([a, red, pyramid, above, a, cube, between, a, wedge, and, a, pyramid, above, a, cube], X). <br>
X = pyramid02 <br>
Yes (0.00s cpu, solution 1, maybe more) <br>
