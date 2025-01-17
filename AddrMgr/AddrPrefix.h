/*
 * Dibbler - a portable DHCPv6
 *
 * author: Krzysztof Wnuk <keczi@poczta.onet.pl>
 * changes: Tomasz Mrugalski <thomson@klub.com.pl>
 *
 */

#ifndef ADDRPREFIX_H
#define ADDRPREFIX_H

#include <AddrMgr/AddrAddr.h>
#include <Misc/DHCPConst.h>
#include <Misc/IPv6Addr.h>
#include <Misc/SmartPtr.h>
#include <iostream>

class TAddrPrefix : public TAddrAddr {
  friend std::ostream &operator<<(std::ostream &strum, TAddrPrefix &x);

public:
  TAddrPrefix(SPtr<TIPv6Addr> addr, long pref, long valid, int length);

  // return address in packed format (char[16])
  int getLength();

private:
  int Length;
};
#endif
