*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


$setglobal cm_env_flow_policy off
$setglobal cm_watdem_nonagr_scenario ssp2

$setglobal c43_watavail_scenario  cc
*   options:  cc        (climate change)
*             nocc      (no climate change)
*             nocc_hist (no climate change after year defined by sm_fix_cc)

table
f43_wat_avail(t_all,j,EFP,scen_watdem_nonagr,pww43) Total water availability for different purposes (mio. m^3 per yr)
$ondelim
$include "./modules/43_water_availability/pot_irrig_water_mar26/input/pot_irr_wat.cs3"
$offdelim
;
* set values to 1995 if nocc scenario is used, or to sm_fix_cc after sm_fix_cc if nocc_hist is used
$ifthen "%c43_watavail_scenario%" == "nocc" f43_wat_avail(t_all,j,EFP,scen_watdem_nonagr,pww43) = f43_wat_avail("y1995",j,EFP,scen_watdem_nonagr,pww43);
$elseif "%c43_watavail_scenario%" == "nocc_hist" f43_wat_avail(t_all,j,EFP,scen_watdem_nonagr,pww43)$(m_year(t_all) > sm_fix_cc) = f43_wat_avail(t_all,j,EFP,scen_watdem_nonagr,pww43)$(m_year(t_all) = sm_fix_cc);
$endif
m_fillmissingyears(f43_wat_avail,"j,EFP,scen_watdem_nonagr,pww43");
