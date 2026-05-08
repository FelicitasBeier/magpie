*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @title Water availability 
*'
*' @description The water availability module constrains freshwater availability 
*' for irrigation in MAgPIE based on potential irrigation water withdrawals 
*' determined in the water flow accumulation algorithm mrwater [@beier_technical_2023] 
*' based on annual runoff from a natural vegetation run from LPJmL [@vonBloh_implementing_2018].
*' This includes surface water runoff and shallow renewable groundwater.
*' Currently observed excessive water withdrawals in the initialization year
*' beyond locally available renewable freshwater resources are accounted for as 
*' non-renewable groundwater [@beier_irrigation_2026].
*' Information is passed to and received from the [42_water_demand] module.
*'
*' @authors Anne Biewald, Markus Bonsch, Felicitas Beier

*###################### R SECTION START (MODULETYPES) ##########################
$Ifi "%water_availability%" == "off" $include "./modules/43_water_availability/off/realization.gms"
$Ifi "%water_availability%" == "total_water_aug13" $include "./modules/43_water_availability/total_water_aug13/realization.gms"
$Ifi "%water_availability%" == "pot_irrig_water_mar26" $include "./modules/43_water_availability/pot_irrig_water_mar26/realization.gms"
*###################### R SECTION END (MODULETYPES) ############################
