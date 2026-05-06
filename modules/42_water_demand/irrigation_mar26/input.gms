*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

$setglobal cm_env_flow_policy off
$setglobal cm_watdem_nonagr_scenario ssp2

scalars
s42_env_flow_scenario              Environmental flow protection scenario         (1)      / 2 /
*                                  0: don't consider environmental flows.
*                                                                          s42_env_flow_base_fraction and
*                                                                          s42_env_flow_fraction have no effect.
*                                  1: Reserve a certain fraction of available water
*                                     specified by s42_env_flow_fraction for
*                                     environmental flows.
*                                  2: Each grid cell receives its own value for
*                                     environmental flow protection based on LPJ
*                                     results and a calculation algorithm by Smakhtin 2004.
*                                                                          s42_env_flow_fraction has no effect.

* Linear fading in of environmental flow policy between startyear and targetyear
s42_EFP_startyear                  Environmental flow policy start year   / 2025 /
s42_EFP_targetyear                 Environmental flow policy target year  / 2040 /
s42_env_flow_base_fraction         Fraction of available water that is reserved for the environment if no EFR protection policy is implemented (1)           / 0.05 /
s42_env_flow_fraction              Fraction of available water that is reserved under protection policies (1) / 0.2 /
s42_water_price                    Volumetric price for agricultural water withdrawals (USD17MER per m^3) / 0 /
s42_water_price_startyear          Year from which volumetric water pricing is implemented / 2025 /
;

$setglobal c42_watdem_scenario  cc
*   options:  cc        (climate change)
*             nocc      (no climate change)
*             nocc_hist (no climate change after year defined by sm_fix_cc)

* Set-switch for countries affected by EFP
* Default: all iso countries selected
sets
  EFP_countries(iso) countries to be affected by EFP
                      / #iso /
  water_pricing_countries(iso) countries to be affected by volumetric water pricing
                      / #iso /
;

***To Do: with multiple cropping update: new set with off and main season water demand
table f42_wat_req_kve(t_all,j,kve) Annual crop water requirements for irrigation as withdrawals per ha (m^3 per yr)
$ondelim
$include "./modules/42_water_demand/irrigation_mar26/input/irrig_req_crop.cs2"
$offdelim
;
$if "%c42_watdem_scenario%" == "nocc" f42_wat_req_kve(t_all,j,kve) = f42_wat_req_kve("y1995",j,kve);
$if "%c42_watdem_scenario%" == "nocc_hist" f42_wat_req_kve(t_all,j,kve)$(m_year(t_all) > sm_fix_cc) = f42_wat_req_kve(t_all,j,kve)$(m_year(t_all) = sm_fix_cc);
m_fillmissingyears(f42_wat_req_kve,"j,kve");

table f42_wat_avl_iso(t_all,iso,EFP,scen_watdem_nonagr,pww43) ISO-level water availability for different purposes (mio. m^3 per yr)
$ondelim
$include "./modules/42_water_demand/irrigation_mar26/input/pot_irr_wat_iso.cs3"
$offdelim
;
$if "%c42_watdem_scenario%" == "nocc" f42_wat_avl_iso(t_all,iso,EFP,scen_watdem_nonagr,pww43) = f42_wat_avl_iso("y1995",iso,EFP,scen_watdem_nonagr,pww43);
$if "%c42_watdem_scenario%" == "nocc_hist" f42_wat_avl_iso(t_all,iso,EFP,scen_watdem_nonagr,pww43)$(m_year(t_all) > sm_fix_cc) = f42_wat_avl_iso(t_all,iso,EFP,scen_watdem_nonagr,pww43)$(m_year(t_all) = sm_fix_cc);
m_fillmissingyears(f42_wat_avl_iso,"iso,EFP,scen_watdem_nonagr,pww43");

parameter f42_wat_req_kli(kli) Average water requirements of livestock commodities per region per tDM per year (m^3 per yr)
/
$ondelim
$include "./modules/42_water_demand/input/f42_wat_req_fao.csv"
$offdelim
/
;

table f42_watdem_ineldo(t_all,j,scen_watdem_nonagr,watdem_ineldo,wtype) Manufacturing electricity and domestic water demand under different socioeconomic scenarios in the growing period (mio. m^3)
$ondelim
$include "./modules/42_water_demand/input/watdem_nonagr_grper.cs3"
$offdelim
;
m_fillmissingyears(f42_watdem_ineldo,"j,scen_watdem_nonagr,watdem_ineldo,wtype");

* This input is not used within MAgPIE, but necessary for the postprocessing
table f42_watdem_ineldo_total(t_all,j,scen_watdem_nonagr,watdem_ineldo,wtype) Manufacturing electricity and domestic water demand under different socioeconomic scenarios in the entire year (mio. m^3)
$ondelim
$if exist "./modules/42_water_demand/input/watdem_nonagr_total.cs3"  $include "./modules/42_water_demand/input/watdem_nonagr_total.cs3"
$offdelim
;
m_fillmissingyears(f42_watdem_ineldo_total,"j,scen_watdem_nonagr,watdem_ineldo,wtype");

parameter
f42_env_flows(t_all,j) Environmental flow requirements from LPJ and Smakhtin algorithm (mio. m^3)
/
$ondelim
$include "./modules/42_water_demand/input/lpj_envflow_grper.cs2"
$offdelim
/
;
$if "%c42_watdem_scenario%" == "nocc" f42_env_flows(t_all,j) = f42_env_flows("y1995",j);
$if "%c42_watdem_scenario%" == "nocc_hist" f42_env_flows(t_all,j)$(m_year(t_all) > sm_fix_cc) = f42_env_flows(t_all,j)$(m_year(t_all) = sm_fix_cc);
m_fillmissingyears(f42_env_flows,"j");
