*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

variables
 vm_cost_AEI(i)                                    Annuitized irrigation expansion costs (mio. USD17MER per yr)
 vm_water_cost(i)                                  Cost of volumetric agricultural water pricing (mio. USD17MER per yr)
;

positive variables
 vm_AEI(j)                                         Area equipped for irrigation (mio. ha)
 vm_watdem(wat_dem,j)                              Amount of water needed in different sectors (mio. m^3 per yr)
;

parameters
 p25_AEI_start(t,j)                               Area equipped for irrigation at the beginning of each time step (mio. ha)
 pc25_AEI_start(j)                                Area equipped for irrigation at the beginning of current time step (mio. ha)
 p25_unitcost_AEI(i,invtype25)                    Unit cost of AEI expansion and maintenance (USD17MER per ha)
 i25_AEI_depr_share(t)                            Share of AEI at the beginning of the time step that depreciates during the time step (1)
 p25_PIA(t_all,j)                                 Potentially irrigated areas (mio. ha)
 i25_wat_req_k(t_all,j,k)                         LPJmL annual water demand for irrigation per ha per yr and livestock demand per ton per yr (m^3)
 ic25_wat_req_k(j,k)                              Current-timestep water demand coefficient (m^3)
 ic25_water_price(i)                              Effective volumetric water price in current time step (USD17MER per m^3)
 i25_wat_nonag(t,j,nonag25,wtype25)               Non-agricultural water demand and its supply in the selected scenario (mio. m^3 per yr)
 i25_wat_avail(t,j,wat_source25)                  Water availability for agriculture in the selected water scenario (mio. m^3 per yr)
;

positive variables
 v25_AEI_maintenance(j)                           Area equipped for irrigation to be maintained (mio. ha)
 v25_AEI_expansion(j)                             Area newly equipped for irrigation (mio. ha)
 v25_watavail(j,wat_source25)                     Water available from different sources (mio. m^3 per yr)
;

equations
 q25_area_irrig(j)                                Irrigation area constraint (mio. ha)
 q25_pia(j)                                       Potentially irrigated area constraint (mio. ha)
 q25_AEI_balance(j)                               Area equipped for irrigation stock equation (mio. ha)
 q25_AEI_maintenance_cap(j)                       Cap for AEI exposed to maintenance need (mio. ha)
 q25_cost_AEI(i)                                  Calculation of costs of irrigation area expansion (mio. USD17MER)
 q25_water_demand(wat_dem,j)                      Water withdrawals of different sectors (mio. m^3 per yr)
 q25_water_cost(i)                                Total cost of volumetric agricultural water pricing (mio. USD17MER per yr)
 q25_water_availability(j)                        Water availability constraint (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_AEI(t,i,type)                Annuitized irrigation expansion costs (mio. USD17MER per yr)
 ov_water_cost(t,i,type)              Cost of volumetric agricultural water pricing (mio. USD17MER per yr)
 ov_AEI(t,j,type)                     Area equipped for irrigation (mio. ha)
 ov_watdem(t,wat_dem,j,type)          Amount of water needed in different sectors (mio. m^3 per yr)
 ov25_AEI_maintenance(t,j,type)       Area equipped for irrigation to be maintained (mio. ha)
 ov25_AEI_expansion(t,j,type)         Area newly equipped for irrigation (mio. ha)
 ov25_watavail(t,j,wat_source25,type) Water available from different sources (mio. m^3 per yr)
 oq25_area_irrig(t,j,type)            Irrigation area constraint (mio. ha)
 oq25_pia(t,j,type)                   Potentially irrigated area constraint (mio. ha)
 oq25_AEI_balance(t,j,type)           Area equipped for irrigation stock equation (mio. ha)
 oq25_AEI_maintenance_cap(t,j,type)   Cap for AEI exposed to maintenance need (mio. ha)
 oq25_cost_AEI(t,i,type)              Calculation of costs of irrigation area expansion (mio. USD17MER)
 oq25_water_demand(t,wat_dem,j,type)  Water withdrawals of different sectors (mio. m^3 per yr)
 oq25_water_cost(t,i,type)            Total cost of volumetric agricultural water pricing (mio. USD17MER per yr)
 oq25_water_availability(t,j,type)    Water availability constraint (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
