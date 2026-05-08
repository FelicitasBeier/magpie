*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

*' Irrigated area is constrained by area equipped for irrigation (AEI).
q25_area_irrig(j2) ..
  sum(kcr, vm_area(j2,kcr,"irrigated")) =l= vm_AEI(j2);

*' Potentially irrigated areas (PIA) determined in by hydro-economic water allocation
*' algorithm in preprocessing (mrwater library) constrain irrigation expansion.
q25_pia(j2) ..
  sum(kcr, vm_area(j2,kcr,"irrigated")) =l= sum(ct, p25_PIA(ct,j2));

*' Area equipped for irrigation can be expanded endogenously, but is also exposed to depreciation
*' by a fraction that can be chosen by the user (`s25_AEI_depreciation)
q25_AEI_balance(j2)..
  vm_AEI(j2) =e=
    ((1 - s25_AEI_depreciation)**(m_timestep_length)) * pc25_AEI_start(j2)
    + v25_AEI_maintenance(j2)
    + v25_AEI_expansion(j2);

q25_AEI_maintenance_cap(j2)..
  v25_AEI_maintenance(j2) =l=
      (1 - ((1 - s25_AEI_depreciation) ** m_timestep_length)) * pc25_AEI_start(j2);

*' Irrigation expansion requires investment that is associated with investment costs that differ by region.
*' They area parametrized based on data by [inocencio_costs_2007].
*' Following [palazzo_investment_2019], MAgPIE distinguishes unit costs for irrigation for new irrigation establishment
*' and maintenance of existing irrigated area using unit cost data by [inocencio_costs_2007].
*' MAgPIE has a common planning horizon to which all one time investments are distributed using an annuity
*' approach.
q25_cost_AEI(i2)..
  vm_cost_AEI(i2) =e=
    (sum(cell(i2,j2), v25_AEI_expansion(j2)) * p25_unitcost_AEI(i2,"expansion")
    + sum(cell(i2,j2), v25_AEI_maintenance(j2)) * p25_unitcost_AEI(i2,"maintenance"))
    * sum(ct, pm_interest(ct,i2) / (1 + pm_interest(ct,i2)));

*' Agricultural water demand is composed by livestock water demand and
*' demand for irrigation water withdrawals.
q25_water_demand("agriculture",j2) ..
  vm_watdem("agriculture",j2) =e=
    sum(kcr, vm_area(j2,kcr,"irrigated") * ic25_wat_req_k(j2,kcr))
  + sum(kli, vm_prod(j2,kli) * ic25_wat_req_k(j2,kli));

*' Volumetric water pricing in agricultural sector can be chosen by the user.
*** To Do: implement time frame for this
q25_water_cost(i2) ..
  vm_water_cost(i2) =e= sum(cell(i2,j2), vm_watdem("agriculture",j2)) * ic25_water_price(i2);

*' Water withdrawals for agriculture cannot exceed available water
*' for agricultural purposes from all sources.
q25_water_availability(j2) ..
  vm_watdem("agriculture",j2) =l= sum(wat_source25, v25_watavail(j2,wat_source25));
