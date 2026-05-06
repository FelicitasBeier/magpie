*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

*' Irrigated area is constrained by area equipped for irrigation (AEI).
q41_area_irrig(j2) ..
  sum(kcr, vm_area(j2,kcr,"irrigated")) =l= vm_AEI(j2);

*' Potentially irrigated areas (PIA) determined in by hydro-economic water allocation
*' algorithm in preprocessing (mrwater library) constrain irrigation expansion.
q41_pia(j2) ..
  sum(kcr, vm_area(j2,kcr,"irrigated")) =l= sum(ct, p41_PIA(ct,j2));

*' Area equipped for irrigation can be expanded endogenously, but is also exposed to depreciation
*' by a fraction that can be chosen by the user (`s41_AEI_depreciation)
q41_AEI_balance(j2)..
  vm_AEI(j2) =e=
    ((1 - s41_AEI_depreciation)**(m_timestep_length)) * pc41_AEI_start(j2)
    + v41_AEI_maintenance(j2)
    + v41_AEI_expansion(j2);

q41_AEI_maintenance_cap(j2)..
  v41_AEI_maintenance(j2) =l=
      (1 - ((1 - s41_AEI_depreciation) ** m_timestep_length)) * pc41_AEI_start(j2);

*' Irrigation expansion requires investment that is associated with investment costs that differ by region.
*' They area parametrized based on data by [inocencio_costs_2007].
*' Following [palazzo_investment_2019], MAgPIE distinguishes unit costs for irrigation for new irrigation establishment
*' and maintenance of existing irrigated area using unit cost data by [inocencio_costs_2007].
*' MAgPIE has a common planning horizon to which all one time investments are distributed using an annuity
*' approach.
q41_cost_AEI(i2)..
  vm_cost_AEI(i2) =e=
    (sum(cell(i2,j2), v41_AEI_expansion(j2)) * p41_unitcost_AEI(i2,"expansion")
    + sum(cell(i2,j2), v41_AEI_maintenance(j2)) * p41_unitcost_AEI(i2,"maintenance"))
    * sum(ct, pm_interest(ct,i2) / (1 + pm_interest(ct,i2)));
