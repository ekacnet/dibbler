/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *          Marek Senderski <msend@o2.pl>
 * changes: Krzysztof Wnuk <keczi@poczta.onet.pl>
 * released under GNU GPL v2 only licence
 *
 * $Id: SrvMsgRequest.cpp,v 1.9 2008-08-29 00:07:35 thomson Exp $
 *
 */

#include <SrvMessages/SrvMsgRequest.h>
#include <AddrMgr/AddrClient.h>
#include <Misc/DHCPConst.h>
#include <Misc/SmartPtr.h>
#include <SrvIfaceMgr/SrvIfaceMgr.h>
#include <SrvMessages/SrvMsgAdvertise.h>
#include <SrvOptions/SrvOptIA_NA.h>

TSrvMsgRequest::TSrvMsgRequest(int iface, SPtr<TIPv6Addr> addr, char *buf, int bufSize)
    : TSrvMsg(iface, addr, buf, bufSize) {}

void TSrvMsgRequest::doDuties() { return; }

bool TSrvMsgRequest::check() {
  return TSrvMsg::check(true /* ClientID required */, true /* ServerID required */);
}

unsigned long TSrvMsgRequest::getTimeout() { return 0; }

TSrvMsgRequest::~TSrvMsgRequest() {}

std::string TSrvMsgRequest::getName() const { return "REQUEST"; }
