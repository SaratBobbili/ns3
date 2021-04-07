# ns3

To evaluate Bittorrent Protocol over ns-3, one should have a working knowledge of the C++ syntax. In addition, familiarity with the ns-3 interface would be helpful. The tutorial on ns-3 webpage should be sufficient to get started.

Link: Tutorial on ns-3

https://www.nsnam.org/docs/tutorial/html/

A brief overview of the VODSIM module:

The way ns-3 works is modular. A quick look at the following webpage (https://www.nsnam.org/docs/models/html/index.html) gives you an idea of the technologies and their protocols currently supported by ns-3. VODSIM is a custom module developed and maintained by Comsys laboratory (https://www.comsys.rwth-aachen.de/research/projects/vodsim) that implements the BitTorrent Protocol. Although, VODSIM uses ns-3 as its workhorse for running the BiTorrent protocol it is much easier to setup a simulation environment on VODSIM. For example, the ns-3 tutorial page includes examples of an UDPEchoServer implementation (first.cc) to evaluate the UDP protocol. Even for the simplest of changes, one has to manually reset attributes of the type of nodes and configure their behaviour each time a fresh simulation is run. In contrast, VODSIM abstracts much of the functionality of the BitTorrent protocol simualtion to simply setting up a configuration file. To this effect, a good understanding of the BitTorrent Specification is necessary to be able to create varied configurations of the simulation--explained below-- to evaluate scenarios of interest.

BitTorrent Specification: https://wiki.theory.org/BitTorrentSpecification

The following is a sample config (referred to as story files by the VODSIM developers) used to run vodsim simulations:

// Random number generator
0h0m0s: simulation set random seed time
0h0m0s: simulation set id time

// Torrent data (you can create a torrent for a file of any size using popular torrent clients like utorrent, BitTorrent e.tc.)
0h0m0s: simulation set folder input/bittorrent/torrent-data
0h0m0s: simulation set file input/bittorrent/torrent-data/100MB-full.dat.torrent

// Network topology; represents the way nodes are placed in the network.
0h0m0s: topology set file input/bittorrent/topology/dfn-like.brite

// Adding a tracker node (more about the above behaviour of Tracker can be found on the Bittorrent specification page)
0h0m0s: topology add tracker
0h0m0s: topology set delays min 0 max 0

// Adding clients. A client can either be a seeder or a leecher .
// Below we are making the set of seeders and leechers mutually disjoint using the following configuration (group seeders leave group leechers). 
0h0m0s: topology add clients count 2 type point-to-point uplink 448kbps downlink 2048kbps delay 0ms
0h0m0s: all clients join group seeders
0h0m0s: topology add clients count 4 type point-to-point uplink 448kbps downlink 2048kbps delay 0ms
0h0m0s: all clients join group leechers
0h0m0s: group seeders leave group leechers


//bitfield represents the availability of pieces. Since a seeder by definition has to have all pieces it's bitfield should be full and leechers have to have no pieces .at the  // start of the simulation
0h0m0s: group seeders set initial bitfield full 
0h0m0s: group leechers set initial bitfield empty

//BitTorrent specific information (more on it's specificatin page)
0h0m0s: all clients set block size request 16384 // e.g., 524288 262144 131072 32768 16384
0h0m0s: all clients set block size send 16384 // e.g., 16384
0h0m0s: all clients set piece timeout 0h0m30s

0h0m0s: all clients set autoconnect 1
0h0m0s: all clients set peers 30
0h0m0s: all clients set max peers 55

0h0m0s: group seeders set unchoked peers 3

// piece selection strategy
0h0m0s: all clients set strategy rarest-first
0h0m0s: group leechers set autoplay 0

// video specific information
0h0m0s: group leechers set video skip inactive
0h0m0s: group leechers set video skip tolerance 0h0m2s
0h0m0s: group leechers set video skip afterwards 0h0m15s
0h0m0s: all clients set video prebuffering 0h0m15s

0h0m0s: tracker set update interval 0h0m60s

//Initialize all nodes
0h0m0s: group seeders init
0h1m0s: group leechers init

The above config simplifies setting up the ns-3 simulation without actually having to refactor the C++ code. It is important that one has a good understanding of the BitTorrent Specification to be able to create a custom config/story file since the story file abstract is based on the BitTorrent Standard.

Files of interest: ns-allinone-3.20/ns-3.20/src/bittorrent/*

Everything that one needs to modify the protocol can be found under the above path. I would suggest going through the following files in addition to the BitTorrent Specificatin Wiki to get started.

1. ns-allinone-3.20/ns-3.20/src/bittorrent/examples/Quickstart-Guide.txt
2. ns-allinone-3.20/ns-3.20/src/bittorrent/helper/Story-Reference.txt ( The most important of all. This file contains the available configuration options which facilitates one to setup a config and run a scenario of interest. Note that anything that is beyond the scope of the available options requires source code changes).
3. ns-allinone-3.20/ns-3.20/src/bittorrent/helper/Story.cc ( Source file that parses each story file and sets up the ns-3 environment).
4. ns-allinone-3.20/ns-3.20/src/bittorrent/model ( Source code for vanilla BitTorrent protocol e.g. tracker model, client model, piece selection strategy, choke-unchoke e.t.c)

Other Misc links:
https://laboratory.comsys.rwth-aachen.de/glebke/vodsim
https://www.comsys.rwth-aachen.de/research/projects/vodsim
https://dl.acm.org/doi/10.5555/2263019.2263073




