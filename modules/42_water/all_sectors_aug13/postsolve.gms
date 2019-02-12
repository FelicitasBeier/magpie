*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov_watdem(t,wat_dem,j,"marginal")         = v42_watdem.m(wat_dem,j);
 ov42_irrig_eff(t,j,"marginal")            = v42_irrig_eff.m(j);
 ov42_watavail(t,wat_src,j,"marginal")     = v42_watavail.m(wat_src,j);
 oq42_water_demand(t,wat_dem,j,"marginal") = q42_water_demand.m(wat_dem,j);
 oq42_water(t,j,"marginal")                = q42_water.m(j);
 ov_watdem(t,wat_dem,j,"level")            = v42_watdem.l(wat_dem,j);
 ov42_irrig_eff(t,j,"level")               = v42_irrig_eff.l(j);
 ov42_watavail(t,wat_src,j,"level")        = v42_watavail.l(wat_src,j);
 oq42_water_demand(t,wat_dem,j,"level")    = q42_water_demand.l(wat_dem,j);
 oq42_water(t,j,"level")                   = q42_water.l(j);
 ov_watdem(t,wat_dem,j,"upper")            = v42_watdem.up(wat_dem,j);
 ov42_irrig_eff(t,j,"upper")               = v42_irrig_eff.up(j);
 ov42_watavail(t,wat_src,j,"upper")        = v42_watavail.up(wat_src,j);
 oq42_water_demand(t,wat_dem,j,"upper")    = q42_water_demand.up(wat_dem,j);
 oq42_water(t,j,"upper")                   = q42_water.up(j);
 ov_watdem(t,wat_dem,j,"lower")            = v42_watdem.lo(wat_dem,j);
 ov42_irrig_eff(t,j,"lower")               = v42_irrig_eff.lo(j);
 ov42_watavail(t,wat_src,j,"lower")        = v42_watavail.lo(wat_src,j);
 oq42_water_demand(t,wat_dem,j,"lower")    = q42_water_demand.lo(wat_dem,j);
 oq42_water(t,j,"lower")                   = q42_water.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
