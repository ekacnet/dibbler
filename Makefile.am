dist_noinst_DATA = 
noinst_PROGRAMS = 
noinst_LIBRARIES = 
TESTS = 
noinst_LIBRARIES += libAddrMgr.a
libAddrMgr_a_SOURCES  = AddrMgr/AddrAddr.cpp
libAddrMgr_a_SOURCES += AddrMgr/AddrAddr.h
libAddrMgr_a_SOURCES += AddrMgr/AddrClient.cpp
libAddrMgr_a_SOURCES += AddrMgr/AddrClient.h
libAddrMgr_a_SOURCES += AddrMgr/AddrIA.cpp
libAddrMgr_a_SOURCES += AddrMgr/AddrIA.h
libAddrMgr_a_SOURCES += AddrMgr/AddrMgr.cpp
libAddrMgr_a_SOURCES += AddrMgr/AddrMgr.h
libAddrMgr_a_SOURCES += AddrMgr/AddrPrefix.cpp
libAddrMgr_a_SOURCES += AddrMgr/AddrPrefix.h

if HAVE_GTEST
# Darwin quirks:
# dyld can't find proper lib if make instal was not done for gtest

# Original content of GTEST_ADD (retrned by: gtest-config --libs)
#GTEST_LDADD = /Users/thomson/devel/gtest-1.6.0/lib/libgtest.la

# Library that would do the trick
#GTEST_LDADD = /Users/thomson/devel/gtest-1.6.0/lib/.libs/libgtest.a

# At runtime this could be solved with:
#export DYLD_LIBRARY_PATH=/Users/thomson/devel/gtest-1.6.0/lib/.libs/

TESTS += AddrMgr_tests

# This is to workaround long long in gtest.h
AddrMgr_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
AddrMgr_tests_SOURCES  = tests/Srv/run_tests.cpp
AddrMgr_tests_SOURCES += AddrMgr/tests/AddrAddr_unittest.cc
AddrMgr_tests_SOURCES += AddrMgr/tests/AddrPrefix_unittest.cc
AddrMgr_tests_SOURCES += AddrMgr/tests/AddrIA_unittest.cc
AddrMgr_tests_SOURCES += AddrMgr/tests/AddrClient_unittest.cc
AddrMgr_tests_SOURCES += AddrMgr/tests/AddrMgr_unittest.cc

AddrMgr_tests_LDADD = $(GTEST_LDADD)
AddrMgr_tests_LDADD += libAddrMgr.a
AddrMgr_tests_LDADD += libMisc.a
AddrMgr_tests_LDADD += libLowLevel.a

dist_noinst_DATA += server-AddrMgr-0.8.3.xml
dist_noinst_DATA += server-AddrMgr-bogus-ifacenames.xml
dist_noinst_DATA += server-AddrMgr-empty-ifacenames.xml
dist_noinst_DATA += server-AddrMgr-old-ifindex.xml
endif

noinst_LIBRARIES += libCfgMgr.a
libCfgMgr_a_SOURCES  = CfgMgr/CfgMgr.cpp
libCfgMgr_a_SOURCES += CfgMgr/CfgMgr.h
libCfgMgr_a_SOURCES += bison++/FlexLexer.h
libCfgMgr_a_SOURCES += CfgMgr/HostID.cpp
libCfgMgr_a_SOURCES += CfgMgr/HostID.h
libCfgMgr_a_SOURCES += CfgMgr/HostRange.cpp
libCfgMgr_a_SOURCES += CfgMgr/HostRange.h

if HAVE_GTEST
TESTS += CfgMgr_tests
# This is to workaround long long in gtest.h
CfgMgr_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros

CfgMgr_tests_SOURCES  = tests/Clnt/run_tests.cc
CfgMgr_tests_SOURCES += CfgMgr/tests/HostID_unittest.cc
CfgMgr_tests_SOURCES += CfgMgr/tests/HostRange_unittest.cc

CfgMgr_tests_LDFLAGS = $(GTEST_LDFLAGS) -pthread

CfgMgr_tests_LDADD = $(GTEST_LDADD)
CfgMgr_tests_LDADD += libCfgMgr.a
CfgMgr_tests_LDADD += libMisc.a
endif

noinst_LIBRARIES += libClntAddrMgr.a
libClntAddrMgr_a_SOURCES  = ClntAddrMgr/ClntAddrMgr.cpp
libClntAddrMgr_a_SOURCES += ClntAddrMgr/ClntAddrMgr.h

noinst_PROGRAMS += bison++/bison++$(EXEEXT)
bison++/bison++$(EXEEXT):
	@echo "[CONFIG ] /bison++/"
	cd bison++; ./configure --host=$(CHOST) --build=$(CBUILD) >configure.log
	@echo "[MAKE   ] /bison++/bison++"
	$(MAKE) -C bison++

nodist_libClntCfgMgr_a_SOURCES = ClntCfgMgr/ClntParser.cpp ClntCfgMgr/ClntLexer.cpp
dist_noinst_DATA += ClntCfgMgr/ClntLexer.l ClntCfgMgr/ClntParser.y
ClntCfgMgr/ClntParser.cpp: ClntCfgMgr/ClntParser.y bison++/bison++$(EXEEXT)
	@echo "[BISON++] ClntCfgMgr/ClntParser.y"
	./bison++/bison++$(EXEEXT) --skeleton=bison++/bison.cc --headerskeleton=bison++/bison.h -v --debug --defines -d ClntCfgMgr/ClntParser.y -o ClntCfgMgr/ClntParser.cpp

ClntCfgMgr/ClntLexer.cpp: ClntCfgMgr/ClntLexer.l
	@echo "[FLEX   ] ClntCfgMgr/ClntLexer.l"
	flex -+ -i -L -oClntCfgMgr/ClntLexer.cpp  ClntCfgMgr/ClntLexer.l
	@echo "[SED    ] ClntCfgMgr/ClntLexer.cpp"
	cat ClntCfgMgr/ClntLexer.cpp | sed 's/extern "C" int isatty (int );/\/\/extern "C" int isatty (int ) throw ();/' > ClntCfgMgr/ClntLexer.cpp2
	rm -f ClntCfgMgr/ClntLexer.cpp
	mv ClntCfgMgr/ClntLexer.cpp2 ClntCfgMgr/ClntLexer.cpp

noinst_LIBRARIES += libClntCfgMgr.a
libClntCfgMgr_a_SOURCES  = ClntCfgMgr/ClntCfgAddr.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgAddr.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgIA.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgIA.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgIface.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgIface.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgMgr.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgMgr.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgPD.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgPD.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgPrefix.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgPrefix.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgTA.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntCfgTA.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntLexer.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsAddrOpt.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsAddrOpt.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParser.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParser.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsGlobalOpt.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsGlobalOpt.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsIAOpt.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsIAOpt.h
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsIfaceOpt.cpp
libClntCfgMgr_a_SOURCES += ClntCfgMgr/ClntParsIfaceOpt.h

noinst_LIBRARIES += libClntIfaceMgr.a
libClntIfaceMgr_a_SOURCES  = ClntIfaceMgr/ClntIfaceIface.cpp
libClntIfaceMgr_a_SOURCES += ClntIfaceMgr/ClntIfaceIface.h
libClntIfaceMgr_a_SOURCES += ClntIfaceMgr/ClntIfaceMgr.cpp
libClntIfaceMgr_a_SOURCES += ClntIfaceMgr/ClntIfaceMgr.h

noinst_LIBRARIES += libClntMessages.a
libClntMessages_a_SOURCES  = ClntMessages/ClntMsgAdvertise.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgAdvertise.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgConfirm.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgConfirm.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsg.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgDecline.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgDecline.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsg.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgInfRequest.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgInfRequest.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRebind.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRebind.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRelease.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRelease.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRenew.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRenew.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgReply.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgReply.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRequest.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgRequest.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgSolicit.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgSolicit.h
libClntMessages_a_SOURCES += ClntMessages/ClntMsgReconfigure.cpp
libClntMessages_a_SOURCES += ClntMessages/ClntMsgReconfigure.h

noinst_LIBRARIES += libClntOptions.a
libClntOptions_a_SOURCES  = ClntOptions/ClntOptElapsed.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptElapsed.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptFQDN.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptFQDN.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptIA_NA.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptIA_NA.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptIA_PD.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptIA_PD.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptLifetime.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptLifetime.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptPreference.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptPreference.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptTA.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptTA.h
libClntOptions_a_SOURCES += ClntOptions/ClntOptTimeZone.cpp
libClntOptions_a_SOURCES += ClntOptions/ClntOptTimeZone.h

noinst_LIBRARIES += libClntTransMgr.a
libClntTransMgr_a_SOURCES  = ClntTransMgr/ClntTransMgr.cpp
libClntTransMgr_a_SOURCES += ClntTransMgr/ClntTransMgr.h


noinst_LIBRARIES += libIfaceMgr.a
libIfaceMgr_a_SOURCES  = IfaceMgr/DNSUpdate.cpp
libIfaceMgr_a_SOURCES += IfaceMgr/DNSUpdate.h
libIfaceMgr_a_SOURCES += IfaceMgr/Iface.cpp
libIfaceMgr_a_SOURCES += IfaceMgr/Iface.h
libIfaceMgr_a_SOURCES += IfaceMgr/IfaceMgr.cpp
libIfaceMgr_a_SOURCES += IfaceMgr/IfaceMgr.h
libIfaceMgr_a_SOURCES += IfaceMgr/SocketIPv6.cpp
libIfaceMgr_a_SOURCES += IfaceMgr/SocketIPv6.h

if HAVE_GTEST
# This is to workaround long long in gtest.h
DnsUpdate_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
TESTS += DnsUpdate_tests
DnsUpdate_tests_SOURCES  = tests/Clnt/run_tests.cc
DnsUpdate_tests_SOURCES += IfaceMgr/tests/DnsUpdate_unittest.cc
endif


noinst_LIBRARIES += libMessages.a
libMessages_a_SOURCES  = Messages/Msg.cpp
libMessages_a_SOURCES += Messages/Msg.h

if WIN32
dist_noinst_DATA += addrpack.c client-win32.cpp ClntService.cpp ClntService.h dibbler-config.h
dist_noinst_DATA += client-win32.vs2013.rc client-win32.vs2013.vcxproj client-win32.vs2013.vcxproj.filters
dist_noinst_DATA += dibbler-requestor.rc lowlevel-win32.c relay-win32.cpp stdbool.h
dist_noinst_DATA += relay-win32.vs2013.rc relay-win32.vs2013.vcxproj relay-win32.vs2013.vcxproj.filters
dist_noinst_DATA += RelService.cpp RelService.h
dist_noinst_DATA += requestor-win32.vs2013.vcxproj requestor-win32.vs2013.vcxproj.filters
dist_noinst_DATA += resource1.h resource2.h resource8.h resource.h
dist_noinst_DATA += resource-requestor.h server-win32.cpp
dist_noinst_DATA += server-win32.vs2013.rc server-win32.vs2013.vcxproj server-win32.vs2013.vcxproj.filters
dist_noinst_DATA += SrvService.cpp SrvService.h unistd.h WinService.cpp WinService.h
dist_noinst_DATA += client.log client-win32.ico dibbler32.iss dibbler64.iss dibbler-win32.vs2017.sln relay.log
dist_noinst_DATA += relay-win32.ico server.log server-win32.ico
endif

noinst_LIBRARIES += libMisc.a
libMisc_a_CFLAGS = -std=c99

libMisc_a_SOURCES  = Misc/addrpack.c
libMisc_a_SOURCES += Misc/base64.c
libMisc_a_SOURCES += Misc/base64.h
libMisc_a_SOURCES += Misc/SmartPtr.h
libMisc_a_SOURCES += Misc/Container.h
libMisc_a_SOURCES += Misc/hex.cpp
libMisc_a_SOURCES += Misc/hex.h
libMisc_a_SOURCES += Misc/DHCPConst.cpp
libMisc_a_SOURCES += Misc/DHCPConst.h
libMisc_a_SOURCES += Misc/DHCPDefaults.h
libMisc_a_SOURCES += Misc/DUID.cpp
libMisc_a_SOURCES += Misc/DUID.h
libMisc_a_SOURCES += Misc/FQDN.cpp
libMisc_a_SOURCES += Misc/FQDN.h
libMisc_a_SOURCES += Misc/IPv6Addr.cpp
libMisc_a_SOURCES += Misc/IPv6Addr.h
libMisc_a_SOURCES += Misc/KeyList.cpp
libMisc_a_SOURCES += Misc/KeyList.h
libMisc_a_SOURCES += Misc/Key.cpp
libMisc_a_SOURCES += Misc/Key.h
libMisc_a_SOURCES += Misc/Logger.cpp
libMisc_a_SOURCES += Misc/Logger.h
libMisc_a_SOURCES += Misc/long128.cpp
libMisc_a_SOURCES += Misc/long128.h
libMisc_a_SOURCES += Misc/Portable.h
libMisc_a_SOURCES += Misc/ScriptParams.cpp
libMisc_a_SOURCES += Misc/ScriptParams.h
libMisc_a_SOURCES += Misc/lowlevel-posix.c
libMisc_a_SOURCES += Misc/hmac-sha-md5.h
libMisc_a_SOURCES += Misc/hmac-sha-md5.c
libMisc_a_SOURCES += Misc/md5-coreutils.c
libMisc_a_SOURCES += Misc/md5.h
libMisc_a_SOURCES += Misc/sha1.c
libMisc_a_SOURCES += Misc/sha1.h
libMisc_a_SOURCES += Misc/sha256.c
libMisc_a_SOURCES += Misc/sha256.h
libMisc_a_SOURCES += Misc/sha512.c
libMisc_a_SOURCES += Misc/sha512.h


if HAVE_GTEST
# This is to workaround long long in gtest.h
Misc_tests_CPPFLAGS  = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
TESTS += Misc_tests


Misc_tests_LDFLAGS = $(GTEST_LDFLAGS) -pthread

Misc_tests_LDADD = $(GTEST_LDADD)
Misc_tests_LDADD += libMisc.a

Misc_tests_SOURCES  = tests/Clnt/run_tests.cc
Misc_tests_SOURCES += Misc/tests/IPv6Addr_unittest.cc
Misc_tests_SOURCES += Misc/tests/DUID_unittest.cc
Misc_tests_SOURCES += Misc/tests/SPtr_unittest.cc
Misc_tests_SOURCES += Misc/tests/Container_unittest.cc
endif


noinst_LIBRARIES += libOptions.a
libOptions_a_SOURCES  = Options/OptAddr.cpp
libOptions_a_SOURCES += Options/OptAddr.h
libOptions_a_SOURCES += Options/OptAddrLst.cpp
libOptions_a_SOURCES += Options/OptAddrLst.h
libOptions_a_SOURCES += Options/OptAddrParams.cpp
libOptions_a_SOURCES += Options/OptAddrParams.h
libOptions_a_SOURCES += Options/OptAuthentication.cpp
libOptions_a_SOURCES += Options/OptAuthentication.h
libOptions_a_SOURCES += Options/Opt.cpp
libOptions_a_SOURCES += Options/Opt.h
libOptions_a_SOURCES += Options/OptDUID.cpp
libOptions_a_SOURCES += Options/OptDUID.h
libOptions_a_SOURCES += Options/OptEmpty.cpp
libOptions_a_SOURCES += Options/OptEmpty.h
libOptions_a_SOURCES += Options/OptFQDN.cpp
libOptions_a_SOURCES += Options/OptFQDN.h
libOptions_a_SOURCES += Options/OptGeneric.cpp
libOptions_a_SOURCES += Options/OptGeneric.h
libOptions_a_SOURCES += Options/OptIAAddress.cpp
libOptions_a_SOURCES += Options/OptIAAddress.h
libOptions_a_SOURCES += Options/OptIA.cpp
libOptions_a_SOURCES += Options/OptIA.h
libOptions_a_SOURCES += Options/OptIA_NA.cpp
libOptions_a_SOURCES += Options/OptIA_NA.h
libOptions_a_SOURCES += Options/OptIA_PD.cpp
libOptions_a_SOURCES += Options/OptIA_PD.h
libOptions_a_SOURCES += Options/OptIAPrefix.cpp
libOptions_a_SOURCES += Options/OptIAPrefix.h
libOptions_a_SOURCES += Options/OptInteger.cpp
libOptions_a_SOURCES += Options/OptInteger.h
libOptions_a_SOURCES += Options/OptOptionRequest.cpp
libOptions_a_SOURCES += Options/OptOptionRequest.h
libOptions_a_SOURCES += Options/OptStatusCode.cpp
libOptions_a_SOURCES += Options/OptStatusCode.h
libOptions_a_SOURCES += Options/OptString.cpp
libOptions_a_SOURCES += Options/OptString.h
libOptions_a_SOURCES += Options/OptDomainLst.cpp
libOptions_a_SOURCES += Options/OptDomainLst.h
libOptions_a_SOURCES += Options/OptTA.cpp
libOptions_a_SOURCES += Options/OptTA.h
libOptions_a_SOURCES += Options/OptUserClass.cpp
libOptions_a_SOURCES += Options/OptUserClass.h
libOptions_a_SOURCES += Options/OptVendorClass.cpp
libOptions_a_SOURCES += Options/OptVendorClass.h
libOptions_a_SOURCES += Options/OptVendorSpecInfo.cpp
libOptions_a_SOURCES += Options/OptVendorSpecInfo.h
libOptions_a_SOURCES += Options/OptRtPrefix.cpp
libOptions_a_SOURCES += Options/OptRtPrefix.h
libOptions_a_SOURCES += Options/OptReconfigureMsg.cpp
libOptions_a_SOURCES += Options/OptReconfigureMsg.h
libOptions_a_SOURCES += Options/OptVendorData.cpp
libOptions_a_SOURCES += Options/OptVendorData.h

if HAVE_GTEST
TESTS += Opt_tests

# This is to workaround long long in gtest.h
Opt_tests_CPPFLAGS  = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros

Opt_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread

Opt_tests_LDADD = $(GTEST_LDADD)
Opt_tests_LDADD += libOptions.a
Opt_tests_LDADD += libMessages.a
Opt_tests_LDADD += libMisc.a
Opt_tests_LDADD += libLowLevel.a

Opt_tests_SOURCES  = tests/Srv/run_tests.cpp
Opt_tests_SOURCES += Options/tests/Opt_unittest.cc
Opt_tests_SOURCES += Options/tests/OptAddr_unittest.cc
Opt_tests_SOURCES += Options/tests/OptAuthentication_unittest.cc
Opt_tests_SOURCES += Options/tests/OptIAAddress_unittest.cc
Opt_tests_SOURCES += Options/tests/OptDUID_unittest.cc
Opt_tests_SOURCES += Options/tests/OptFQDN_unittest.cc
Opt_tests_SOURCES += Options/tests/OptOptionRequest_unittest.cc
Opt_tests_SOURCES += Options/tests/OptRtPrefix_unittest.cc
Opt_tests_SOURCES += Options/tests/OptDomainLst_unittest.cc
Opt_tests_SOURCES += Options/tests/OptUserClass_unittest.cc
Opt_tests_SOURCES += Options/tests/OptVendorClass_unittest.cc
Opt_tests_SOURCES += Options/tests/OptVendorSpecInfo_unittest.cc
Opt_tests_SOURCES += Options/tests/OptVendorData_unittest.cc
endif

noinst_LIBRARIES += libLowLevel.a
libLowLevel_a_CFLAGS  = -D__EXTENSIONS__
libLowLevel_a_CFLAGS += -D_XOPEN_SOURCE=1
libLowLevel_a_CFLAGS += -D_XOPEN_SOURCE_EXTENDED=1

libLowLevel_a_SOURCES  =
if BSD
#bsd
libLowLevel_a_SOURCES += Port-bsd/daemon.cpp
libLowLevel_a_SOURCES += Port-bsd/daemon.h
libLowLevel_a_SOURCES += Port-bsd/lowlevel-bsd.c
libLowLevel_a_SOURCES += Port-bsd/lowlevel-options-bsd.c
libLowLevel_a_SOURCES += Port-bsd/malloc.h
libLowLevel_a_SOURCES += Port-bsd/dibbler-client.cpp
libLowLevel_a_SOURCES += Port-bsd/dibbler-server.cpp
libLowLevel_a_SOURCES += Port-bsd/dibbler-relay.cpp
endif
if LINUX
#linux
libLowLevel_a_SOURCES += Port-linux/daemon.cpp
libLowLevel_a_SOURCES += Port-linux/daemon.h
libLowLevel_a_SOURCES += Port-linux/ethtool-kernel.h
libLowLevel_a_SOURCES += Port-linux/ethtool-local.h
libLowLevel_a_SOURCES += Port-linux/interface.c
libLowLevel_a_SOURCES += Port-linux/interface.h
libLowLevel_a_SOURCES += Port-linux/ip_common.h
libLowLevel_a_SOURCES += Port-linux/iproute.c
libLowLevel_a_SOURCES += Port-linux/libnetlink.c
libLowLevel_a_SOURCES += Port-linux/libnetlink.h
libLowLevel_a_SOURCES += Port-linux/ll_map.c
libLowLevel_a_SOURCES += Port-linux/ll_map.h
libLowLevel_a_SOURCES += Port-linux/ll_types.c
libLowLevel_a_SOURCES += Port-linux/lowlevel-linux.c
libLowLevel_a_SOURCES += Port-linux/lowlevel-linux-link-state.c
libLowLevel_a_SOURCES += Port-linux/lowlevel-options-linux.c
libLowLevel_a_SOURCES += Port-linux/rtm_map.h
libLowLevel_a_SOURCES += Port-linux/rt_names.h
libLowLevel_a_SOURCES += Port-linux/utils.c
libLowLevel_a_SOURCES += Port-linux/utils.h
endif

if SUNOS
# sun
libLowLevel_a_SOURCES += Port-sun/daemon.cpp
libLowLevel_a_SOURCES += Port-sun/daemon.h
libLowLevel_a_SOURCES += Port-sun/lowlevel-sun.c
libLowLevel_a_SOURCES += Port-sun/lowlevel-options-sun.c
libLowLevel_a_SOURCES += Port-sun/dibbler-client.cpp
libLowLevel_a_SOURCES += Port-sun/dibbler-server.cpp
libLowLevel_a_SOURCES += Port-sun/dibbler-relay.cpp
endif

noinst_LIBRARIES += libRelCfgMgr.a

dist_noinst_DATA += RelCfgMgr/RelLexer.l RelCfgMgr/RelParser.y
nodist_libRelCfgMgr_a_SOURCES = RelCfgMgr/RelParser.cpp RelCfgMgr/RelLexer.cpp
RelCfgMgr/RelParser.cpp: RelCfgMgr/RelParser.y bison++/bison++$(EXEEXT)
	echo "[BISON++] RelCfgMgr/RelParser.y"
	./bison++/bison++$(EXEEXT) --skeleton=bison++/bison.cc --headerskeleton=bison++/bison.h -v --debug --defines -d RelCfgMgr/RelParser.y -o RelCfgMgr/RelParser.cpp

RelCfgMgr/RelLexer.cpp: RelCfgMgr/RelLexer.l
	echo "[FLEX   ] RelCfgMgr/RelLexer.l"
	flex -+ -i -oRelCfgMgr/RelLexer.cpp RelCfgMgr/RelLexer.l
	@echo "[SED    ] RelCfgMgr/RelLexer.cpp"
	cat RelCfgMgr/RelLexer.cpp | sed 's/extern "C" int isatty (int );/\/\/ extern "C" int isatty (int ) throw ();/' > RelCfgMgr/RelLexer.cpp2
	rm -f RelCfgMgr/RelLexer.cpp
	mv RelCfgMgr/RelLexer.cpp2 RelCfgMgr/RelLexer.cpp

libRelCfgMgr_a_SOURCES  = RelCfgMgr/RelCfgIface.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelCfgIface.h
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelCfgMgr.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelCfgMgr.h
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelLexer.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelLexer.h
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParser.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParser.h
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParsGlobalOpt.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParsGlobalOpt.h
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParsIfaceOpt.cpp
libRelCfgMgr_a_SOURCES += RelCfgMgr/RelParsIfaceOpt.h

noinst_LIBRARIES += libRelIfaceMgr.a
libRelIfaceMgr_a_SOURCES  = RelIfaceMgr/RelIfaceMgr.cpp
libRelIfaceMgr_a_SOURCES += RelIfaceMgr/RelIfaceMgr.h

noinst_LIBRARIES += libRelMessages.a
libRelMessages_a_SOURCES  = RelMessages/RelMsg.cpp
libRelMessages_a_SOURCES += RelMessages/RelMsgGeneric.cpp
libRelMessages_a_SOURCES += RelMessages/RelMsgGeneric.h
libRelMessages_a_SOURCES += RelMessages/RelMsg.h
libRelMessages_a_SOURCES += RelMessages/RelMsgRelayForw.cpp
libRelMessages_a_SOURCES += RelMessages/RelMsgRelayForw.h
libRelMessages_a_SOURCES += RelMessages/RelMsgRelayRepl.cpp
libRelMessages_a_SOURCES += RelMessages/RelMsgRelayRepl.h

noinst_LIBRARIES += libRelOptions.a
libRelOptions_a_SOURCES  = RelOptions/RelOptEcho.cpp
libRelOptions_a_SOURCES += RelOptions/RelOptEcho.h
libRelOptions_a_SOURCES += RelOptions/RelOptGeneric.cpp
libRelOptions_a_SOURCES += RelOptions/RelOptGeneric.h
libRelOptions_a_SOURCES += RelOptions/RelOptInterfaceID.cpp
libRelOptions_a_SOURCES += RelOptions/RelOptInterfaceID.h
libRelOptions_a_SOURCES += RelOptions/RelOptRelayMsg.cpp
libRelOptions_a_SOURCES += RelOptions/RelOptRelayMsg.h
libRelOptions_a_SOURCES += RelOptions/RelOptRemoteID.cpp
libRelOptions_a_SOURCES += RelOptions/RelOptRemoteID.h

noinst_LIBRARIES += libRelTransMgr.a
libRelTransMgr_a_SOURCES  = RelTransMgr/RelTransMgr.cpp
libRelTransMgr_a_SOURCES += RelTransMgr/RelTransMgr.h

if HAVE_GTEST
TESTS += RelTransMgr_tests
# This is to workaround long long in gtest.h
RelTransMgr_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
RelTransMgr_tests_SOURCES  = tests/Srv/run_tests.cpp
RelTransMgr_tests_SOURCES += RelTransMgr/tests/RelTransMgr_unittest.cc
RelTransMgr_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread

RelTransMgr_tests_LDADD = $(GTEST_LDADD)
RelTransMgr_tests_LDADD += libRelTransMgr.a
RelTransMgr_tests_LDADD += libRelIfaceMgr.a
RelTransMgr_tests_LDADD += libIfaceMgr.a
RelTransMgr_tests_LDADD += libRelCfgMgr.a
RelTransMgr_tests_LDADD += libCfgMgr.a
RelTransMgr_tests_LDADD += libRelMessages.a
RelTransMgr_tests_LDADD += libMessages.a
RelTransMgr_tests_LDADD += libMisc.a
RelTransMgr_tests_LDADD += libOptions.a
RelTransMgr_tests_LDADD += libRelOptions.a
RelTransMgr_tests_LDADD += libLowLevel.a
endif

noinst_LIBRARIES += libRequestor.a
dist_noinst_DATA += Requestor/TODO.txt
libRequestor_a_SOURCES  = Requestor/ReqCfgMgr.cpp
libRequestor_a_SOURCES += Requestor/ReqCfgMgr.h
libRequestor_a_SOURCES += Requestor/ReqMsg.cpp
libRequestor_a_SOURCES += Requestor/ReqMsg.h
libRequestor_a_SOURCES += Requestor/ReqOpt.cpp
libRequestor_a_SOURCES += Requestor/ReqOpt.h
libRequestor_a_SOURCES += Requestor/ReqOpts.cpp
libRequestor_a_SOURCES += Requestor/ReqTransMgr.cpp
libRequestor_a_SOURCES += Requestor/ReqTransMgr.h

noinst_LIBRARIES += libSrvAddrMgr.a
libSrvAddrMgr_a_SOURCES  = SrvAddrMgr/SrvAddrMgr.cpp
libSrvAddrMgr_a_SOURCES += SrvAddrMgr/SrvAddrMgr.h

dist_noinst_DATA += SrvCfgMgr/SrvLexer.l SrvCfgMgr/SrvParser.y

nodist_libSrvCfgMgr_a_SOURCES = SrvCfgMgr/SrvParser.cpp SrvCfgMgr/SrvLexer.cpp
SrvCfgMgr/SrvParser.cpp: SrvCfgMgr/SrvParser.y bison++/bison++$(EXEEXT)
	@echo "[BISON++] SrvCfgMgr/SrvParser.y"
	./bison++/bison++$(EXEEXT) --skeleton=bison++/bison.cc --headerskeleton=bison++/bison.h -v --debug --defines -d SrvCfgMgr/SrvParser.y -o SrvCfgMgr/SrvParser.cpp

SrvCfgMgr/SrvLexer.cpp: SrvCfgMgr/SrvLexer.l
	@echo "[FLEX   ] SrvCfgMgr/SrvLexer.l"
	flex -+ -i -oSrvCfgMgr/SrvLexer.cpp SrvCfgMgr/SrvLexer.l
	@echo "[SED    ] SrvCfgMgr/SrvLexer.cpp"
	cat SrvCfgMgr/SrvLexer.cpp | sed 's/extern "C" int isatty (int );/\/\/extern "C" int isatty (int ) throw ();/' > SrvCfgMgr/SrvLexer.cpp2
	rm -f SrvCfgMgr/SrvLexer.cpp
	mv SrvCfgMgr/SrvLexer.cpp2 SrvCfgMgr/SrvLexer.cpp

noinst_LIBRARIES += libSrvCfgMgr.a
libSrvCfgMgr_a_SOURCES  = SrvCfgMgr/NodeClientSpecific.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/NodeClientSpecific.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/NodeConstant.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/NodeConstant.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/Node.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/Node.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/NodeOperator.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/NodeOperator.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgAddrClass.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgAddrClass.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgClientClass.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgClientClass.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgIface.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgIface.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgMgr.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgMgr.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgOptions.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgOptions.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgPD.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgPD.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgTA.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvCfgTA.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvLexer.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsClassOpt.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsClassOpt.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParser.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParser.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsGlobalOpt.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsGlobalOpt.h
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsIfaceOpt.cpp
libSrvCfgMgr_a_SOURCES += SrvCfgMgr/SrvParsIfaceOpt.h

if HAVE_GTEST
TESTS += SrvCfgMgr_tests
# This is to workaround long long in gtest.h
SrvCfgMgr_tests_CPPFLAGS  = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
SrvCfgMgr_tests_SOURCES  = tests/Srv/run_tests.cpp
SrvCfgMgr_tests_SOURCES += SrvCfgMgr/tests/SrvCfgMgr_unittest.cc
SrvCfgMgr_tests_SOURCES += SrvCfgMgr/tests/expressions_unittest.cc
SrvCfgMgr_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread

SrvCfgMgr_tests_LDADD = $(GTEST_LDADD)
SrvCfgMgr_tests_LDADD += libSrvTransMgr.a
SrvCfgMgr_tests_LDADD += libSrvCfgMgr.a
SrvCfgMgr_tests_LDADD += libCfgMgr.a
SrvCfgMgr_tests_LDADD += libSrvIfaceMgr.a
SrvCfgMgr_tests_LDADD += libIfaceMgr.a
SrvCfgMgr_tests_LDADD += libSrvAddrMgr.a
SrvCfgMgr_tests_LDADD += libAddrMgr.a
SrvCfgMgr_tests_LDADD += libSrvMessages.a
SrvCfgMgr_tests_LDADD += libMessages.a
SrvCfgMgr_tests_LDADD += libSrvOptions.a
SrvCfgMgr_tests_LDADD += libOptions.a
SrvCfgMgr_tests_LDADD += libMisc.a
SrvCfgMgr_tests_LDADD += libPosLib.a
SrvCfgMgr_tests_LDADD += libNettle.a
SrvCfgMgr_tests_LDADD += libLowLevel.a

dist_noinst_DATA += testdata/info.txt testdata/keys-mapping
endif


noinst_LIBRARIES += libSrvIfaceMgr.a
libSrvIfaceMgr_a_SOURCES  = SrvIfaceMgr/SrvIfaceMgr.cpp
libSrvIfaceMgr_a_SOURCES += SrvIfaceMgr/SrvIfaceMgr.h

noinst_LIBRARIES += libSrvMessages.a
libSrvMessages_a_SOURCES  = SrvMessages/SrvMsg.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsg.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgDecline.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgDecline.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgInfRequest.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgInfRequest.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgLeaseQuery.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgLeaseQuery.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgLeaseQueryReply.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgLeaseQueryReply.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRebind.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRebind.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRelease.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRelease.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRenew.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRenew.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgReply.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgReply.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRequest.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgRequest.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgSolicit.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgSolicit.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgConfirm.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgConfirm.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgAdvertise.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgAdvertise.h
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgReconfigure.cpp
libSrvMessages_a_SOURCES += SrvMessages/SrvMsgReconfigure.h

noinst_LIBRARIES += libSrvOptions.a
libSrvOptions_a_SOURCES  = SrvOptions/SrvOptAddrParams.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptAddrParams.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptFQDN.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptFQDN.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIAAddress.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIAAddress.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIA_NA.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIA_NA.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIA_PD.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIA_PD.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIAPrefix.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptIAPrefix.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptInterfaceID.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptInterfaceID.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptLQ.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptLQ.h
libSrvOptions_a_SOURCES += SrvOptions/SrvOptTA.cpp
libSrvOptions_a_SOURCES += SrvOptions/SrvOptTA.h

noinst_LIBRARIES += libSrvTransMgr.a
libSrvTransMgr_a_SOURCES  = SrvTransMgr/SrvTransMgr.cpp
libSrvTransMgr_a_SOURCES += SrvTransMgr/SrvTransMgr.h

# TODO do the doc dir ...

noinst_LIBRARIES += libNettle.a
libNettle_a_SOURCES  = nettle/base64-decode.c
libNettle_a_SOURCES += nettle/base64-encode.c
libNettle_a_SOURCES += nettle/base64-meta.c
libNettle_a_SOURCES += nettle/base64.h
libNettle_a_SOURCES += nettle/cbc.h
libNettle_a_SOURCES += nettle/hmac-md5.c
libNettle_a_SOURCES += nettle/hmac.c
libNettle_a_SOURCES += nettle/hmac.h
libNettle_a_SOURCES += nettle/macros.h
libNettle_a_SOURCES += nettle/md5-meta.c
libNettle_a_SOURCES += nettle/md5.c
libNettle_a_SOURCES += nettle/md5.h
libNettle_a_SOURCES += nettle/memxor.c
libNettle_a_SOURCES += nettle/memxor.h
libNettle_a_SOURCES += nettle/nettle-internal.h
libNettle_a_SOURCES += nettle/nettle-meta.h
libNettle_a_SOURCES += nettle/nettle-types.h
libNettle_a_SOURCES += nettle/sha.h

noinst_LIBRARIES += libPosLib.a

libPosLib_a_SOURCES  = poslib/dnsmessage.cpp
libPosLib_a_SOURCES += poslib/domainfn.cpp
libPosLib_a_SOURCES += poslib/dnssec-sign.cpp
libPosLib_a_SOURCES += poslib/dnssec-sign.h
libPosLib_a_SOURCES += poslib/exception.cpp
libPosLib_a_SOURCES += poslib/lexfn.cpp
libPosLib_a_SOURCES += poslib/masterfile.cpp
libPosLib_a_SOURCES += poslib/postime.cpp
libPosLib_a_SOURCES += poslib/random.cpp
libPosLib_a_SOURCES += poslib/resolver.cpp
libPosLib_a_SOURCES += poslib/rr.cpp
libPosLib_a_SOURCES += poslib/socket.cpp
libPosLib_a_SOURCES += poslib/vsnprintf.cpp
libPosLib_a_SOURCES += poslib/bits.h
libPosLib_a_SOURCES += poslib/dnsmessage.h
libPosLib_a_SOURCES += poslib/dnsdefs.h
libPosLib_a_SOURCES += poslib/domainfn.h
libPosLib_a_SOURCES += poslib/exception.h
libPosLib_a_SOURCES += poslib/lexfn.h
libPosLib_a_SOURCES += poslib/masterfile.h
libPosLib_a_SOURCES += poslib/poslib.h
libPosLib_a_SOURCES += poslib/postime.h
libPosLib_a_SOURCES += poslib/random.h
libPosLib_a_SOURCES += poslib/resolver.h
libPosLib_a_SOURCES += poslib/rr.h
libPosLib_a_SOURCES += poslib/socket.h
libPosLib_a_SOURCES += poslib/syssocket.h
libPosLib_a_SOURCES += poslib/sysstl.h
libPosLib_a_SOURCES += poslib/sysstring.h
libPosLib_a_SOURCES += poslib/syssocket.h
libPosLib_a_SOURCES += poslib/types.h
libPosLib_a_SOURCES += poslib/vsnprintf.h


dist_noinst_DATA += poslib/w32poll.cpp poslib/w32poll.h poslib/ChangeLog-poslib

if HAVE_GTEST
TESTS += tsig_tests

# This is to workaround long long in gtest.h
tsig_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros

tsig_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread

tsig_tests_LDADD = $(GTEST_LDADD)
tsig_tests_LDADD += libMisc.a
tsig_tests_LDADD += libPosLib.a
tsig_tests_LDADD += libNettle.a
tsig_tests_LDADD += libTestUtils.a

tsig_tests_SOURCES  = tests/Clnt/run_tests.cc
tsig_tests_SOURCES += poslib/tests/tsig_unittest.cc
endif

if HAVE_GTEST
TESTS += Clnt_tests
# This is to workaround long long in gtest.h
Clnt_tests_CPPFLAGS  = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros
Clnt_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread
Clnt_tests_SOURCES  = tests/Clnt/run_tests.cc
Clnt_tests_SOURCES += tests/Clnt/ClntIfaceMgr_unittest.cc
Clnt_tests_SOURCES += $(top_srcdir)/Misc/DHCPClient.cpp
Clnt_tests_SOURCES += $(top_srcdir)/Misc/DHCPClient.h

Clnt_tests_LDADD = $(GTEST_LDADD)
Clnt_tests_LDADD += ClntTransMgr.a
Clnt_tests_LDADD += ClntMessages.a
Clnt_tests_LDADD += ClntTransMgr.a
Clnt_tests_LDADD += ClntOptions.a
Clnt_tests_LDADD += ClntCfgMgr.a

Clnt_tests_LDADD += ClntIfaceMgr.a
Clnt_tests_LDADD += ClntCfgMgr.a
Clnt_tests_LDADD += CfgMgr.a
Clnt_tests_LDADD += ClntAddrMgr.a
Clnt_tests_LDADD += IfaceMgr.a
Clnt_tests_LDADD += AddrMgr.a
Clnt_tests_LDADD += Poslib.a
Clnt_tests_LDADD += Nettle.a
Clnt_tests_LDADD += Options.a
Clnt_tests_LDADD += Messages.a
Clnt_tests_LDADD += LowLevel.a
Clnt_tests_LDADD += Misc.a
Clnt_tests_LDADD += ClntOptions.a

endif

if HAVE_GTEST
# This is to workaround long long in gtest.h
Srv_tests_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros

TESTS += Srv_tests

Srv_tests_LDFLAGS = $(AM_LDFLAGS) $(GTEST_LDFLAGS) -pthread

Srv_tests_LDADD = $(GTEST_LDADD)
Srv_tests_LDADD += libSrvTransMgr.a
Srv_tests_LDADD += libSrvCfgMgr.a
Srv_tests_LDADD += libCfgMgr.a
Srv_tests_LDADD += libSrvIfaceMgr.a
Srv_tests_LDADD += libIfaceMgr.a
Srv_tests_LDADD += libSrvAddrMgr.a
Srv_tests_LDADD += libAddrMgr.a
Srv_tests_LDADD += libSrvMessages.a
Srv_tests_LDADD += libMessages.a
Srv_tests_LDADD += libSrvOptions.a
Srv_tests_LDADD += libOptions.a
Srv_tests_LDADD += libMisc.a
Srv_tests_LDADD += libPosLib.a
Srv_tests_LDADD += libNettle.a
Srv_tests_LDADD += libLowLevel.a
Srv_tests_SOURCES  = tests/Srv/run_tests.cpp
Srv_tests_SOURCES += tests/Srv/assign_utils.cc
Srv_tests_SOURCES += tests/Srv/assign_utils.h
Srv_tests_SOURCES += tests/Srv/assign_addr_unittest.cc
Srv_tests_SOURCES += tests/Srv/assign_prefix_unittest.cc
Srv_tests_SOURCES += tests/Srv/options_unittest.cc
Srv_tests_SOURCES += tests/Srv/relay_unittest.cc
Srv_tests_SOURCES += tests/Srv/wireshark.cc
endif

if HAVE_GTEST_SOURCE
# This is to workaround long long in gtest.h
libTestUtils_a_CPPFLAGS = $(GTEST_INCLUDES) -Wno-long-long -Wno-variadic-macros

noinst_LIBRARIES += libTestUtils.a
noinst_LIBRARIES += libgtest.a

libTestUtils_a_SOURCES  = tests/utils/poslib_utils.cc
libTestUtils_a_SOURCES += tests/utils/poslib_utils.h

libgtest_a_CXXFLAGS = $(GTEST_INCLUDES) $(AM_CXXFLAGS)
nodist_libgtest_a_SOURCES = tests/utils/gtest-all.cc

tests/utils/gtest-all.cc: $(GTEST_SOURCE)/src/gtest-all.cc
	cp -p $(GTEST_SOURCE)/src/gtest-all.cc $@
endif



sbin_PROGRAMS = dibbler-client dibbler-server dibbler-relay dibbler-requestor
dibbler_client_SOURCES = @PORT_SUBDIR@/dibbler-client.cpp
dibbler_client_SOURCES += Misc/DHCPClient.cpp
dibbler_client_SOURCES += Misc/DHCPClient.h


dibbler_client_LDADD  = libClntTransMgr.a
dibbler_client_LDADD += libClntMessages.a
dibbler_client_LDADD += libClntOptions.a
dibbler_client_LDADD += libClntCfgMgr.a
dibbler_client_LDADD += libClntIfaceMgr.a
dibbler_client_LDADD += libCfgMgr.a
dibbler_client_LDADD += libClntAddrMgr.a
dibbler_client_LDADD += libIfaceMgr.a -L. -lClntMessages # to deal with libtool
dibbler_client_LDADD += libAddrMgr.a
dibbler_client_LDADD += libPosLib.a
dibbler_client_LDADD += libNettle.a
dibbler_client_LDADD += libOptions.a
dibbler_client_LDADD += libMessages.a
dibbler_client_LDADD += libLowLevel.a
dibbler_client_LDADD += libMisc.a


dibbler_server_SOURCES = @PORT_SUBDIR@/dibbler-server.cpp
dibbler_server_SOURCES += Misc/DHCPServer.cpp
dibbler_server_SOURCES += Misc/DHCPServer.h

dibbler_server_LDADD  = libSrvOptions.a
dibbler_server_LDADD += libSrvMessages.a
dibbler_server_LDADD += libSrvIfaceMgr.a
dibbler_server_LDADD += libSrvCfgMgr.a
dibbler_server_LDADD += libSrvTransMgr.a
dibbler_server_LDADD += libSrvAddrMgr.a
dibbler_server_LDADD += libIfaceMgr.a
dibbler_server_LDADD += libAddrMgr.a
dibbler_server_LDADD += libPosLib.a
dibbler_server_LDADD += libOptions.a
dibbler_server_LDADD += libMessages.a
dibbler_server_LDADD += libCfgMgr.a
dibbler_server_LDADD += libLowLevel.a
dibbler_server_LDADD += libMisc.a
# This is because if we just use the libFoo.a it's not working too well but if we just use -lfoo
# then automake is not buildign the libs before the server
dibbler_server_LDADD += libNettle.a -L.  -lSrvOptions -lSrvMessages -lSrvIfaceMgr -lSrvCfgMgr -lSrvTransMgr -lSrvAddrMgr -lIfaceMgr -lAddrMgr -lPosLib -lOptions -lMessages -lCfgMgr -lLowLevel -lMisc -lNettle 

dibbler_relay_SOURCES = @PORT_SUBDIR@/dibbler-relay.cpp
dibbler_relay_SOURCES += Misc/DHCPRelay.cpp
dibbler_relay_SOURCES += Misc/DHCPRelay.h


dibbler_relay_LDADD  = libRelTransMgr.a
dibbler_relay_LDADD += libRelCfgMgr.a
dibbler_relay_LDADD += libRelIfaceMgr.a
dibbler_relay_LDADD += libRelMessages.a
dibbler_relay_LDADD += libCfgMgr.a
dibbler_relay_LDADD += libRelOptions.a
dibbler_relay_LDADD += libIfaceMgr.a
dibbler_relay_LDADD += libPosLib.a
dibbler_relay_LDADD += libMessages.a
dibbler_relay_LDADD += libOptions.a
dibbler_relay_LDADD += libLowLevel.a
dibbler_relay_LDADD += libMisc.a
dibbler_relay_LDFLAGS = -lpthread

dibbler_requestor_SOURCES = $(top_srcdir)/Requestor/Requestor.cpp $(top_srcdir)/Requestor/Requestor.h


dibbler_requestor_LDADD  = libRequestor.a
dibbler_requestor_LDADD += libMessages.a
dibbler_requestor_LDADD += libIfaceMgr.a
dibbler_requestor_LDADD += libMisc.a
dibbler_requestor_LDADD += libOptions.a
dibbler_requestor_LDADD += libLowLevel.a

noinst_PROGRAMS += $(TESTS)
# FIXME TODO file ?
nobase_dist_doc_DATA = CHANGELOG LICENSE RELNOTES
nobase_dist_doc_DATA += scripts/notify-scripts/client-notify-linux.sh
nobase_dist_doc_DATA += scripts/notify-scripts/client-notify-macos.sh
nobase_dist_doc_DATA += scripts/notify-scripts/client-notify-bsd.sh
nobase_dist_doc_DATA += scripts/notify-scripts/server-notify.sh
nobase_dist_doc_DATA += scripts/bison-sanitizer.py scripts/remote-autoconf

dist_noinst_DATA += m4/libtool.m4 m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
dist_noinst_DATA += scripts
dist_noinst_DATA += tests

BUILT_SOURCES = $(nodist_libClntCfgMgr_a_SOURCES) $(nodist_libSrvCfgMgr_a_SOURCES) $(nodist_libRelCfgMgr_a_SOURCES)
MOSTLYCLEANFILES = $(BUILT_SOURCES)
SUBDIRS = doc
