*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @description The off realization delegates irrigation logic to the legacy
*' modules [41_area_equipped_for_irrigation], [42_water_demand], and
*' [43_water_availability]. This realization should be deleted
*' after the transition period.

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/25_irrigation/off/declarations.gms"
*######################## R SECTION END (PHASES) ###############################
