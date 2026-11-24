*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

$setglobal c25_water_scenario  ssp2
*   options:  ssp1, ssp2, ssp2efp, ssp2strict, ssp3
*             (water scenario from mrwater combining environmental flow
*              protection and non-agricultural water demand;
*              ssp2strict: sensitivity scenario, ssp2 with stricter accessibility of discharge
*              for potential irrigation, not harmonized with ssp2)

scalars
s25_AEI_depreciation               Annual depreciation rate of area equipped for irrigation (1) / 0.025 /
s25_water_price                    Volumetric price for agricultural water withdrawals (USD17MER per m^3) / 0 /
s25_water_price_startyear          Year from which volumetric water pricing is implemented / 2025 /
;

$setglobal c25_climate_scenario  cc
*   options:  cc        (climate change)
*             nocc_hist (no climate change after year defined by sm_fix_cc;
*                        sm_fix_cc must agree with the harmonization year of the mrwater inputs, checked in preloop)
*   Applies to all mrwater water inputs (clim25) and to the water requirements per ha.

$if not "%c25_climate_scenario%" == "cc" $if not "%c25_climate_scenario%" == "nocc_hist" $abort "Module 25: c25_climate_scenario must be cc or nocc_hist"

* End of the harmonization period of the mrwater inputs: until this year,
* all water scenarios follow ssp2 (must agree with sm_fix_SSP2, checked in preloop)
parameter
f25_harmonization(harm25) End of the harmonization period of the mrwater inputs (year)
/
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/f25_harmonization_year.csv"
$offdelim
/
;

table
f25_cost_irrig(t,i,invtype25) Irrigation investment costs (USD17MER per ha)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/f25_irrig_unit_cost.csv"
$offdelim
;

parameter
f25_irrig(t_ini25,j) Area irrigated in the past and already equipped for irrigation (mio. ha)
/
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/area_irrig_ini.cs2"
$offdelim
/
;

table
f25_pia(t_all,j,scen25,clim25) Potentially irrigated areas including areas irrigated with non-renewable groundwater (mio. ha)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/area_pot_irrig.cs3"
$offdelim
;
m_fillmissingyears(f25_pia,"j,scen25,clim25");

* Water requirements with the current multiple cropping pattern (mrwater multicropping = TRUE:actual:irrig_crop)
table
f25_wat_req_kve(t_all,j,kve) Annual crop water requirements for irrigation as withdrawals per ha (m^3 per yr)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/irrig_req_crop_actualMC.cs2"
$offdelim
;
$if "%c25_climate_scenario%" == "nocc_hist" f25_wat_req_kve(t_all,j,kve)$(m_year(t_all) > sm_fix_cc) = f25_wat_req_kve(t_all,j,kve)$(m_year(t_all) = sm_fix_cc);
m_fillmissingyears(f25_wat_req_kve,"j,kve");

parameter
f25_wat_req_kli(kli) Average water requirements of livestock commodities per region per tDM per year (m^3 per yr)
/
$ondelim
$include "./modules/42_water_demand/input/f42_wat_req_fao.csv"
$offdelim
/
;

* Non-agricultural water use from the mrwater river routing (annual):
* demand, demand served from renewable sources, and unmet demand
* (neither served from renewable sources nor from non-renewable groundwater).
* Used for reporting only.
table
f25_wat_nonag(t_all,j,scen25,clim25,nonag25,wtype25) Non-agricultural water demand and its supply (mio. m^3 per yr)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/wat_nonag.cs3"
$offdelim
;
m_fillmissingyears(f25_wat_nonag,"j,scen25,clim25,nonag25,wtype25");

* Potential water withdrawals and consumption for agriculture from renewable sources
* (non-agricultural use and environmental flow requirements of the scenario already subtracted)
table
f25_wat_avail(t_all,j,scen25,clim25,wtype25) Renewable water available for agriculture (mio. m^3 per yr)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/pot_irr_wat.cs3"
$offdelim
;
m_fillmissingyears(f25_wat_avail,"j,scen25,clim25,wtype25");

* Non-renewable groundwater withdrawal pool (scenario-independent):
* missing water of each year until the harmonization year, constant afterwards
table
f25_nonren_gw(t_all,j,nonren25) Non-renewable groundwater withdrawal pool for agriculture and non-agricultural uses (mio. m^3 per yr)
$ondelim
$include "./modules/25_irrigation/pot_irrig_may26/input/nonren_gw.cs2"
$offdelim
;
m_fillmissingyears(f25_nonren_gw,"j,nonren25");
