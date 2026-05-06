*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

$setglobal cm_env_flow_policy off
$setglobal cm_watdem_nonagr_scenario ssp2

scalars
s41_AEI_depreciation Depreciation rate in capital value of irrigation infrastructure (USD17PPP per USD17PPP) / 0 /
;

table
f41_cost_irrig(t,i,invtype41) Irrigation investment costs (USD17MER per ha)
$ondelim
$include "./modules/41_area_equipped_for_irrigation/endo_mar26/input/f41_irrig_unit_cost.csv"
$offdelim
;

parameter
f41_irrig(t_ini41,j) Area irrigated in the past and already equipped for irrigation (mio. ha)
/
$ondelim
$include "./modules/41_area_equipped_for_irrigation/endo_mar26/input/area_irrig_ini.cs2"
$offdelim
/
;

table
f41_pia(t_all,j,EFP,nonAgWat) Potentially irrigated areas under future climatic and hydrologic conditions (mio. ha)
$ondelim
$include "./modules/41_area_equipped_for_irrigation/endo_mar26/input/area_pot_irrig.cs3"
$offdelim
;
