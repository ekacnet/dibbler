/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *
 * released under GNU GPL v2 only licence
 */

class TSrvOptTA;
#ifndef SRVOPTTA_H
#define SRVOPTTA_H

#include <Misc/Container.h>
#include <Misc/DUID.h>
#include <Misc/IPv6Addr.h>
#include <Options/OptTA.h>
#include <Misc/SmartPtr.h>
#include <SrvAddrMgr/SrvAddrMgr.h>
#include <SrvCfgMgr/SrvCfgMgr.h>
#include <SrvOptions/SrvOptIAAddress.h>

class TSrvOptTA : public TOptTA {
public:
  /* Constructor used in answers to: SOLICIT, SOLICIT (with RAPID_COMMIT) and
   * REQUEST */
  TSrvOptTA(SPtr<TSrvOptTA> queryOpt, SPtr<TSrvMsg> clientMsg, int msgType,
            TMsg *parent);
  TSrvOptTA(char *buf, int bufsize, TMsg *parent);
  TSrvOptTA(int iaid, TMsg *parent);
  TSrvOptTA(int iaid, int statusCode, std::string txt, TMsg *parent);
  /// @todo: Why 4 construstors?
  void releaseAllAddrs(bool quiet);

  bool doDuties();

private:
  SPtr<TIPv6Addr> ClntAddr;
  SPtr<TDUID> ClntDuid;

  /// @todo: replace with Parent->getIface();
  int Iface;

  SPtr<TSrvOptIAAddress> assignAddr(SPtr<TSrvMsg> clientMsg);
  void solicit(SPtr<TSrvMsg> clientMsg, SPtr<TSrvOptTA> queryOpt);
  void request(SPtr<TSrvMsg> clientMsg, SPtr<TSrvOptTA> queryOpt);
  void release(SPtr<TSrvOptTA> queryOpt);
  void confirm(SPtr<TSrvOptTA> queryOpt);

  void solicitRequest(SPtr<TSrvMsg> clientMsg, SPtr<TSrvOptTA> queryOpt,
                      bool solicit);

  int OrgMessage; // original message, which we are responding to
};

#endif
