*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' Initialization of areas equipped for irrigation
p25_AEI_start(t,j) = pc25_AEI_start(j);

* Agricultural water demand
ic25_wat_req_k(j,k) = i25_wat_req_k(t,j,k);

* Volumetric water pricing in the current time step (all regions).
ic25_water_price(i) = 0;
if (m_year(t) >= s25_water_price_startyear,
  ic25_water_price(i) = s25_water_price;
);

* Non-agricultural water use and environmental flow requirements are accounted for in mrwater
* (already subtracted from the water available for agriculture) and do not enter module 25 constraints.
* Non-agricultural totals are reported via i25_wat_nonag; no sector split yet.
*** To Do: sector split of non-agricultural water use for reporting (sector shares from mrwater)
vm_watdem.fx(watdem_exo25,j) = 0;

v25_watavail.fx(j,"renewable") = i25_wat_avail(t,j,"renewable");
v25_watavail.fx(j,"non_renewable") = i25_wat_avail(t,j,"non_renewable");
v25_watavail.fx(j,"technical") = i25_wat_avail(t,j,"technical");
