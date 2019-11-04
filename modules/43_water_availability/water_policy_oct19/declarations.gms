*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 im_wat_avail(t,wat_src,j)        Water availability (mio. m^3 per yr)
;

variables
  v43_watavail(wat_src,j)         Water available from different sources (mio. m^3 per yr)
  v43_watdem_reg(wat_dem,i)       Regional water demand from all sectors (mio. m^3 per yr)
;

equations
  q43_water(j)                    Local seasonal water constraints (mio. m^3 per yr)
  q43_water_reg(wat_dem,i)        Determines regional water demand (mio. m^3 per yr)
  q43_watercap_China              Total water cap of all sectors (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov43_watavail(t,wat_src,j,type)   Water available from different sources (mio. m^3 per yr)
 ov43_watdem_reg(t,wat_dem,i,type) Regional water demand from all sectors (mio. m^3 per yr)
 oq43_water(t,j,type)              Local seasonal water constraints (mio. m^3 per yr)
 oq43_water_reg(t,wat_dem,i,type)  Determines regional water demand (mio. m^3 per yr)
 oq43_watercap_China(t,i,type)     Total water cap of all sectors (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
