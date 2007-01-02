/*
 * Dibbler - a portable DHCPv6
 *
 * author: Krzysztof Wnuk <keczi@poczta.onet.pl>
 *
 * released under GNU GPL v2 or later licence
 */
#ifndef CLNTOPTIA_PD_H
#define CLNTOPTIA_PD_H

//#include "ClntCfgPD.h"
#include "OptIA_PD.h"
#include "ClntOptIAPrefix.h"
#include "ClntIfaceMgr.h"
#include "ClntTransMgr.h"
#include "ClntCfgMgr.h"
#include "ClntAddrMgr.h"
#include "IPv6Addr.h"

class TOptIA_PD;

class TClntOptIA_PD : public TOptIA_PD
{
 public:
    TClntOptIA_PD(SmartPtr<TClntCfgPD> ClntCfgPD, TMsg* parent);
    TClntOptIA_PD(SmartPtr<TAddrIA> AddrPD, TMsg* parent);
    TClntOptIA_PD(SmartPtr<TAddrIA> clntAddrPD, bool zeroTimes, TMsg* parent);
    TClntOptIA_PD(char * buf, int bufsize, TMsg* parent);
    ~TClntOptIA_PD();    

    bool doDuties();
    int getStatusCode();
    void setThats(SmartPtr<TClntIfaceMgr> ifaceMgr, 
		  SmartPtr<TClntTransMgr> transMgr, 
		  SmartPtr<TClntCfgMgr>   cfgMgr, 
		  SmartPtr<TClntAddrMgr>  addrMgr,
		  SmartPtr<TDUID> srvDuid, SmartPtr<TIPv6Addr> srvAddr, int iface);
    void setIface(int iface);

    SmartPtr<TClntOptIAPrefix> getPrefix();
    SmartPtr<TClntOptIAPrefix> getPrefix(SmartPtr<TIPv6Addr> prefix);
    void firstPrefix();
    int countPrefix();
    TClntOptIA_PD(SmartPtr<TClntCfgPD> ClntCfgPD, 
		  SmartPtr<TAddrIA> ClntaddrPD, 
		  TMsg* parent);
    bool isValid();

 private:
    bool addPrefixes();
    bool delPrefixes();

    SmartPtr<TIPv6Addr> Prefix;
    bool Unicast;
    SmartPtr<TDUID> DUID;
    int Iface;

    /* Context */
    SmartPtr<TClntIfaceMgr> IfaceMgr;
    SmartPtr<TClntTransMgr> TransMgr;
    SmartPtr<TClntCfgMgr>   CfgMgr;
    SmartPtr<TClntAddrMgr>  AddrMgr;
};

#endif /* CLNTOPTIA_PD_H */
