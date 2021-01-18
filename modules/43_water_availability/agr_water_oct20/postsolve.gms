*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov43_watavail_agcons(t,wat_src,j,"marginal") = v43_watavail_agcons.m(wat_src,j);
 oq43_agwater_cons(t,j,"marginal")            = q43_agwater_cons.m(j);
 ov43_watavail_agcons(t,wat_src,j,"level")    = v43_watavail_agcons.l(wat_src,j);
 oq43_agwater_cons(t,j,"level")               = q43_agwater_cons.l(j);
 ov43_watavail_agcons(t,wat_src,j,"upper")    = v43_watavail_agcons.up(wat_src,j);
 oq43_agwater_cons(t,j,"upper")               = q43_agwater_cons.up(j);
 ov43_watavail_agcons(t,wat_src,j,"lower")    = v43_watavail_agcons.lo(wat_src,j);
 oq43_agwater_cons(t,j,"lower")               = q43_agwater_cons.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

