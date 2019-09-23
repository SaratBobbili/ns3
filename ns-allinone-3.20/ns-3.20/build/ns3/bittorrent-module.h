
#ifdef NS3_MODULE_COMPILATION
# error "Do not include ns3 module aggregator headers from other modules; these are meant only for end user scripts."
#endif

#ifndef NS3_MODULE_BITTORRENT
    

// Module headers:
#include "AbstractStrategy.h"
#include "BitTorrentClient.h"
#include "BitTorrentDefines.h"
#include "BitTorrentHttpClient.h"
#include "BitTorrentHttpServer.h"
#include "BitTorrentPacket.h"
#include "BitTorrentPeer.h"
#include "BitTorrentTracker.h"
#include "BitTorrentUtilities.h"
#include "BitTorrentVideoClient.h"
#include "BitTorrentVideoMetricsBase.h"
#include "ChokeUnChokeStrategyBase.h"
#include "GlobalMetricsGatherer.h"
#include "PartSelectionStrategyBase.h"
#include "PeerConnectorStrategyBase.h"
#include "ProtocolFactory.h"
#include "RarestFirstPartSelectionStrategy.h"
#include "RequestSchedulingStrategyBase.h"
#include "StorageManager.h"
#include "Story.h"
#include "Torrent.h"
#include "TorrentFile.h"
#include "VODSimBriteTopologyHelper.h"
#include "brite-tap-helper.h"
#include "sha1.h"
#endif
