*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

$setglobal c43_watavail_scenario  nocc
*   options:   cc  (climate change)
*             nocc (no climate change)

$setglobal c43_env_flow_policy  off
* options: on (environmental flow policy activated)
*          off (environmental flow policy deactivated)

$setglobal c43_non_ag_wat_demand  ssp2
* options: ssp1, ssp2, ssp3

parameters
f43_wat_avail_cons(t_all,j,EFPscen,nonagscen) Surface water available for irrigative consumption per cell derived from LPJmL discharge (mio. m^3 per yr)
/
$ondelim
$include "./modules/43_water_availability/input/avl_wat_agr_c.cs3"
$offdelim
/
;
$if "%c43_watavail_scenario%" == "nocc" f43_wat_avail_cons(t_all,j) = f43_wat_avail_cons("y1995",j,EFPscen,nonagscen);
m_fillmissingyears(f43_wat_avail_cons,"j",EFPscen,nonagscen);
