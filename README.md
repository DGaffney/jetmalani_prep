jetmalani_prep
==============

Prep work with adam jetmalani.

Tasks:

1. Store the locations of all members of the network in an output json file. This project name is ```print_location_counts```.
2. Array#all_stats is an extended function of the array class. Use this to provide summary statistics for each and every quantifiable metric across all users.
3. Clean up the locations for all members in the network, and try to find a library, service, or Third Party API that allows you to disambiguate these locations, and then print out a refined listing of location counts. This project name is ```refined_print_location_counts```. 
4. Draw the friends and followers graph as a set of edges and nodes in a JSON array. Nodes are members of the network, represented with a unique ID that is their Twitter ID. The Connections between users is whether one user follows or is followed by another user within the network.
5. Draw a superimposed graph of the linkages between different locations - unique location latitude/longitude pairs serve as the nodes in this graph, and the edges are the number of connections users have between that location and towards other locations. You may either draw multiple edges between places, or create a single edge, and represent the strength of these bonds with an attribute that serves as the weight of the edge.
