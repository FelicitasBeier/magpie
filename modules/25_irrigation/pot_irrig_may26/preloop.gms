*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' Area equipped for irrigation in initialization year
pc25_AEI_start(j) = f25_irrig("y1995",j);

*' Potenially irrigated area scenario selection
p25_PIA(t_all,j) = f25_pia(t_all,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%");

*' Unit costs for irrigation expansion
p25_unitcost_AEI(i,invtype25) = f25_cost_irrig("y1995",i,invtype25);
*To Do: make unit cost convergence scenario dependent (SSP2: converge to cheapest; SSP3, SSP4: keep as is).
*Currently: one time step (initialization)

i25_wat_req_k(t,j,kve) = f25_wat_req_kve(t,j,kve);
i25_env_flows(t,j) = f25_env_flows(t,j);
i25_wat_req_k(t,j,kli) = f25_wat_req_kli(kli);

* Fixed country weights for country-selection logic.
* Use baseline irrigation water availability in the initial year.
* Weight is fixed to y1995, EFP = off, non-agricultural water demand scenario = ssp2.
p25_wat_avl_weight_iso(iso) =
  sum(pww25$(sameas(pww25,"ren_ag") OR sameas(pww25,"nonren_ag")),
    f25_wat_avl_iso("y1995",iso,"off","ssp2",pww25));

p25_wat_avl_weight_reg(i) =
  sum(i_to_iso(i,iso), p25_wat_avl_weight_iso(iso));

* Diagnostic output only for first-run assessment. Remove before merging.
p25_wat_avl_weight_iso_zero(iso) = 1$(p25_wat_avl_weight_iso(iso) = 0);
p25_wat_avl_weight_reg_zero(i) = 1$(p25_wat_avl_weight_reg(i) = 0);
display p25_wat_avl_weight_iso_zero, p25_wat_avl_weight_reg_zero;

* Trajectory for environmental flow policy
* (linear interpolation from start year to target year)
p25_EFP(t_all,"off") = 0;
m_linear_time_interpol(p25_EFP_fader, s25_EFP_startyear, s25_EFP_targetyear, 0, 1);
p25_EFP(t_all, "on") = p25_EFP_fader(t_all);

*' Freshwater sources available for agricultural usage are provided 
*' by mrwater preprocessing.
*' It includes renewable resources (river discharge from precipitation,
*' including surface water flows and shallow / renewable groundwater)
*' and non-renewable water resources (e.g., fossil groundwater) that are
*' derived based on  current excessive water withdrawals in the initialization year
*' beyond locally available renewable freshwater resources.
*' Water reserved for non-agricultural purposes (exogenous to MAgPIE)
*' are already subtracted, such that these freshwater sources are those 
*' available for agricultural usage.
*' Technical water refers to desalination and is not explicitly accounted for in MAgPIE.
i25_wat_avail(t,j,EFP25,scen_watdem_nonagr25,"renewable") = f25_wat_avail(t,j,EFP25,scen_watdem_nonagr25,"ren_ag");
i25_wat_avail(t,j,EFP25,scen_watdem_nonagr25,"non_renewable") = f25_wat_avail(t,j,EFP25,scen_watdem_nonagr25,"nonren_ag");
i25_wat_avail(t,j,EFP25,scen_watdem_nonagr25,"technical") = 0;

*' Where exogenous water demands exceed renewable and non-renewable water availability,
*' technical water resources (e.g., desalination) can provide the missing water.
*** To Do: Delete if this is no longer needed. (If it can be deleted: simplify: v25_watavail no longer needed. Just use i25_wat_avail)
*v25_watavail.fx("technical",j) = v25_watavail.up(j,"technical")
*                             + (((sum(watdem_exo25, vm_watdem.lo(watdem_exo25,j)) - sum(wat_source25,v25_watavail.up(j,wat_source25))) * 1.01))
*                             $(sum(watdem_exo25, vm_watdem.lo(watdem_exo25,j)) - sum(wat_source25,v25_watavail.up(j,wat_source25)) > 0);
