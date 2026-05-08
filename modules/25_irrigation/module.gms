*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @title Irrigation
*'
*' @description The irrigation module determines irrigated areas and 
*' irrigation water withdrawals based on area equipped for irrigation, 
*' agricultural water demand, and irrigation water availability. 
*' It also calculates the cost of irrigation expansion and volumetric water pricing, 
*' depending on the scenario settings.
*'
*' @authors Felicitas Beier

*###################### R SECTION START (MODULETYPES) ##########################
$Ifi "%irrigation%" == "off" $include "./modules/25_irrigation/off/realization.gms"
$Ifi "%irrigation%" == "pot_irrig_may26" $include "./modules/25_irrigation/pot_irrig_may26/realization.gms"
*###################### R SECTION END (MODULETYPES) ############################
