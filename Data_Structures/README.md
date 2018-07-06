These data structures are implemented underneath as such.

Binary Search Tree:
       1
     /   \
  -1       2
            \
              3
1> A1 = bst_scratch:new().
{null,{},{}}
2> A2 = bst_scratch:push(A1,1).
{1,{},{}}
3> A3 = bst_scratch:push(A2,2).
{1,{},{2,{},{}}}
4> A4 = bst_scratch:push(A3,3).
{1,{},{2,{},{3,{},{}}}}
5> A5 = bst_scratch:push(A4,-1).
{1,{-1,{},{}},{2,{},{3,{},{}}}}
6>
