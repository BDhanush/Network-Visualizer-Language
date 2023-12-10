# Language for Network Visualization
##### How to run:
1. Type out the input in file "input.txt".
2. Run the "run.sh" bash file.
   Refer to the keywords section for syntax.
run.sh
```
flex lex.l
yacc -d yacc.y
gcc lex.yy.c y.tab.c -o network_visualizer
./network_visualizer input.txt > output.dot
dot -Tpng output.dot -o output.png
```

##### Output:

Output is a .dot file named "output.dot".
The visual representation of the network is "output.png" file.Notes:
The visual representation of the network is "output.png" file.

##### Notes:
input.txt and all other file have to be placed in the same directory.
Commands have to be sepearated by whitespace.

##### Keywords:
1. node
   Command: node name
   Creates a node "name". "name" has to start with an alphabet or underscore and can be followed by alphabets, underscore or integers.
   Example: node A
   Command: node name integerLabel
   Creates a node "name" with an integer label.
   Example: node A 10
   
3. addLabelNum
   Command: addLabelNum nodeName integerLabel
   Changes a node's integer label to a new integer label. If node doesn't exist it creates a new node.
   Example: addLabelNum A 10
   
5. connect
   Command: connect node1 node2
   Creates an edge between node1 and node2. If node doesn't exist it creates a new node.
   
7. color
   Command: node name color=colorName
   Creates a node "name" with color "colorName".
##### Sample Input:

```
title=test
node A color = blue
node B 
node C 5
connect A B weight=10
connect A B color=pink
connect A C color=red
connect A D color=green
addLabelNum A 10
addLabelNum C 10
```
