*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

sets
  t_ini25  Time periods with area equipped for irrigation initialization data
       / y1995, y2000, y2005, y2010, y2015 /

  aei25    Data source for area equipped for irrigation
       / LUH3, Mehta2024_Siebert2013, Mehta2024_Meier2018 /

  invtype25 Type of irrigation investment
       / expansion, maintenance /

  watdem_exo25(wat_dem) Exogenous water demand
       / domestic, manufacturing, electricity, ecosystem /

  watdem_ineldo25(wat_dem) Exogenous water demand subset covering humanly induced demands
       / domestic, manufacturing, electricity /

  scen_watdem_nonagr25 Scenarios for non agricultural water demand
       / ISIMIP, ssp1, ssp2, ssp3 /

  EFP25 Environmental Flow Policy (EFP)
       / off, on /

  EFP_to_dev25(EFP25,dev) Mapping between EFP and economic development status
       / off . (lic, mic)
         on  . (hic) /

  wtype25 Water abstraction type
       / consumption, withdrawal /

  wat_source25 Freshwater sources available for agricultural usage
       / renewable, non_renewable, technical /

  pww25 Potential water withdrawals for agriculture non-renewable groundwater reserved and water reserved for agriculture
       / ren_ag, nonren_ag, res_nonAg /
;
