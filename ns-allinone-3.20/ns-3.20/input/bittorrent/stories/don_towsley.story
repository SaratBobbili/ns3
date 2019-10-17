// A sample scenario for VODSim
//
0h0m0s: simulation set random seed time
0h0m0s: simulation set id time
//0h0m0s: simulation set logging file
//
//
0h0m0s: simulation set folder input/bittorrent/torrent-data
0h0m0s: simulation set file input/bittorrent/torrent-data/100MB-full.dat.torrent
0h0m0s: topology set file input/bittorrent/topology/dfn-like.brite
0h0m0s: topology add tracker
0h0m0s: topology set delays min 0 max 0
//
//
0h0m0s: topology add clients count 1 type point-to-point uplink 1024kbps downlink 2048kbps delay 0ms
0h0m0s: all clients join group seeders
0h0m0s: topology add clients count 1 type point-to-point uplink 1024kbps downlink 2048kbps delay 0ms
0h0m0s: all clients join group leechers
0h0m0s: topology add clients count 500 type point-to-point uplink 1024kbps downlink 2048kbps delay 0ms
0h0m0s: all clients join group newpool
0h0m0s: group seeders leave group leechers
0h0m0s: group seeders leave group newpool
0h0m0s: group leechers leave group newpool
//
//
0h0m0s: group seeders set initial bitfield full
0h0m0s: group leechers set initial bitfield empty
0h0m0s: group newpool set initial bitfield empty
//
//
0h0m0s: all clients set block size request 16384 // e.g., 524288 262144 131072 32768 16384
0h0m0s: all clients set block size send 16384 // e.g., 16384
// 0h0m0s: all clients set piece max requests 1
// 0h0m0s: all clients set concurrent requests 8
0h0m0s: all clients set piece timeout 0h0m30s
//
//
0h0m0s: all clients set autoconnect 1
0h0m0s: all clients set peers 35
0h0m0s: all clients set max peers 55
//
//
0h0m0s: group seeders set unchoked peers 3
0h0m0s: group leechers set leave after completed 0h0m0s
0h0m0s: group newpool set leave after completed 0h0m0s
//
//
0h0m0s: group leechers set strategy rarest-first
0h0m0s: group newpool set strategy rarest-first
//0h0m0s: group leechers set autoplay 0
// The following four lines have no effect if VOD simulation is deactivated
// (e.g., when autoplay is off and "play" is never requested).
//0h0m0s: group leechers set video skip inactive
//0h0m0s: group leechers set video skip tolerance 0h0m2s
//0h0m0s: group leechers set video skip afterwards 0h0m15s
//0h0m0s: all clients set video prebuffering 0h0m15s
//
//
0h0m0s: tracker set update interval 0h0m60s
//
//
0h0m0s: group seeders init
0h1m0s: group leechers init
24h0m0s: group newpool init
