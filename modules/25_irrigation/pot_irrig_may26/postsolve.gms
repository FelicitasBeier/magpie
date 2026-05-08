*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

pc25_AEI_start(j) = vm_AEI.l(j);

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
ov_cost_AEI(t,i,"marginal") = vm_cost_AEI.m(i);
ov_AEI(t,j,"marginal") = vm_AEI.m(j);
ov_watdem(t,wat_dem,j,"marginal") = vm_watdem.m(wat_dem,j);
ov_water_cost(t,i,"marginal") = vm_water_cost.m(i);
ov25_AEI_maintenance(t,j,"marginal") = v25_AEI_maintenance.m(j);
ov25_AEI_expansion(t,j,"marginal") = v25_AEI_expansion.m(j);
ov25_watavail(t,wat_source25,j,"marginal") = v25_watavail.m(j,wat_source25);
oq25_area_irrig(t,j,"marginal") = q25_area_irrig.m(j);
oq25_pia(t,j,"marginal") = q25_pia.m(j);
oq25_AEI_balance(t,j,"marginal") = q25_AEI_balance.m(j);
oq25_AEI_maintenance_cap(t,j,"marginal") = q25_AEI_maintenance_cap.m(j);
oq25_cost_AEI(t,i,"marginal") = q25_cost_AEI.m(i);
oq25_water_demand(t,wat_dem,j,"marginal") = q25_water_demand.m(wat_dem,j);
oq25_water_cost(t,i,"marginal") = q25_water_cost.m(i);
oq25_water_availability(t,j,"marginal") = q25_water_availability.m(j);

ov_cost_AEI(t,i,"level") = vm_cost_AEI.l(i);
ov_AEI(t,j,"level") = vm_AEI.l(j);
ov_watdem(t,wat_dem,j,"level") = vm_watdem.l(wat_dem,j);
ov_water_cost(t,i,"level") = vm_water_cost.l(i);
ov25_AEI_maintenance(t,j,"level") = v25_AEI_maintenance.l(j);
ov25_AEI_expansion(t,j,"level") = v25_AEI_expansion.l(j);
ov25_watavail(t,wat_source25,j,"level") = v25_watavail.l(j,wat_source25);
oq25_area_irrig(t,j,"level") = q25_area_irrig.l(j);
oq25_pia(t,j,"level") = q25_pia.l(j);
oq25_AEI_balance(t,j,"level") = q25_AEI_balance.l(j);
oq25_AEI_maintenance_cap(t,j,"level") = q25_AEI_maintenance_cap.l(j);
oq25_cost_AEI(t,i,"level") = q25_cost_AEI.l(i);
oq25_water_demand(t,wat_dem,j,"level") = q25_water_demand.l(wat_dem,j);
oq25_water_cost(t,i,"level") = q25_water_cost.l(i);
oq25_water_availability(t,j,"level") = q25_water_availability.l(j);

ov_cost_AEI(t,i,"upper") = vm_cost_AEI.up(i);
ov_AEI(t,j,"upper") = vm_AEI.up(j);
ov_watdem(t,wat_dem,j,"upper") = vm_watdem.up(wat_dem,j);
ov_water_cost(t,i,"upper") = vm_water_cost.up(i);
ov25_AEI_maintenance(t,j,"upper") = v25_AEI_maintenance.up(j);
ov25_AEI_expansion(t,j,"upper") = v25_AEI_expansion.up(j);
ov25_watavail(t,wat_source25,j,"upper") = v25_watavail.up(j,wat_source25);
oq25_area_irrig(t,j,"upper") = q25_area_irrig.up(j);
oq25_pia(t,j,"upper") = q25_pia.up(j);
oq25_AEI_balance(t,j,"upper") = q25_AEI_balance.up(j);
oq25_AEI_maintenance_cap(t,j,"upper") = q25_AEI_maintenance_cap.up(j);
oq25_cost_AEI(t,i,"upper") = q25_cost_AEI.up(i);
oq25_water_demand(t,wat_dem,j,"upper") = q25_water_demand.up(wat_dem,j);
oq25_water_cost(t,i,"upper") = q25_water_cost.up(i);
oq25_water_availability(t,j,"upper") = q25_water_availability.up(j);

ov_cost_AEI(t,i,"lower") = vm_cost_AEI.lo(i);
ov_AEI(t,j,"lower") = vm_AEI.lo(j);
ov_watdem(t,wat_dem,j,"lower") = vm_watdem.lo(wat_dem,j);
ov_water_cost(t,i,"lower") = vm_water_cost.lo(i);
ov25_AEI_maintenance(t,j,"lower") = v25_AEI_maintenance.lo(j);
ov25_AEI_expansion(t,j,"lower") = v25_AEI_expansion.lo(j);
ov25_watavail(t,wat_source25,j,"lower") = v25_watavail.lo(j,wat_source25);
oq25_area_irrig(t,j,"lower") = q25_area_irrig.lo(j);
oq25_pia(t,j,"lower") = q25_pia.lo(j);
oq25_AEI_balance(t,j,"lower") = q25_AEI_balance.lo(j);
oq25_AEI_maintenance_cap(t,j,"lower") = q25_AEI_maintenance_cap.lo(j);
oq25_cost_AEI(t,i,"lower") = q25_cost_AEI.lo(i);
oq25_water_demand(t,wat_dem,j,"lower") = q25_water_demand.lo(wat_dem,j);
oq25_water_cost(t,i,"lower") = q25_water_cost.lo(i);
oq25_water_availability(t,j,"lower") = q25_water_availability.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
