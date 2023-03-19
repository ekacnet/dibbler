/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *          Marek Senderski <msend@o2.pl>
 * changes: Krzysztof Wnuk <keczi@poczta.onet.pl>
 * released under GNU GPL v2 only licence
 *
 * $Id: SrvMsgRequest.h,v 1.6 2008-08-29 00:07:35 thomson Exp $
 *
 */

class TSrvMsgRequest;
#ifndef SRVMSGREQUEST_H
#define SRVMSGREQUEST_H

#include <Misc/IPv6Addr.h>
#include <Misc/SmartPtr.h>
#include <SrvAddrMgr/SrvAddrMgr.h>
#include <SrvCfgMgr/SrvCfgMgr.h>
#include <SrvIfaceMgr/SrvIfaceMgr.h>
#include <SrvMessages/SrvMsg.h>

class TSrvMsgRequest : public TSrvMsg {
public:
  TSrvMsgRequest(int iface, SPtr<TIPv6Addr> addr, char *buf, int bufSize);

  void doDuties();
  bool check();
  unsigned long getTimeout();
  ~TSrvMsgRequest();
  std::string getName() const;

private:
};

#endif /* SRVMSGREQUEST_H */
