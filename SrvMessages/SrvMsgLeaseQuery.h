/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *
 * released under GNU GPL v2 only licence
 *
 */

class TSrvMsgLeaseQuery;
#ifndef SRVMSGLEASEQUERY_H
#define SRVMSGLEASEQUERY_H

#include <Misc/IPv6Addr.h>
#include <Misc/SmartPtr.h>
#include <SrvMessages/SrvMsg.h>

class TSrvMsgLeaseQuery : public TSrvMsg {
public:
  TSrvMsgLeaseQuery(int iface, SPtr<TIPv6Addr> addr, char *buf, int bufSize);

  void doDuties();
  bool check();
  ~TSrvMsgLeaseQuery();
  std::string getName() const;

private:
};

#endif /* SRVMSGREQUEST_H */
