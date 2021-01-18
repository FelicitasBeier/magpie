*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 i43_wat_avail_cons(t,wat_src,j)        Water available for agricultural consumption (mio. m^3 per yr)
;

variables
 v43_watavail_agcons(wat_src,j)  Water available for consumptive agricultural use from different sources (mio. m^3 per yr)
;

equations
 q43_agwater_cons(j)             Local seasonal water constraints (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov43_watavail(t,wat_src,j,type) Water available from different sources (mio. m^3 per yr)
 oq43_water(t,j,type)            Local seasonal water constraints (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
