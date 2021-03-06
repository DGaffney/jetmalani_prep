jetmalani_prep
==============

Prep work with adam jetmalani.

Tasks:

1. Store the locations of all members of the network in an output json file. This project name is ```print_location_counts```, and issues relating to it will be created in that milestone (https://github.com/DGaffney/jetmalani_prep/issues?milestone=1&state=open).
2. Array#all_stats is an extended function of the array class. Use this to provide summary statistics for each and every quantifiable metric across all users. This project name is ```all_stats_test_run```, and issues relating to it will be created in that milestone (https://github.com/DGaffney/jetmalani_prep/issues?milestone=2&state=open).
3. Clean up the locations for all members in the network, and try to find a library, service, or Third Party API that allows you to disambiguate these locations, and then print out a refined listing of location counts. This project name is ```refined_print_location_counts```, and issues relating to it will be created in that milestone (https://github.com/DGaffney/jetmalani_prep/issues?milestone=6&state=open).
4. Draw the friends and followers graph as a set of edges and nodes in a JSON array. Nodes are members of the network, represented with a unique ID that is their Twitter ID. The Connections between users is whether one user follows or is followed by another user within the network. This project name is ```base_network_graph```, and issues relating to it will be created in that milestone (https://github.com/DGaffney/jetmalani_prep/issues?milestone=4&state=open).
5. Draw a superimposed graph of the linkages between different locations - unique location latitude/longitude pairs serve as the nodes in this graph, and the edges are the number of connections users have between that location and towards other locations. You may either draw multiple edges between places, or create a single edge, and represent the strength of these bonds with an attribute that serves as the weight of the edge. This project name is ```location_superimposed_network_graph```, and issues relating to it will be created in that milestone (https://github.com/DGaffney/jetmalani_prep/issues?milestone=5&state=open).
