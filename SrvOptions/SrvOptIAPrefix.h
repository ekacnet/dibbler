/*
 * Dibbler - a portable DHCPv6
 *
 * author T Krzysztof Wnuk <keczi@poczta.onet.pl>
 *
 *
 */

#ifndef SRVOPTIAPREFIX_H
#define SRVOPTIAPREFIX_H

#include <Misc/Container.h>
#include <Options/OptIAPrefix.h>
#include <Misc/SmartPtr.h>

class TSrvOptIAPrefix : public TOptIAPrefix {
public:
  TSrvOptIAPrefix(char *addr, int n, TMsg *parent);

  TSrvOptIAPrefix(SPtr<TIPv6Addr> prefix, char length, unsigned long pref,
                  unsigned long valid, TMsg *parent);

  bool doDuties();
};

#endif
