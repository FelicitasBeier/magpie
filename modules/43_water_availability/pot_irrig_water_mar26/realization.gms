*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' Water availability for irrigation is based on potential irrigation water withdrawals 
*' determined in the water flow accumulation algorithm mrwater [@beier_technical_2023] 
*' based on annual runoff from a natural vegetation run from LPJmL [@vonBloh_implementing_2018].
*' It includes renewable freshwater resources, i.e. runoff generated from precipitation 
*' and snowfall. Assuming a long-term water balance, all runoff is assumed to enter rivers, 
*' neglecting groundwater recharge. 
*' Currently observed excessive water withdrawals in the initialization year
*' beyond locally available renewable freshwater resources are accounted for as 
*' non-renewable groundwater [@beier_irrigation_2026].
*'
*' There is an interface to the [42_water_demand] module. If exogenous
*' non-agricultural water demand exceeds available water the missing amount is available
*' from groundwater to avoid infeasibility.

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/43_water_availability/pot_irrig_water_mar26/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/43_water_availability/pot_irrig_water_mar26/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/43_water_availability/pot_irrig_water_mar26/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/43_water_availability/pot_irrig_water_mar26/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/43_water_availability/pot_irrig_water_mar26/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/43_water_availability/pot_irrig_water_mar26/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/43_water_availability/pot_irrig_water_mar26/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/43_water_availability/pot_irrig_water_mar26/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
