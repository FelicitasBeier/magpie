*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' The calculation of available water as described below happens
*' in the MAgPIE preprocessing.
*' Only renewable surfaces water resources are considered, i.e.
*' runoff generated from precipitation. All runoff is assumed to
*' enter rivers, neglecting groundwater recharge. Other water resources
*' such as fossil groundwater, discharge from melting glaciers or
*' desalination are not considered.
*'
*' DESCRIBE RIVER ROUTING AND ALLOCATION ALGORITHM HERE

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/43_water_availability/total_water_aug13/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/43_water_availability/total_water_aug13/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/43_water_availability/total_water_aug13/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/43_water_availability/total_water_aug13/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/43_water_availability/total_water_aug13/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/43_water_availability/total_water_aug13/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/43_water_availability/total_water_aug13/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
