*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @description This realization models irrigation expansion endogenously, 
*' considering local irrigation water availability constraints as determined 
*' in the water flow accumulation algorithm mrwater using LPJmL data (@beier_technical_2023)
*' and calculates irrigation water demand.
*'
*' *Irrigated Areas:*
*' Irrigation expansion is determined endogenously, 
*' i.e. by expanding area equipped for irrigation (AEI).
*' Initial values for AEI are areas that are irrigated in the initial time step according to LandInG [@ostberg_landing_2023].
*' Depreciation of AEI can be set via `s25_AEI_depreciation` (annual rate; not applied in the initialization time step).
*' Irrigated crop production can only take place where irrigation infrastructure is present
*' and where irrigation is possible based on local water availability following the rule of 
*' the hydro-economic algorithm mrwater using LPJmL data (@beier_technical_2023).
*'
*' Following [@palazzo_investment_2019], unit cost for irrigation differ for new infrastrucutre development
*' and rehabilitation of existing irrigated area based on data by [@inocencio_lessons_2005] and [inocencio_costs_2007].
*' Given that [inocencio_costs_2007] find that irrigation in Sub-Saharan Africa is not inherently more expensive 
*' than comparable projects in other developing regions and high average costs are driven by failed projects, 
*' only successful projects are considered for regional unit costs to avoid systematic biases.
*'
*' The regional unit costs converge depending on the chosen scenario. (To Do: still needs to be implemented and scenarios should be chosen.)
*'
*' *Water demand*:
*' Water withdrawals for the agricultural sector are modeled endogenously
*' based on irrigated cropland `vm_area(j,kcr,"irrigated")` 
*' and livestock production `vm_prod(j,kli)`.
*' Non-agricultural water use (manufacturing, electricity, domestic) and environmental flow
*' protection (EFP) are accounted for in the mrwater river routing and are part of
*' the water scenarios from mrwater, which are selected via `c25_water_scenario`.
*' Water reserved for these uses is not available for agriculture.
*' Non-agricultural demand, demand served from renewable sources and unmet demand
*' are passed through for reporting (totals, no sector split yet).
*** To Do: Fade-in of scenarios in GAMS (share of ssp2 and selected scenario) and documentation (stage 2)
*'
*' *Water availability for irrigation*:
*' Water availability for irrigation is based on potential irrigation water withdrawals 
*' determined in the water flow accumulation algorithm mrwater [@beier_technical_2023] 
*' based on annual runoff from a natural vegetation run from LPJmL [@vonBloh_implementing_2018].
*' It includes renewable freshwater resources, i.e. runoff generated from precipitation 
*' and snowfall. Assuming a long-term water balance, all runoff is assumed to enter rivers, 
*' neglecting temporal groundwater recharge dynamics. 
*' Historical water withdrawals beyond locally available renewable freshwater resources
*' are accounted for as non-renewable groundwater [@beier_irrigation_2026]
*' (until the harmonization year, constant afterwards).
*' The non-renewable groundwater pool for agriculture is available in all water scenarios.
*' Potentially irrigated areas include areas irrigated with non-renewable groundwater.
*'
*' The climate scenario of all mrwater inputs is selected via `c25_climate_scenario`.

*' @limitations Water usage and efficiency are calculated in the preprocessing (mrwater)
*' to ensure spatial cell water balance consistency.
*' Therefore, settings are prescribed and cannot be flexibly adjusted during MAgPIE runtime. 

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/25_irrigation/pot_irrig_may26/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/25_irrigation/pot_irrig_may26/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/25_irrigation/pot_irrig_may26/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/25_irrigation/pot_irrig_may26/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/25_irrigation/pot_irrig_may26/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/25_irrigation/pot_irrig_may26/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/25_irrigation/pot_irrig_may26/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/25_irrigation/pot_irrig_may26/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
