/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *          Marek Senderski <msend@o2.pl>
 *
 * released under GNU GPL v2 only licence
 *
 */

class TClntIfaceMgr;
#ifndef CLNTMSGINFREQUEST_H
#define CLNTMSGINFREQUEST_H

#include <ClntCfgMgr/ClntCfgMgr.h>
#include <ClntMessages/ClntMsg.h>
#include <Misc/SmartPtr.h>

class TClntMsgInfRequest : public TClntMsg {
public:
  TClntMsgInfRequest(TOptList ReqOpts, int iface);
  TClntMsgInfRequest(SPtr<TClntCfgIface> iface);

  void answer(SPtr<TClntMsg> msg);
  void doDuties();
  bool check();
  std::string getName() const;
  ~TClntMsgInfRequest();
};

#endif
