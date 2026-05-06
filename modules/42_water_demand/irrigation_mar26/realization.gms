*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @description
*'
*' This realization models agricultural sector water withdrawals endogenously.
*' Manufacturing, electricity and domestic water usage are given by exogenous scenarios
*' and can be chosen by the user via scenario switches.
*'
*' Similarly, various switches are available for environmental flow protection.
*'
*' *Agricultural water demand*:
*'
*' Water demand for agriculture is endogenously calculated based on irrigated
*' cropland `vm_area(j,kcr,"irrigated")` and livestock production
*' `vm_prod(j,kli)`.
*'
*' *Non agricultural human water withdrawals*:
*'
*' For manufacturing, electricity and domestic withdrawals, three scenarios of the
*' WATERGAP model provided by @wada_modeling_2016 are used:
*'
*' * SSP1
*' * SSP2
*' * SSP3
*'
*'
*' *Environmental water demand*:
*'
*' Environmental water requirements can be specified separately using the switch
*' `s42_env_flow_scenario`. The following settings are available:
**** To Do: Decide which scenarios to keep (currently: "on" vs. "off" in mrwater)
*' * No additional environmental flows are considered.
*' * A certain fraction of available water `s42_env_flow_fraction` is reserved
*'   for environmental purposes and consequently not available for agricultural
*'   activities (in addition to `s42_reserved_fraction`).
*' * Environmental flow requirements (EFR) are calculated from LPJmL inputs
*'   according to an algorithm by @smakhtin_water_2004 on cluster level. Due to
*'   the fact that MAgPIE only considers available blue water during the growing
*'   period of the plants [43_water_availability], EFR are also only calculated
*'   during this growing period. These are reserved in addition to
*'   `s42_protected_fraction`. In the case of the absence of an environmental
*'   flow protection policy, a base protection can be specified:
*'   `s42_env_flow_base_fraction`. It defaults to 5 % of available water.
*** To Do: Decide whether to keep this. And how: is there an option to switch from off to on over time combinging two PIWWs?
*' The speed of transitioning to full environmental flow protection is determined
*' by specifying the start (`s42_EFP_startyear`) and target (`s42_EFP_targetyear`) year.
*'
*' @limitations Water usage and efficiency are calculated in the preprocessing
*' to ensure spatial cell water balance water balance consistency.
*' Therefore, settings are prescribed and cannot be flexibly adjusted during MAgPIE runtime. 

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/42_water_demand/irrigation_mar26/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/42_water_demand/irrigation_mar26/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/42_water_demand/irrigation_mar26/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/42_water_demand/irrigation_mar26/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/42_water_demand/irrigation_mar26/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/42_water_demand/irrigation_mar26/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/42_water_demand/irrigation_mar26/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/42_water_demand/irrigation_mar26/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
