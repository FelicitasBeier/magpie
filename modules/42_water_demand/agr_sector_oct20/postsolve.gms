*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov_agwatdem(t,j,"marginal")       = vm_agwatdem.m(j);
 oq42_agwat_demand(t,j,"marginal") = q42_agwat_demand.m(j);
 ov_agwatdem(t,j,"level")          = vm_agwatdem.l(j);
 oq42_agwat_demand(t,j,"level")    = q42_agwat_demand.l(j);
 ov_agwatdem(t,j,"upper")          = vm_agwatdem.up(j);
 oq42_agwat_demand(t,j,"upper")    = q42_agwat_demand.up(j);
 ov_agwatdem(t,j,"lower")          = vm_agwatdem.lo(j);
 oq42_agwat_demand(t,j,"lower")    = q42_agwat_demand.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
