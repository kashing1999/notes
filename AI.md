# Introduction

## What is AI
- Broad field, with ambiguous meaning

## AI problems
1. Planning
2. Vision
3. Robotics
4. National Language

---

# Why do we need AI

## The travelling salesman problem
- A salesperson has to visit a number of cities
- He can start at any city and must finish at the same city
- Must visit each city only once
- Solving the TSP is equivalent to finding the minimum cost solution
### Why is the TSP so hard to solve
- Suppose we have n cities
  1. First city we have n choices
  2. Second we have (n-1) choices
  3. Thus possible number of routes stack up to n!
- A 10 city TSP has 1.8 * (10^6) possible routes
- 50 city TSP has 1.52 * (10^64) possible routes
- Need to be smart on how to solve these problems

## Big O notation `O(f(n))`
- n is a meaure of problem size or runtime
- f(n) is the upper bound of the asymptotic behaviour

---

# Problem formulation
## Solving a problem by searching
- For an intelligent agent to work we need to answer the following questions:
  1. Goal to be achieved?
  2. Actions?
  3. Representation (what relevant information is necessary in order to describe the state of the world, describe available transitions, and solve the problem)

## Problem components
### Initial states
- Starting state of the problem
### Operators
- An action or set of actions that moves the problem from one state to another
- The neighbourhood is the set of all possible states reachable from one given state by applying all legal actions
- The successor function are the actions
### Goal test
- Test applied to a state which returns True if we have reached a state that solves the problem
### Path cost
- How much it costs to take a particular sequence of actions
### State space
- The initial state and the successor function define the state space which is the set of all states reachable from the initial state
- Complexity of problem dependant on state space

## Example: Romania
- Initial state: Arad
- Operator: Driving between cities
- State space consists of 20 cities in the graph
- Goal test: Bucharest
- Solution: Path from Arad to Bucharest
- Path cost: function of time/distance/risk/petrol/...
<br>![Romania](./images/Romania.png)<br>

## State Space Representation
- We can use graphcs to model the deeper structure of a problem
- A graph consits of V nodes and E edges
- Nodes
  1. Have unique label for identification
  2. Represents possible stages of a problem
- Edges
  1. Connection between two nodes
  2. Represents steps to solving a problem

## Searching the State Space
- Problem solving is the process of searching the state space for a path to the solution
- Choice of which state to expand is determined by the search strategy
- Corresponding sequences of state expansion is represented by a search tree

## Search Tree
- A tree is a graph that:
  1. Is connected but becomes disconnected on removing any edge
  2. In connected and acyclic
  3. Has precisely one path between any two nodes (Unique paths, makes searching easier)
<br>![GraphTree](./images/GraphTree.png)<br>

## Tree terminologies
- Nodes
  1. Root Node
  2. Child Node
  3. Parent Node
  4. Leaves
- Branching Factor
  1. Average number of children for the nodes of a tree
- Depth
  1. Number of edges from the root node
- Depth of tree
  1. Depth of deepest node

## Why goal search is not trivial
- Graph is not a nice picture
- At start of search, algorithm does not know
  1. Size of tree
  2. Shape of tree
  3. Depth of goal state

## Properties of a search
- We say a search method is complete if it has these properties:
  1. If a goal exists, the search will always find it
  2. If there is no goal, eventually the search method will stop and say for sure no goal exists

## Problem representation
### Node representation
- A node is a bookkeeping data structure.
#### State
- State which a node corresponds to in the state space
#### Parent node
- Previous node that generated this node
#### Action/Operator
- Operator applied to generate this node
#### Path cost `g(x)`
- The path cost from the initial node to this node
#### Depth
- The number of nodes from the root
#### Successor Function
- The `Successor-Fn(x)` returns all states that can be reached from state x

## How good is a solution
- Does our function actually find a solution
- Is it a good solution?
  1. Path Cost
  2. Search Cost (Time and Memory)
  3. Is the solution optimal
## Evaluation a search
#### Completeness
- Is it guaranteed to find a solution?
#### Time
- How long does it take to find a solution?
#### Space
- How much memory does it take to perform this search?
#### Optimality
- Does the search find the optimal solution when there are several solutions?

---

# Blind Searches
- Obtaining whole statespace is impractical, instead states are generated

## Search tree
- Implicit tree defined by *initial state* and *operators*
- Solution is a sequence of actions (a path) in a state space from a start to a goal state
- Search works by considering various possible sequences

## Search tree 
- Search tree is the explicit tree generated by the search strategy
- Cost is the sum of the arc costs (cost of each edge) on the solution path
- Search tree may be infinite because of loopy or redundant paths
 
```
function Tree-Search(problem) returns a solution, or failure
    initialize the frontier using the initial state of problem
    loop do
        if the frontier is empty
            return failure
        
        choose a leaf node and remove from frontier
        
        if node contains a goal
            return the corresponding solution
        
        expand the chosen node, adding the resulting nodes to the frontier
``` 
## Avoiding repeated states
- Failure to detect repeated states can turn a solvable problem into unsolvable ones
- How to avoid, example graph-search:
  1. never generate a state generated before
  2. check for cycles
  3. must keep track of all possible states/memory(space complexity of O(b^d))

## Search strategies
- Two categories:
  1. Uninformed/blind
  2. Informed/Heuristic

## Blind searches
- Can only generate successors and distinguish between goal state from a non-goal state
- No preference during expansion, done systematically
- Search process constructs a search tree, where
  1. `root` is the initial state
  2. `leaf` nodes (fringe) are nodes discovered but not yet expanded or without successors
- The order of fringe processing characterises the different categories of search

## Search implementation
Search implementation requires two data structures:
### Fringes are set of nodes that
- have been discovered
- have not been procesed (tested for goal state and expanded)
- aka open nodes, frontier, agenda
### Explored nodes are set of nodes that
- have been discovered
- have been processed
- aka closed nodes
- process implies the completion of:
  1. tested whether they are a goal
  2. all children have been discovered
   
## Fundamental algorithm:
1. move nodes into "fringe" when they are discovered
2. pick a node from the fringe to be processed in a predetermined order
3. into the "explored" after they have been processed
- processing method to compare current node with a goal state and "expand a node" to discover its children when goal state not reached

## Examples of blind searches:
1. Breadth-first search
2. Depth-first search
3. Depth-limited search
4. Iterative Deepening search
5. Uniform-cost search

## Breadth-First Strategy
- Explorers nodes nearest to root before exploring nodes further away
- Implementation: Fringe is FIFO queue
- New nodes are inserted at the end of the queue
<br>![BFS](./images/BFS.png)<br>
### BFS Observations
- If there is a solution, BFS is guaranteed to find it
- If there are several solutions, then BFS always find the shallowest goal state
- If the cost of a solution is a non-decreasing function along with depth (meaning its cost always increases as you go deeper), then it will always find the cheapest solution
- Just before starting to explore level n, the queue holds all the nodes at level n-1
### BFS Evaluation
- It is complete
- It is optimal
- Time Complexity: `O(b^(d+1))` or less
- Space Complexity: `O(b^(d+1))` or less

## Depth-First Strategy
- Explores a path all the way to a leaf before backtracking and exploring another path
- Implementation: Fringe is a LIFO queue
- New nodes are inserted at the end of the queue
<br>![DFS](./images/DFS.png)<br>
### DFS Observations
- Only needs to store path from root to the leaf node and unexpanded nodes
- If DFS goes down an infinite branch, it will not terminate if it does not find a goal state
- If it does find a solution, there may be a better solution at a lower level in the tree
### DFS Evaluation
- Is is not complete
- It is not optimal
- Time Complexity: `O(b^d)`
- Space Complexity: `O(b*d)`

## Depth Limited Search
- Depth first search may never terminate as it could follow a path that has no solution and is infinite
- Depth Limited Search imposes a depth limit, at which point the search for a branch will terminate
### DLS Observations
- Can be implemented by the general search algorithm using operators which keep track of the depth
- Choice of depth parameter is important, as too deep is wasteful of time and space, while too shallow and we may never find a goal state
- If the depth parameter, l, is set deep enough, then we are guaranteed a solution if one exists
### DLS Evaluations
- Complete if l>=d where d is depth of solution
- It is not optimal
- Time Complexity: `O(b^l)`
- Space Complexity: `O(b*l)`

## Iterative Deepening Search
- On Romania, there are 20 towns so any town is reachable in 19 steps
- In fact, for Romania any town is reachable in 9 steps
- Setting a depth parameter to 19 for DFS is wasteful
- Iterative Deepening Search remedies this by choosing the depth limit by sequentially trying all depth limits until a solution is found
- In effect, combining BFS and DFS
<br>![IDS](./images/IDS.png)<br>
### IDS Observations
- May seem wasteful as it is expanding the same nodes many times, but IDS expands just 11% more nodes than BFS or DLS when b=10
- For large search spaces, where the depth of the solution is not known, IDS is normally the preferred search method
### IDS Evaluation
- It is complete
- It is optimal
- Time Complexity: `O(b^d)`
- Space Complexity: `O(b*d)`

## State Space Search
- Two main approaches, data-driven and goal-driven
    #### Data-Driven Search
    - Starts from an initial state and uses actions that are allowed to move forward until a goal is reached. AKA forward chaining
    - Goal is not clear or hard to formulate precisely
    - All or most of the data given in the initial problem statement
    - Large number of potential goals
    #### Goal-Driven Search
    - Starts at the goal and work back torward a start state by seeing what moves could have led to the goal state. AKA backward chaining
    - Goal can be clearly and easily formulated, example: Finding exit path from a maze
    - Problem data are not given but must be acquired by problem solver

- Both search the same state space and produce same result, however order and actual number of states searched can be different

## Uniform Cost Search
- BFS will find the optimal (shallowest) solution provided all step costs are equal
- For other cases, Uniform Cost Search (a variant of Dijkstra's Algorithm for graph search) can be used to find the cheapest solution provided that the path cost grows monotonically (i.e. never decreases as one proceeds along the path)
- Instead of expanding the shallowest node, Uniform Cost Search works by expanding the node n with the lowest path cost on the fringe
- Similar to BFS except that it sorts the nodes in the fringe according to the cost of the node, where cost is the path cost, `g(n)`
- Expands nodes until the queue's cheapest node is a goal node

## Tree Search Algorithm
```
function TreeSearch(problem, fringe) returns a solution or failure
    fringe = Insert(MakeNode(InitialState[problem]), fringe)
    loop do
        if Empty(fringe) then return failure

        node = RemoveFirst(fringe)

        if GoalTest[problem] applied to State[node] succeeds
            then return Solution(node)
        
        fringe = InsertAll(Expand(node, problem), fringe)

function Expand(previousNode, problem) returns a set of nodes
    successor = the empty set
    for <action, result> in SuccessorFn[probelm](State[previousNode])
        newNode = a new Node
        State[newNode] = result
        ParentNode[newNode] = previousNode
        Action[newNode] = action
        PathCost[newNode] = PathCost[previousNode] + StepCost(previousNode, action, newNode)
        Depth[newNode] = Depth[previousNode] + 1
        add newNode to successors
    return successors
```

## Graph Search Algorithm
```
function GraphSearch(problem, fringe) returns a solution or failure
    closed = an empty set
    loop do
        if Empty(fringe) then return failure

        currentNode = RemoveFirst(fringe)

        if GoalTest[problem] applied to State[currentNode] succeeds
            then return Solution(node)
        child = the empty set
        for <action, result> in SuccessorFn[problem](State[currentNode])
            if result not in closed or fringe then
                newNode = a new Node
                State[newNode] = result
                Action[newNode] = action
                PathCost[newNode] = PathCost[previousNode] + StepCost(previousNode, action, newNode)
                Depth[newNode] = Depth[newNode] + 1
                add newNode to child
        fringe = InsertAll(child, fringe)
```

## Summary

|Evaluation|BFS    |UCS    |DFS    |DLS    |IDS    |
|:---------|:------|:------|:------|:------|:------|
|Time      |b^d    |b^d    |b^m    |b^l    |b^d    |
|Space     |b^d    |b^d    |b*m    |b*l    |b*d    |
|Optimal   |Yes    |Yes    |No     |No     |Yes    |
|Complete  |Yes    |Yes    |No     |if L>=D|b^d    |
- b = Branching factor
- d = Depth of solution
- m = maximum depth of search tree
- l = depth limit

---

# Heuristic Search
- Heuristic search involves adding domain-specific information to select the best path along which to continue searching
- Sometimes known as *informed search*, it is usually more efficient than blind search
- Heuristic search works by deciding which is the next best node to expand (though it may not be the best node)

## Heuristics
- Heuristic function `h(n)` estimates the "goodness" of a node n, specifically, h(n) = estimated cost (or distance) of minimal cost path from n to a goal state
- All domain knowledge used in the search is encoded in `h(n)` which is computable from the current state description
- In general, `h(n)` >= 0 for all nodes n and h(n) = 0 implies that n is a goal node

## Best-First Search
- Node selected for expansion based on an evaluation function `f(n)`, which incorporates heuristics in some way
- We get different searches depending on the evaluation function`f(n)`

## Greedy Search
- Uses an evaluation function `f(n)` = `h(n)`, sorting nodes by increasing values of f
- Selects node to expand believed to be closest, (hence "greedy") to a goal node

## Greedy Search Observations
- It finds solution without ever expanding a node that is not on the solution path
- Solution path is not optimal
- It is only concerned with short term gains
- It is possible to get stuck in an infinite loop unless mechanism for avoiding repeated states is in place

## Greedy Search Evaluation
- Not admissible
- It is not optimal
- It is not complete
- Time Complexity: `O(b^m)` where m is the depth of the search tree

## A* Search
- In greedy search, we kept looking at nodes closer to the goal, but we were accumulating costs as we got further from the initial state
- Our goal is not to minimize the distance from the current head of our path to the goal, rather to minimize the overall length of the path to the goal
- Let `g(n)` be the cost of the best path found so far between the initial node and n
- A*: `f(n)` = `g(n)` + `h(n)` where `f(n)` is the estimated total cost of path through n to goal
- Best-known form of best-first search
- Idea is to avoid expanding paths that are already expensive
- It is optimal and complete provided `h(n)` is admissible, i.e. `h(n)` never overestimates the cost to reach the goal

### Informedness
- For two A* heuristics, `h1` and `h2`, if `h1(n)` <= `h2(n)`, for all states n in the search space, we say `h2` is more informed than `h1`, or `h2` dominates `h1`
- Domination equals efficiency, meaning h2 will never expand more nodes than h1
- Hence always use h2 provided it does not over-estimate and computation time is not too large
### Generating Heuristics with Relaxed Problems
- A problem with fewer restrictions on the actions is called a relaxed problem
- The cost of an optimal solution to a relaxed problem is an admissible heuristic for the original problem
### Effective Branching Factor
- Effective branching factor is the average number of branches expanded
- Lower branching factor is usually associated with a better heursitc