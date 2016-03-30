#Problem
We want to write a function that calculates the "cousin-ship" of two given persons (such as 2nd cousin once removed)

Cousin-ship is calculated as:
1) The minimum number of hops to the common ancestor, minus 1
2) The absolute value of the difference in hops to the common ancestor

                                          A
                                         / \
                                        B   C
                                       / \   \
                                      D   E   F
                                     /
                                    G

Calculate everything as cousin-ship (don't worry about siblings, parents, etc).
Example: 
	D and F are 1st cousins, 0th removed.
	G and F are 1st cousins, once removed.
	G and E are 0th cousins, once removed.

 
A Person is defined as having an id and a single ancestor property (to simplify the problem). The depth of the ancestry is unknown (but could be significant).

Feel free to use any modern programming language to solve this problem. Try to be as efficient in the calculation as possible.

#Solution Description
Given two Person nodes we can walk up the tree to find the common ancestor between them. To begin, we are gaurenteed that the common ancestor will not be below the Person with the least depth on the tree. So we can walk up the tree of the furthest node until the depths are the same. Once the depths are the same we can loop through checking whether our two pointers are the same and walking up the tree if they are not. Every time the pointer is walked up the tree, a hop counter should be incremented for that particular pointer. Once the common ancestor is found we can use these hop counters to apply the Cousin-ship calculation as seen above.

#Output
A and B are -1st cousins, once removed

A and C are -1st cousins, once removed

A and D are -1st cousins, 2nd removed

A and E are -1st cousins, 2nd removed

A and F are -1st cousins, 2nd removed

A and G are -1st cousins, 3rd removed

B and C are 0th cousins, 0th removed

B and D are -1st cousins, once removed

B and E are -1st cousins, once removed

B and F are 0th cousins, once removed

B and G are -1st cousins, 2nd removed

C and D are 0th cousins, once removed

C and E are 0th cousins, once removed

C and F are -1st cousins, once removed

C and G are 0th cousins, 2nd removed

D and E are 0th cousins, 0th removed

D and F are 1st cousins, 0th removed

D and G are -1st cousins, once removed

E and F are 1st cousins, 0th removed

E and G are 0th cousins, once removed

F and G are 1st cousins, once removed
