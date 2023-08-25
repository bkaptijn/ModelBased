# An ASP Solver for SmartGames IQ Puzzler Pro

Note: This is only an assignment for an ModelBased AI Course

## Requirements

You'll need:
- clingo (version 5.7.0)
- clingraph (version 1.1.1)

and their dependencies.
Other versions might work too.

## Usage

./assignment2.sh 

This will generate a first found solution with the empty board as starting point.
(note: it might run several minutes before writing result to ./out/0/solution.png)

By changing the clingo -n1 parameter in the shell script you can ask for more than 1 solution (if they exist).

Running the assignment2.lp script only with clingo will give you solutions in a way you can extract start situations from it.

Edit the assignment2.lp script by uncommenting stuff about start situations to run the solver with given start situations , or define these yourselves.
