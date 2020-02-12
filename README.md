# Artificial-Intelligence-Natural-Language-Understanding
CPS 721 Artificial Intelligence - Natural Language Understanding Project completed in Prolog

<b>Rules</b>
1) A block consist of colour(red, blue, green), size (small, medium, large) and shape (Cube, Pyramid and wedge).
2) A block is located on a table or on another block.
3) Each block is on AT MOST one other block (MUST BE A CUBE).
4) Each block has AT MOST one other block on top of it (CANNOT PUT ANY BLOCKS ON TOP OF PYRAMIDS OR WEDGES, BUT PYRAMIDS AND WEDGES CAN BE ON TOP TOWER OF CUBES).
5) The surface of the table is divided into 5 or 6 desinated areas.
6) Each block or pile of blocks is located exactly in one of those areas.

<b>Table Layout</b>
-------------------------
|   |   |   |   |   |   |
| 1 | 2 | 3 | 4 | 5 | 6 |
|   |   |   |   |   |   |
-------------------------

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

<b>EXAMPLE INPUTS</b>


