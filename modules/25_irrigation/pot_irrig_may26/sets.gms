*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

sets
  t_ini25  Time periods with area equipped for irrigation initialization data
       / y1995, y2000, y2005, y2010, y2015 /

  invtype25 Type of irrigation investment
       / expansion, maintenance /

  watdem_exo25(wat_dem) Non-agricultural water demand sectors (accounted for in mrwater and fixed to zero here)
       / domestic, manufacturing, electricity, ecosystem /

  scen25 Water scenarios from mrwater combining environmental flow protection and non-agricultural water demand
       / ssp1, ssp2, ssp2efp, ssp2strict, ssp3 /

  clim25 Climate scenarios of the mrwater water inputs
       / cc, nocc_hist /

  nonag25 Non-agricultural water use types from mrwater
       / demand, served_ren, unmet /

  nonren25 Non-renewable groundwater pool by use
       / nonren_ag, nonren_nonAg /

  harm25 Harmonization settings of the mrwater inputs
       / harmonization_year /

  wtype25 Water abstraction type
       / consumption, withdrawal /

  wat_source25 Freshwater sources available for agricultural usage
       / renewable, non_renewable /
;
