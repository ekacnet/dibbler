/*
 * Dibbler - a portable DHCPv6
 *
 * authors: Tomasz Mrugalski <thomson@klub.com.pl>
 *          Marek Senderski <msend@o2.pl>
 *
 * released under GNU GPL v2 only licence
 *
 */

class TClntCfgAddr;
#ifndef CLNTCFGADDR_H
#define CLNTCFGADDR_H

#include <ClntCfgMgr/ClntParsGlobalOpt.h>
#include <Misc/DHCPConst.h>
#include <Misc/IPv6Addr.h>
#include <Misc/SmartPtr.h>
#include <iomanip>
#include <iostream>

class TClntCfgAddr {
  friend std::ostream &operator<<(std::ostream &out, TClntCfgAddr &group);

public:
  TClntCfgAddr();
  TClntCfgAddr(SPtr<TIPv6Addr> addr);
  TClntCfgAddr(SPtr<TIPv6Addr> addr, long valid, long pref);
  ~TClntCfgAddr();

  SPtr<TIPv6Addr> get();
  unsigned long getValid();
  unsigned long getPref();
  void setOptions(SPtr<TClntParsGlobalOpt> opt);

private:
  SPtr<TIPv6Addr> Addr;
  unsigned long Valid;
  unsigned long Pref;
};

#endif
