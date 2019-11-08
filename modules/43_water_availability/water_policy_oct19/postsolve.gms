*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov43_watavail(t,wat_src,j,"marginal")   = v43_watavail.m(wat_src,j);
 ov43_watdem_reg(t,wat_dem,i,"marginal") = v43_watdem_reg.m(wat_dem,i);
 oq43_water(t,j,"marginal")              = q43_water.m(j);
 oq43_water_reg(t,wat_dem,i,"marginal")  = q43_water_reg.m(wat_dem,i);
 oq43_watercap_China(t,"marginal")       = q43_watercap_China.m;
 ov43_watavail(t,wat_src,j,"level")      = v43_watavail.l(wat_src,j);
 ov43_watdem_reg(t,wat_dem,i,"level")    = v43_watdem_reg.l(wat_dem,i);
 oq43_water(t,j,"level")                 = q43_water.l(j);
 oq43_water_reg(t,wat_dem,i,"level")     = q43_water_reg.l(wat_dem,i);
 oq43_watercap_China(t,"level")          = q43_watercap_China.l;
 ov43_watavail(t,wat_src,j,"upper")      = v43_watavail.up(wat_src,j);
 ov43_watdem_reg(t,wat_dem,i,"upper")    = v43_watdem_reg.up(wat_dem,i);
 oq43_water(t,j,"upper")                 = q43_water.up(j);
 oq43_water_reg(t,wat_dem,i,"upper")     = q43_water_reg.up(wat_dem,i);
 oq43_watercap_China(t,"upper")          = q43_watercap_China.up;
 ov43_watavail(t,wat_src,j,"lower")      = v43_watavail.lo(wat_src,j);
 ov43_watdem_reg(t,wat_dem,i,"lower")    = v43_watdem_reg.lo(wat_dem,i);
 oq43_water(t,j,"lower")                 = q43_water.lo(j);
 oq43_water_reg(t,wat_dem,i,"lower")     = q43_water_reg.lo(wat_dem,i);
 oq43_watercap_China(t,"lower")          = q43_watercap_China.lo;
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
