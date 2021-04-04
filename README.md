# ns3

To evaluate Bittorrent Protocol over ns-3, one should have a working knowledge of the C++ syntax. In addition, familiarity with the ns-3 interface would be helpful. The tutorial on ns-3 webpage should be sufficient to get started.

Link: Tutorial on ns-3

https://www.nsnam.org/docs/tutorial/html/

A brief overview of the VODSIM module:

The way ns-3 works is modular. A quick look at the following webpage (https://www.nsnam.org/docs/models/html/index.html) gives you an idea of the technologies and their protocols currently supported by ns-3. VODSIM is a custom module developed and maintained by Comsys laboratory (https://www.comsys.rwth-aachen.de/research/projects/vodsim) that implements the BitTorrent Protocol. Although, VODSIM uses ns-3 as its workhorse for running the BiTorrent protocol it is much easier to setup a simulation environment on VODSIM. For example, the ns-3 tutorial page includes examples of an UDPEchoServer implementation (first.cc) to evaluate the UDP protocol. To this effect, one has to manually set attributes of the type of nodes and configure their behaviour everytime the simulation is run. In contrast, VODSIM abstracts much of the functionality of the BitTorrent protocol simualtion to simply setting up a configuration file. To this effect, a good understanding of the BitTorrent Specification is necessary to be able to create varied configurations of the simulation--explained below-- to evaluate scenarios of interest.
