*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

* The harmonization year of the mrwater inputs (all water scenarios follow ssp2 until then) must agree with sm_fix_SSP2
abort$(sm_fix_SSP2 <> f25_harmonization("harmonization_year")) "Module 25: sm_fix_SSP2 differs from the harmonization year of the mrwater inputs";
* nocc_hist: climate in the mrwater inputs is held constant from the harmonization year on, which must agree with sm_fix_cc
$if "%c25_climate_scenario%" == "nocc_hist" abort$(sm_fix_cc <> f25_harmonization("harmonization_year")) "Module 25: sm_fix_cc differs from the harmonization year of the mrwater inputs (climate freeze year of nocc_hist)";

*' Area equipped for irrigation in initialization year
pc25_AEI_start(j) = f25_irrig("y1995",j);

*' Potenially irrigated area scenario selection
p25_PIA(t_all,j) = f25_pia(t_all,j,"%c25_water_scenario%","%c25_climate_scenario%");

*' Share of AEI that depreciates within a time step (geometric depreciation over the time step length).
*' No depreciation in the initialization time step, so that AEI reproduces the initial irrigated areas.
i25_AEI_depr_share(t) = (1 - (1 - s25_AEI_depreciation)**m_yeardiff(t))$(ord(t) > 1);

*' Unit costs for irrigation expansion
p25_unitcost_AEI(i,invtype25) = f25_cost_irrig("y1995",i,invtype25);
*To Do: make unit cost convergence scenario dependent (SSP2: converge to cheapest; SSP3, SSP4: keep as is).
*Currently: one time step (initialization)

i25_wat_req_k(t,j,kve) = f25_wat_req_kve(t,j,kve);
i25_wat_req_k(t,j,kli) = f25_wat_req_kli(kli);

*' Freshwater sources available for agricultural usage are provided 
*' by mrwater preprocessing.
*' It includes renewable resources (river discharge from precipitation,
*' including surface water flows and shallow / renewable groundwater)
*' and non-renewable water resources (e.g., fossil groundwater) that are
*' derived from historical water withdrawals beyond locally available
*' renewable freshwater resources (until the harmonization year, constant afterwards).
*' The non-renewable groundwater pool is available in all scenarios.
*' Water reserved for non-agricultural purposes (exogenous to MAgPIE)
*' are already subtracted, such that these freshwater sources are those 
*' available for agricultural usage.
*' Technical water refers to desalination and is not explicitly accounted for in MAgPIE.
i25_wat_avail(t,j,"renewable") = f25_wat_avail(t,j,"%c25_water_scenario%","%c25_climate_scenario%","withdrawal");
i25_wat_avail(t,j,"non_renewable") = f25_nonren_gw(t,j,"nonren_ag");
i25_wat_avail(t,j,"technical") = 0;

*' Non-agricultural water use of the selected scenario (reporting only)
i25_wat_nonag(t,j,nonag25,wtype25) = f25_wat_nonag(t,j,"%c25_water_scenario%","%c25_climate_scenario%",nonag25,wtype25);

*' Where exogenous water demands exceed renewable and non-renewable water availability,
*' technical water resources (e.g., desalination) can provide the missing water.
*** To Do: Delete if this is no longer needed. (If it can be deleted: simplify: v25_watavail no longer needed. Just use i25_wat_avail)
*v25_watavail.fx("technical",j) = v25_watavail.up(j,"technical")
*                             + (((sum(watdem_exo25, vm_watdem.lo(watdem_exo25,j)) - sum(wat_source25,v25_watavail.up(j,wat_source25))) * 1.01))
*                             $(sum(watdem_exo25, vm_watdem.lo(watdem_exo25,j)) - sum(wat_source25,v25_watavail.up(j,wat_source25)) > 0);
