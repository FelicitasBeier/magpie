*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
ov43_watavail(t,wat_source43,j,"marginal") = v43_watavail.m(j,wat_source43);
oq43_water_availability(t,j,"marginal")    = q43_water_availability.m(j);
ov43_watavail(t,wat_source43,j,"level")    = v43_watavail.l(j,wat_source43);
oq43_water_availability(t,j,"level")       = q43_water_availability.l(j);
ov43_watavail(t,wat_source43,j,"upper")    = v43_watavail.up(j,wat_source43);
oq43_water_availability(t,j,"upper")       = q43_water_availability.up(j);
ov43_watavail(t,wat_source43,j,"lower")    = v43_watavail.lo(j,wat_source43);
oq43_water_availability(t,j,"lower")       = q43_water_availability.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
