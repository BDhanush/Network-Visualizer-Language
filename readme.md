# Language for Network Visualization

##### How to run:

1. Type out the input in file "input.txt". <br>
2. Run the "run.sh" bash file using the following command on your terminal. <br>
   `bash run.sh` <br>
   Refer to the keywords section for syntax. <br>

run.sh

```
flex lex.l
yacc -d yacc.y
gcc lex.yy.c y.tab.c -o network_visualizer
./network_visualizer input.txt > output.dot
dot -Tpng output.dot -o output.png
```

##### Output:
Output is a .dot file named "output.dot". <br>
The visual representation of the network is "output.png" file. <br>

##### Notes:
input.txt and all other file have to be placed in the same directory. <br>
Commands have to be sepearated by whitespace. <br>

##### Keywords:

1. node <br>
   Command: node name <br>
   Creates a node "name". "name" has to start with an alphabet or underscore and can be followed by alphabets, underscore or integers. <br>
   Example: node A <br>
   <br>
   Command: node name integerLabel <br>
   Creates a node "name" with an integer label. <br>
   Example: node A 10 <br>
2. addLabelNum <br>
   Command: addLabelNum nodeName integerLabel <br>
   Changes a node's integer label to a new integer label. If node doesn't exist it creates a new node. <br>
   Example: addLabelNum A 10 <br>
3. connect <br>
   Command: connect node1 node2 <br>
   Creates an edge between node1 and node2. If node doesn't exist it creates a new node. <br>
4. color <br>
   Command: node name color=colorName <br>
   Creates a node "name" with color "colorName". <br>
   Example: node A color=green <br>
   <br>
   Command: connect node1 node2 color=colorName <br>
   Creates an edge between node1 and node2 with color "colorName". <br>
   Example: connect A B color=green <br>
5. weight <br>
   Command: connect node1 node2 weight=edgeWeight <br>
   Creates an edge between node1 and node2 with weight "edgeWeight". Default weight for each edge is 1. <br>
   Example: connect A B weight=10 <br>
6. title <br>
   Command: title=networkTitle <br>
   Adds title to the network/graph. <br>
   Example: title=graph <br>

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
