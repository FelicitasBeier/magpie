*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
 p41_AEI_start(t,j)              Area equipped for irrigation at the beginning of each time step (mio. ha)
 pc41_AEI_start(j)               Area equipped for irrigation at the beginning of current time step (mio. ha)
 p41_unitcost_AEI(i,invtype41)   Unit cost of AEI expansion and maintenance (USD17MER per ha)
 p41_PIA(t_all,j)                Potentially irrigated areas (mio. ha)
 ;

positive variables
 v41_AEI_maintenance(j)          Area equipped for irrigation to be maintained (mio. ha)
 v41_AEI_expansion(j)            Area newly equipped for irrigation (mio. ha)
;

equations
 q41_area_irrig(j)               Irrigation area constraint (mio. ha)
 q41_pia(j)                      Potentially irrigated area constraint (mio. ha)
 q41_AEI_balance(j)              Area equipped for irrigation stock equation (mio. ha)
 q41_AEI_maintenance_cap(j)      Cap for AEI exposed to maintenance need (mio. ha)
 q41_cost_AEI(i)                 Calculation of costs of irrigation area expansion (mio. USD17MER)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_AEI(t,i,type)     Annuitized irrigation expansion costs (mio. USD17MER per yr)
 ov_AEI(t,j,type)          Area equipped for irrigation in each grid cell (mio. ha)
 ov41_AEI_maintenance(t,j,type)    Area equipped for irrigation to be maintained (mio. ha)
 ov41_AEI_expansion(t,j,type)      Area newly equipped for irrigation (mio. ha)
 oq41_area_irrig(t,j,type) Irrigation area constraint (mio. ha)
 oq41_pia(t,j,type)                 Potentially irrigated area constraint (mio. ha)
 oq41_AEI_balance(t,j,type)         Area equipped for irrigation stock equation (mio. ha)
 oq41_AEI_maintenance_cap(t,j,type) Cap for AEI exposed to maintenance need (mio. ha)
 oq41_cost_AEI(t,i,type)   Calculation of costs of irrigation area expansion (mio. USD17MER)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
