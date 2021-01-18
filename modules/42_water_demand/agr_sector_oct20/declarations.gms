*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 i42_wat_req_k_cons(t,j,k)       	 LPJmL annual water demand for irrigation per ha per year (m^3) + Livestock demand per ton (m^3)
 ic42_wat_req_k_cons(j,k)        	 LPJmL annual water demand for irrigation per ha per year (m^3) + Livestock demand per ton (m^3)
;

equations
 q42_agwat_demand(j)               Agricultural water consumption (mio. m^3 per yr)
;

positive variables
  vm_agwatdem(j)                   Water demand from different sectors (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_agwatdem(t,j,type)       Water demand from different sectors (mio. m^3 per yr)
 oq42_agwat_demand(t,j,type) Agricultural water consumption (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
