######################################################################
# Automatically generated by qmake (2.01a) Tue Feb 26 01:20:42 2013
######################################################################

TEMPLATE = app
TARGET = 
DEPENDPATH += . \
              AddrMgr \
              bison++ \
              CfgMgr \
              ClntAddrMgr \
              ClntCfgMgr \
              ClntIfaceMgr \
              ClntMessages \
              ClntOptions \
              ClntTransMgr \
              IfaceMgr \
              include \
              Messages \
              Misc \
              Options \
              Port-bsd \
              Port-linux \
              Port-win32 \
              Port-winnt2k \
              poslib \
              RelCfgMgr \
              RelIfaceMgr \
              RelMessages \
              RelOptions \
              RelTransMgr \
              Requestor \
              SrvAddrMgr \
              SrvCfgMgr \
              SrvIfaceMgr \
              SrvMessages \
              SrvOptions \
              SrvTransMgr \
              tests \
              AddrMgr/tests \
              bison++/Example \
              CfgMgr/tests \
              Options/tests \
              SrvCfgMgr/tests \
              tests/crypto \
              tests/DnsUpdate \
              tests/Logger \
              tests/LowLevel \
              tests/Srv
INCLUDEPATH += . \
               Misc \
               Port-win32 \
               AddrMgr \
               Port-bsd \
               bison++ \
               CfgMgr \
               IfaceMgr \
               ClntAddrMgr \
               ClntCfgMgr \
               ClntOptions \
               Options \
               ClntIfaceMgr \
               ClntTransMgr \
               ClntMessages \
               Messages \
               poslib \
               include \
               RelIfaceMgr \
               RelMessages \
               RelCfgMgr \
               RelOptions \
               RelTransMgr \
               SrvIfaceMgr \
               SrvOptions \
               SrvMessages \
               SrvAddrMgr \
               SrvCfgMgr \
               SrvTransMgr \
               Port-linux \
               Port-winnt2k \
               Requestor \
               tests/Srv

# Input
HEADERS += AddrMgr/AddrAddr.h \
           AddrMgr/AddrClient.h \
           AddrMgr/AddrIA.h \
           AddrMgr/AddrMgr.h \
           AddrMgr/AddrPrefix.h \
           bison++/bison.h \
           bison++/files.h \
           bison++/FlexLexer.h \
           bison++/getopt.h \
           bison++/gram.h \
           bison++/lex.h \
           bison++/machine.h \
           bison++/new.h \
           bison++/state.h \
           bison++/symtab.h \
           bison++/system.h \
           bison++/types.h \
           CfgMgr/CfgMgr.h \
           CfgMgr/FlexLexer.h \
           CfgMgr/HostID.h \
           CfgMgr/HostRange.h \
           CfgMgr/TimeZone.h \
           ClntAddrMgr/ClntAddrMgr.h \
           ClntCfgMgr/ClntCfgAddr.h \
           ClntCfgMgr/ClntCfgIA.h \
           ClntCfgMgr/ClntCfgIface.h \
           ClntCfgMgr/ClntCfgMgr.h \
           ClntCfgMgr/ClntCfgPD.h \
           ClntCfgMgr/ClntCfgPrefix.h \
           ClntCfgMgr/ClntCfgTA.h \
           ClntCfgMgr/ClntParsAddrOpt.h \
           ClntCfgMgr/ClntParser.h \
           ClntCfgMgr/ClntParsGlobalOpt.h \
           ClntCfgMgr/ClntParsIAOpt.h \
           ClntCfgMgr/ClntParsIfaceOpt.h \
           ClntIfaceMgr/ClntIfaceIface.h \
           ClntIfaceMgr/ClntIfaceMgr.h \
           ClntMessages/ClntMsg.h \
           ClntMessages/ClntMsgAdvertise.h \
           ClntMessages/ClntMsgConfirm.h \
           ClntMessages/ClntMsgDecline.h \
           ClntMessages/ClntMsgInfRequest.h \
           ClntMessages/ClntMsgRebind.h \
           ClntMessages/ClntMsgRelease.h \
           ClntMessages/ClntMsgRenew.h \
           ClntMessages/ClntMsgReply.h \
           ClntMessages/ClntMsgRequest.h \
           ClntMessages/ClntMsgSolicit.h \
           ClntOptions/ClntOptAAAAuthentication.h \
           ClntOptions/ClntOptAddrParams.h \
           ClntOptions/ClntOptAuthentication.h \
           ClntOptions/ClntOptElapsed.h \
           ClntOptions/ClntOptFQDN.h \
           ClntOptions/ClntOptIA_NA.h \
           ClntOptions/ClntOptIA_PD.h \
           ClntOptions/ClntOptIAAddress.h \
           ClntOptions/ClntOptIAPrefix.h \
           ClntOptions/ClntOptKeyGeneration.h \
           ClntOptions/ClntOptLifetime.h \
           ClntOptions/ClntOptOptionRequest.h \
           ClntOptions/ClntOptPreference.h \
           ClntOptions/ClntOptStatusCode.h \
           ClntOptions/ClntOptTA.h \
           ClntOptions/ClntOptTimeZone.h \
           ClntOptions/ClntOptUserClass.h \
           ClntOptions/ClntOptVendorClass.h \
           ClntOptions/ClntOptVendorSpec.h \
           ClntTransMgr/ClntTransMgr.h \
           IfaceMgr/DNSUpdate.h \
           IfaceMgr/Iface.h \
           IfaceMgr/IfaceMgr.h \
           IfaceMgr/SocketIPv6.h \
           include/dibbler-config.h \
           Messages/Msg.h \
           Misc/base64.h \
           Misc/Container.h \
           Misc/DHCPClient.h \
           Misc/DHCPConst.h \
           Misc/DHCPDefaults.h \
           Misc/DHCPRelay.h \
           Misc/DHCPServer.h \
           Misc/DUID.h \
           Misc/FQDN.h \
           Misc/hmac.h \
           Misc/IPv6Addr.h \
           Misc/KeyList.h \
           Misc/Logger.h \
           Misc/long128.h \
           Misc/md5.h \
           Misc/Portable.h \
           Misc/ScriptParams.h \
           Misc/sha1.h \
           Misc/sha256.h \
           Misc/sha512.h \
           Misc/SmartPtr.h \
           Misc/SrvCommon.h \
           Options/Opt.h \
           Options/OptAAAAuthentication.h \
           Options/OptAddr.h \
           Options/OptAddrLst.h \
           Options/OptAuthentication.h \
           Options/OptDomainLst.h \
           Options/OptDUID.h \
           Options/OptEmpty.h \
           Options/OptFQDN.h \
           Options/OptGeneric.h \
           Options/OptIA_NA.h \
           Options/OptIA_PD.h \
           Options/OptIAAddress.h \
           Options/OptIAPrefix.h \
           Options/OptInteger.h \
           Options/OptKeyGeneration.h \
           Options/OptOptionRequest.h \
           Options/OptRtPrefix.h \
           Options/OptStatusCode.h \
           Options/OptString.h \
           Options/OptTA.h \
           Options/OptUserClass.h \
           Options/OptVendorData.h \
           Options/OptVendorSpecInfo.h \
           Port-bsd/daemon.h \
           Port-bsd/malloc.h \
           Port-linux/daemon.h \
           Port-linux/ethtool-kernel.h \
           Port-linux/ethtool-local.h \
           Port-linux/interface.h \
           Port-linux/ip_common.h \
           Port-linux/libnetlink.h \
           Port-linux/ll_map.h \
           Port-linux/rt_names.h \
           Port-linux/rtm_map.h \
           Port-linux/utils.h \
           Port-win32/ClntService.h \
           Port-win32/config.h \
           Port-win32/dibbler-config.h \
           Port-win32/RelService.h \
           Port-win32/resource-requestor.h \
           Port-win32/resource.h \
           Port-win32/resource1.h \
           Port-win32/resource2.h \
           Port-win32/resource8.h \
           Port-win32/SrvService.h \
           Port-win32/stdint.h \
           Port-win32/unistd.h \
           Port-win32/WinService.h \
           Port-winnt2k/ClntService.h \
           Port-winnt2k/config.h \
           Port-winnt2k/RelService.h \
           Port-winnt2k/SrvService.h \
           Port-winnt2k/tpipv6.h \
           Port-winnt2k/WinService.h \
           Port-winnt2k/wspiapi.h \
           poslib/bits.h \
           poslib/dnsdefs.h \
           poslib/dnsmessage.h \
           poslib/domainfn.h \
           poslib/exception.h \
           poslib/lexfn.h \
           poslib/masterfile.h \
           poslib/poslib.h \
           poslib/postime.h \
           poslib/random.h \
           poslib/resolver.h \
           poslib/rr.h \
           poslib/socket.h \
           poslib/syssocket.h \
           poslib/sysstl.h \
           poslib/sysstring.h \
           poslib/types.h \
           poslib/vsnprintf.h \
           poslib/w32poll.h \
           RelCfgMgr/RelCfgIface.h \
           RelCfgMgr/RelCfgMgr.h \
           RelCfgMgr/RelLexer.h \
           RelCfgMgr/RelParser.h \
           RelCfgMgr/RelParsGlobalOpt.h \
           RelCfgMgr/RelParsIfaceOpt.h \
           RelIfaceMgr/RelIfaceMgr.h \
           RelMessages/RelMsg.h \
           RelMessages/RelMsgGeneric.h \
           RelMessages/RelMsgRelayForw.h \
           RelMessages/RelMsgRelayRepl.h \
           RelOptions/RelOptEcho.h \
           RelOptions/RelOptGeneric.h \
           RelOptions/RelOptInterfaceID.h \
           RelOptions/RelOptRelayMsg.h \
           RelOptions/RelOptRemoteID.h \
           RelTransMgr/RelTransMgr.h \
           Requestor/ReqCfgMgr.h \
           Requestor/ReqMsg.h \
           Requestor/ReqOpt.h \
           Requestor/ReqTransMgr.h \
           Requestor/Requestor.h \
           SrvAddrMgr/SrvAddrMgr.h \
           SrvCfgMgr/Node.h \
           SrvCfgMgr/NodeClientSpecific.h \
           SrvCfgMgr/NodeConstant.h \
           SrvCfgMgr/NodeOperator.h \
           SrvCfgMgr/SrvCfgAddrClass.h \
           SrvCfgMgr/SrvCfgClientClass.h \
           SrvCfgMgr/SrvCfgIface.h \
           SrvCfgMgr/SrvCfgMgr.h \
           SrvCfgMgr/SrvCfgOptions.h \
           SrvCfgMgr/SrvCfgPD.h \
           SrvCfgMgr/SrvCfgTA.h \
           SrvCfgMgr/SrvParsClassOpt.h \
           SrvCfgMgr/SrvParser.h \
           SrvCfgMgr/SrvParsGlobalOpt.h \
           SrvCfgMgr/SrvParsIfaceOpt.h \
           SrvIfaceMgr/SrvIfaceIface.h \
           SrvIfaceMgr/SrvIfaceMgr.h \
           SrvMessages/SrvMsg.h \
           SrvMessages/SrvMsgAdvertise.h \
           SrvMessages/SrvMsgConfirm.h \
           SrvMessages/SrvMsgDecline.h \
           SrvMessages/SrvMsgInfRequest.h \
           SrvMessages/SrvMsgLeaseQuery.h \
           SrvMessages/SrvMsgLeaseQueryData.h \
           SrvMessages/SrvMsgLeaseQueryDone.h \
           SrvMessages/SrvMsgLeaseQueryReply.h \
           SrvMessages/SrvMsgRebind.h \
           SrvMessages/SrvMsgRelease.h \
           SrvMessages/SrvMsgRenew.h \
           SrvMessages/SrvMsgReply.h \
           SrvMessages/SrvMsgRequest.h \
           SrvMessages/SrvMsgSolicit.h \
           SrvOptions/SrvOptAAAAuthentication.h \
           SrvOptions/SrvOptAddrParams.h \
           SrvOptions/SrvOptAuthentication.h \
           SrvOptions/SrvOptFQDN.h \
           SrvOptions/SrvOptIA_NA.h \
           SrvOptions/SrvOptIA_PD.h \
           SrvOptions/SrvOptIAAddress.h \
           SrvOptions/SrvOptIAPrefix.h \
           SrvOptions/SrvOptInterfaceID.h \
           SrvOptions/SrvOptKeyGeneration.h \
           SrvOptions/SrvOptLQ.h \
           SrvOptions/SrvOptTA.h \
           SrvTransMgr/SrvTransMgr.h \
           bison++/Example/FlexLexer.h \
           tests/Srv/assign_utils.h
LEXSOURCES += ClntCfgMgr/ClntLexer.l \
              RelCfgMgr/RelLexer.l \
              SrvCfgMgr/SrvLexer.l \
              bison++/Example/MyScanner.l
YACCSOURCES += ClntCfgMgr/ClntParser.y \
               RelCfgMgr/RelParser.y \
               SrvCfgMgr/SrvParser.y \
               bison++/Example/MyParser.y
SOURCES += AddrMgr/AddrAddr.cpp \
           AddrMgr/AddrClient.cpp \
           AddrMgr/AddrIA.cpp \
           AddrMgr/AddrMgr.cpp \
           AddrMgr/AddrPrefix.cpp \
           bison++/alloca.c \
           bison++/allocate.cc \
           bison++/bison.cc \
           bison++/closure.cc \
           bison++/conflict.cc \
           bison++/derives.cc \
           bison++/files.cc \
           bison++/getargs.cc \
           bison++/getopt.cc \
           bison++/getopt1.cc \
           bison++/gram.cc \
           bison++/lalr.cc \
           bison++/lex.cc \
           bison++/lr0.cc \
           bison++/main.cc \
           bison++/nullable.cc \
           bison++/old.c \
           bison++/output.cc \
           bison++/print.cc \
           bison++/reader.cc \
           bison++/reduce.cc \
           bison++/symtab.cc \
           bison++/version.cc \
           bison++/vmsgetargs.c \
           bison++/warshall.cc \
           CfgMgr/CfgMgr.cpp \
           CfgMgr/HostID.cpp \
           CfgMgr/HostRange.cpp \
           CfgMgr/TimeZone.cpp \
           ClntAddrMgr/ClntAddrMgr.cpp \
           ClntCfgMgr/ClntCfgAddr.cpp \
           ClntCfgMgr/ClntCfgIA.cpp \
           ClntCfgMgr/ClntCfgIface.cpp \
           ClntCfgMgr/ClntCfgMgr.cpp \
           ClntCfgMgr/ClntCfgPD.cpp \
           ClntCfgMgr/ClntCfgPrefix.cpp \
           ClntCfgMgr/ClntCfgTA.cpp \
           ClntCfgMgr/ClntLexer.cpp \
           ClntCfgMgr/ClntParsAddrOpt.cpp \
           ClntCfgMgr/ClntParser.cpp \
           ClntCfgMgr/ClntParsGlobalOpt.cpp \
           ClntCfgMgr/ClntParsIAOpt.cpp \
           ClntCfgMgr/ClntParsIfaceOpt.cpp \
           ClntIfaceMgr/ClntIfaceIface.cpp \
           ClntIfaceMgr/ClntIfaceMgr.cpp \
           ClntMessages/ClntMsg.cpp \
           ClntMessages/ClntMsgAdvertise.cpp \
           ClntMessages/ClntMsgConfirm.cpp \
           ClntMessages/ClntMsgDecline.cpp \
           ClntMessages/ClntMsgInfRequest.cpp \
           ClntMessages/ClntMsgRebind.cpp \
           ClntMessages/ClntMsgRelease.cpp \
           ClntMessages/ClntMsgRenew.cpp \
           ClntMessages/ClntMsgReply.cpp \
           ClntMessages/ClntMsgRequest.cpp \
           ClntMessages/ClntMsgSolicit.cpp \
           ClntOptions/ClntOptAAAAuthentication.cpp \
           ClntOptions/ClntOptAddrParams.cpp \
           ClntOptions/ClntOptAuthentication.cpp \
           ClntOptions/ClntOptElapsed.cpp \
           ClntOptions/ClntOptFQDN.cpp \
           ClntOptions/ClntOptIA_NA.cpp \
           ClntOptions/ClntOptIA_PD.cpp \
           ClntOptions/ClntOptIAAddress.cpp \
           ClntOptions/ClntOptIAPrefix.cpp \
           ClntOptions/ClntOptKeyGeneration.cpp \
           ClntOptions/ClntOptLifetime.cpp \
           ClntOptions/ClntOptOptionRequest.cpp \
           ClntOptions/ClntOptPreference.cpp \
           ClntOptions/ClntOptStatusCode.cpp \
           ClntOptions/ClntOptTA.cpp \
           ClntOptions/ClntOptTimeZone.cpp \
           ClntOptions/ClntOptUserClass.cpp \
           ClntOptions/ClntOptVendorClass.cpp \
           ClntOptions/ClntOptVendorSpec.cpp \
           ClntTransMgr/ClntTransMgr.cpp \
           IfaceMgr/DNSUpdate.cpp \
           IfaceMgr/Iface.cpp \
           IfaceMgr/IfaceMgr.cpp \
           IfaceMgr/SocketIPv6.cpp \
           Messages/Msg.cpp \
           Misc/addrpack.c \
           Misc/base64.c \
           Misc/DHCPClient.cpp \
           Misc/DHCPConst.cpp \
           Misc/DHCPRelay.cpp \
           Misc/DHCPServer.cpp \
           Misc/DUID.cpp \
           Misc/FQDN.cpp \
           Misc/hmac-sha-md5.c \
           Misc/IPv6Addr.cpp \
           Misc/KeyList.cpp \
           Misc/Logger.cpp \
           Misc/long128.cpp \
           Misc/lowlevel-posix.c \
           Misc/md5.c \
           Misc/ScriptParams.cpp \
           Misc/sha1.c \
           Misc/sha256.c \
           Misc/sha512.c \
           Options/Opt.cpp \
           Options/OptAAAAuthentication.cpp \
           Options/OptAddr.cpp \
           Options/OptAddrLst.cpp \
           Options/OptAuthentication.cpp \
           Options/OptDomainLst.cpp \
           Options/OptDUID.cpp \
           Options/OptEmpty.cpp \
           Options/OptFQDN.cpp \
           Options/OptGeneric.cpp \
           Options/OptIA_NA.cpp \
           Options/OptIA_PD.cpp \
           Options/OptIAAddress.cpp \
           Options/OptIAPrefix.cpp \
           Options/OptInteger.cpp \
           Options/OptKeyGeneration.cpp \
           Options/OptOptionRequest.cpp \
           Options/OptRtPrefix.cpp \
           Options/OptStatusCode.cpp \
           Options/OptString.cpp \
           Options/OptTA.cpp \
           Options/OptUserClass.cpp \
           Options/OptVendorData.cpp \
           Options/OptVendorSpecInfo.cpp \
           Port-bsd/daemon.cpp \
           Port-bsd/dibbler-client.cpp \
           Port-bsd/dibbler-relay.cpp \
           Port-bsd/dibbler-server.cpp \
           Port-bsd/lowlevel-bsd.c \
           Port-bsd/lowlevel-options-bsd.c \
           Port-linux/daemon.cpp \
           Port-linux/dibbler-client.cpp \
           Port-linux/dibbler-relay.cpp \
           Port-linux/dibbler-server.cpp \
           Port-linux/interface.c \
           Port-linux/iproute.c \
           Port-linux/libnetlink.c \
           Port-linux/ll_map.c \
           Port-linux/ll_types.c \
           Port-linux/lowlevel-linux-link-state.c \
           Port-linux/lowlevel-linux.c \
           Port-linux/lowlevel-options-linux.c \
           Port-linux/utils.c \
           Port-win32/addrpack.c \
           Port-win32/client-win32.cpp \
           Port-win32/ClntService.cpp \
           Port-win32/ipv6-wrapper.c \
           Port-win32/lowlevel-win32.c \
           Port-win32/relay-win32.cpp \
           Port-win32/RelService.cpp \
           Port-win32/server-win32.cpp \
           Port-win32/SrvService.cpp \
           Port-win32/WinService.cpp \
           Port-winnt2k/client-winnt2k.cpp \
           Port-winnt2k/ClntService.cpp \
           Port-winnt2k/lowlevel-winnt2k.c \
           Port-winnt2k/relay-winnt2k.cpp \
           Port-winnt2k/RelService.cpp \
           Port-winnt2k/server-winnt2k.cpp \
           Port-winnt2k/SrvService.cpp \
           Port-winnt2k/WinService.cpp \
           poslib/dnsmessage.cpp \
           poslib/domainfn.cpp \
           poslib/exception.cpp \
           poslib/lexfn.cpp \
           poslib/masterfile.cpp \
           poslib/postime.cpp \
           poslib/random.cpp \
           poslib/resolver.cpp \
           poslib/rr.cpp \
           poslib/socket.cpp \
           poslib/vsnprintf.cpp \
           poslib/w32poll.cpp \
           RelCfgMgr/RelCfgIface.cpp \
           RelCfgMgr/RelCfgMgr.cpp \
           RelCfgMgr/RelLexer.cpp \
           RelCfgMgr/RelParser.cpp \
           RelCfgMgr/RelParsGlobalOpt.cpp \
           RelCfgMgr/RelParsIfaceOpt.cpp \
           RelIfaceMgr/RelIfaceMgr.cpp \
           RelMessages/RelMsg.cpp \
           RelMessages/RelMsgGeneric.cpp \
           RelMessages/RelMsgRelayForw.cpp \
           RelMessages/RelMsgRelayRepl.cpp \
           RelOptions/RelOptEcho.cpp \
           RelOptions/RelOptGeneric.cpp \
           RelOptions/RelOptInterfaceID.cpp \
           RelOptions/RelOptRelayMsg.cpp \
           RelOptions/RelOptRemoteID.cpp \
           RelTransMgr/RelTransMgr.cpp \
           Requestor/ReqCfgMgr.cpp \
           Requestor/ReqMsg.cpp \
           Requestor/ReqOpt.cpp \
           Requestor/ReqTransMgr.cpp \
           Requestor/Requestor.cpp \
           SrvAddrMgr/SrvAddrMgr.cpp \
           SrvCfgMgr/Node.cpp \
           SrvCfgMgr/NodeClientSpecific.cpp \
           SrvCfgMgr/NodeConstant.cpp \
           SrvCfgMgr/NodeOperator.cpp \
           SrvCfgMgr/SrvCfgAddrClass.cpp \
           SrvCfgMgr/SrvCfgClientClass.cpp \
           SrvCfgMgr/SrvCfgIface.cpp \
           SrvCfgMgr/SrvCfgMgr.cpp \
           SrvCfgMgr/SrvCfgOptions.cpp \
           SrvCfgMgr/SrvCfgPD.cpp \
           SrvCfgMgr/SrvCfgTA.cpp \
           SrvCfgMgr/SrvLexer.cpp \
           SrvCfgMgr/SrvParsClassOpt.cpp \
           SrvCfgMgr/SrvParser.cpp \
           SrvCfgMgr/SrvParsGlobalOpt.cpp \
           SrvCfgMgr/SrvParsIfaceOpt.cpp \
           SrvIfaceMgr/SrvIfaceIface.cpp \
           SrvIfaceMgr/SrvIfaceMgr.cpp \
           SrvMessages/SrvMsg.cpp \
           SrvMessages/SrvMsgAdvertise.cpp \
           SrvMessages/SrvMsgConfirm.cpp \
           SrvMessages/SrvMsgDecline.cpp \
           SrvMessages/SrvMsgInfRequest.cpp \
           SrvMessages/SrvMsgLeaseQuery.cpp \
           SrvMessages/SrvMsgLeaseQueryData.cpp \
           SrvMessages/SrvMsgLeaseQueryDone.cpp \
           SrvMessages/SrvMsgLeaseQueryReply.cpp \
           SrvMessages/SrvMsgRebind.cpp \
           SrvMessages/SrvMsgRelease.cpp \
           SrvMessages/SrvMsgRenew.cpp \
           SrvMessages/SrvMsgReply.cpp \
           SrvMessages/SrvMsgRequest.cpp \
           SrvMessages/SrvMsgSolicit.cpp \
           SrvOptions/SrvOptAAAAuthentication.cpp \
           SrvOptions/SrvOptAddrParams.cpp \
           SrvOptions/SrvOptAuthentication.cpp \
           SrvOptions/SrvOptFQDN.cpp \
           SrvOptions/SrvOptIA_NA.cpp \
           SrvOptions/SrvOptIA_PD.cpp \
           SrvOptions/SrvOptIAAddress.cpp \
           SrvOptions/SrvOptIAPrefix.cpp \
           SrvOptions/SrvOptInterfaceID.cpp \
           SrvOptions/SrvOptKeyGeneration.cpp \
           SrvOptions/SrvOptLQ.cpp \
           SrvOptions/SrvOptTA.cpp \
           SrvTransMgr/SrvTransMgr.cpp \
           tests/packet-dhcpv6.c \
           AddrMgr/tests/AddrAddr_unittest.cc \
           AddrMgr/tests/AddrClient_unittest.cc \
           AddrMgr/tests/AddrIA_unittest.cc \
           AddrMgr/tests/AddrMgr_unittest.cc \
           AddrMgr/tests/AddrPrefix_unittest.cc \
           AddrMgr/tests/run_tests.cpp \
           bison++/Example/MyCompiler.cc \
           CfgMgr/tests/HostID_unittest.cc \
           CfgMgr/tests/HostRange_unittest.cc \
           CfgMgr/tests/run_tests.cc \
           Options/tests/Opt_unittest.cc \
           Options/tests/OptAddr_unittest.cc \
           Options/tests/OptIAAddress_unittest.cc \
           Options/tests/OptRtPrefix_unittest.cc \
           Options/tests/run_tests.cpp \
           SrvCfgMgr/tests/run_tests.cpp \
           SrvCfgMgr/tests/SrvCfgMgr_unittest.cc \
           tests/crypto/Digests.cpp \
           tests/DnsUpdate/DnsUpdate01.cpp \
           tests/DnsUpdate/DnsUpdate02.cpp \
           tests/Logger/basic01.cpp \
           tests/LowLevel/test1.cpp \
           tests/Srv/assign_addr_unittest.cc \
           tests/Srv/assign_prefix_unittest.cc \
           tests/Srv/assign_utils.cc \
           tests/Srv/options_unittest.cc \
           tests/Srv/run_tests.cpp