The Data Lab
Directions to Students

Your goal is to modify your copy of bits.c so that it passes all the
tests in btest without violating any of the coding guidelines.

***************************************************
1. Modifying bits.c and checking it for correctness
***************************************************

Carefully read the instructions in the bits.c file before you
start. These give the coding rules that you will need to follow if you
want full credit.

Carefully your solution for compliance with the coding rules.  In
particular, make sure you haven't used an illegal operator.  Once you
have a legal solution, you can test it for correctness using the
btest.exe program.

*****************************************
2. Testing for correctness with btest.exe
*****************************************

The dlab.dsw workspace file in this directory compiles your version of
bits.c with additional code to create a program (or test harness)
named btest.exe.

**********************
3. What btest.exe does
**********************

Btest.exe tests your procedures for correctness by running a number of test
cases.  It does not guarantee exhaustive evaluation.  In addition, it does
not check your code for compliance with the coding guidelines.  You will
have to do that manually.

Here are the command line options for btest.exe:
   -e N     Limit number of errors to report for single function to N
            (Default unbounded)
   -f Name  Check only the named function
   -g       Prints concise report (implies -v 0 and -e 0)
   -h       Print the list of options
   -v N     Set verbosity to level N
            N=0 Only give final scores
            N=1 Also report individual correctness scores (default)

