*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


*' @description This realization allows the models irrigation expansion endogenously, 
*' i.e. expanding area equipped for irrigation (AEI).
*' Initial values for AEI are areas that are irrigated in the initial time step according to LandInG [@ostberg_landing_2023].
*' Depreciation of AEI can be set via `s41_AEI_depreciation`.
*' Irrigated crop production can only take place where irrigation infrastructure is present
*' and where irrigation is possible based on local water availability following the rule of 
*' the hydro-economic algorithm mrwater using LPJmL data (@beier_technical_2023).
*'
*' Following [@palazzo_investment_2019], unit cost for irrigation differ for new infrastrucutre development
*' and rehabilitation of existing irrigated area based on data by [@inocencio_lessons_2005] and [inocencio_costs_2007].
*' Given that [inocencio_costs_2007] find that irrigation in Sub-Saharan Africa is not inherently more expensive 
*' than comparable projects in other developing regions and high average costs are driven by failed projects, 
*' we use successful projects for regional unit costs to avoid systematic biases.
*'
*' The regional unit costs converge depending on the chosen scenario.
*'
*' @limitations This realization increases model complexity compared to the static realization.

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/41_area_equipped_for_irrigation/endo_mar26/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
