*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 im_wat_avail(t,j,EFP,scen_watdem_nonagr,wat_source43)      Water availability for different scenarios (mio. m^3 per yr)
;

variables
 v43_watavail(j,wat_source43)         Water available from different sources (mio. m^3 per yr)
;

equations
 q43_water_availability(j)            Water availability constraint (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov43_watavail(t,wat_source43,j,type) Water available from different sources (mio. m^3 per yr)
 oq43_water_availability(t,j,type)    Local seasonal water constraints (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
