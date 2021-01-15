*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

table f42_wat_req_kve_cons(t_all,j,kve) Annual consumptive water demand for irrigation per ha derived from LPJmL blue water consumption (m^3 per yr)
$ondelim
$include "./modules/42_water_demand/input/wat_req_crops_c.cs2"
$offdelim
;
$if "%c42_watdem_scenario%" == "nocc" f42_wat_req_kve(t_all,j,kve) = f42_wat_req_kve("y1995",j,kve);
m_fillmissingyears(f42_wat_req_kve,"j,kve");


parameter f42_wat_req_kli(kli) Average water requirements of livestock commodities per region per tDM per year (m^3)
/
$ondelim
$include "./modules/42_water_demand/input/f42_wat_req_fao.csv"
$offdelim
/;
