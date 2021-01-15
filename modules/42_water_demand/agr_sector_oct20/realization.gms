*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @description
*'
*' This realization models agricultural sector water demand endogenously.
*' Other sectors' water demands are given by exogenous scenarios and already
*' subtracted from water availability in the preprocessing.
*' Environmental water demand is also already implicitly considered in water
*' availability if the switch for environmental flow requirements is activated.
*'
*' *Agricultural water demand*:
*'
*' Water demand for agriculture is endogenously calculated based
*' on irrigated cropland `vm_area(j,kcr,"irrigated")` and livestock production
*' `vm_prod(j2,kli)`.
*'
*' Irrigation water demand per area for each crop category and cluster
*' is determined by crop water consumption requirements provided by the LPJmL model
*' taking field and conveyance losses into account.
*' SPECIFY WHICH VALUES ARE CHOSEN (CURRENTLY: GLOBAL PLACEHOLDER VALUES FROM
*' JAEGERMEYR')
*'
*' Livestock water demand `ic42_wat_req_k(j,kli)` is derived from FAO data.
*'
*'
*' *Irrigation efficiency*:
*'
*' Irrigation efficiency is implicitly considered in crop water requirements.
*' Depending on the irrigation system in place and depending on the crop type,
*' different field and conveyance efficiencies apply.
*' Future irrigation systems can be determined by an irrigation system switch. 
*'
*' @limitations Specify limitations here
*'

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/42_water_demand/agr_sector_aug13/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/42_water_demand/agr_sector_aug13/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/42_water_demand/agr_sector_aug13/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/42_water_demand/agr_sector_aug13/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/42_water_demand/agr_sector_aug13/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/42_water_demand/agr_sector_aug13/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/42_water_demand/agr_sector_aug13/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/42_water_demand/agr_sector_aug13/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
