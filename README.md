# Knights-Travails
 a knight on a standard 8x8 chess board can move from any square to any other square.

Each square on the board is a node (or vertex). A knight’s valid moves from any square represent the edges (or connections) between the vertices. Thus, the problem of finding the shortest path for the knight’s movement becomes a graph traversal problem. The goal is to traverse the graph (the chessboard) to find the shortest route between two nodes (the start and end positions).

Vertices and Edges
The vertices in this graph are each of the possible positions on the chessboard, represented by a pair of coordinates like [x, y], where x and y are between 0 and 7. The edges are the valid knight moves between vertices. For example, from [0,0], a knight can move to [2,1], [1,2], and so on. Each of these moves represents a connection between the vertex [0,0] and the other reachable vertices.

Graph Representation
While solving this problem, you don’t need to explicitly create a graph object with vertices and edges. Instead, you can think of the graph as implicit. The knight starts on a specific vertex, and the algorithm will dynamically explore all possible moves (edges) to other vertices (positions on the board) as it traverses the board.

source: https://www.theodinproject.com/lessons/ruby-knights-travails
