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

* Water withdrawals in manufacturing, electricity, domestic
* depend on the socioeconomic scenario.
*** To Do: replace by consistent non-agricultural water use from mrwater (stage 2, D40)
if (m_year(t) <= sm_fix_SSP2,
  vm_watdem.fx(watdem_ineldo25,j) = f25_watdem_ineldo(t,j,"ssp2",watdem_ineldo25,"withdrawal");
  i25_watdem_total(t,j,watdem_ineldo25,wtype25) = f25_watdem_ineldo_total(t,j,"ssp2",watdem_ineldo25,wtype25);
else
  vm_watdem.fx(watdem_ineldo25,j) = sum(scen25_to_watdem_nonagr25("%c25_water_scenario%",scen_watdem_nonagr25),
                                      f25_watdem_ineldo(t,j,scen_watdem_nonagr25,watdem_ineldo25,"withdrawal"));
  i25_watdem_total(t,j,watdem_ineldo25,wtype25) = sum(scen25_to_watdem_nonagr25("%c25_water_scenario%",scen_watdem_nonagr25),
                                                      f25_watdem_ineldo_total(t,j,scen_watdem_nonagr25,watdem_ineldo25,wtype25));
);

* Environmental flow requirements are not reported for now.
*** To Do: fix to environmental flow requirements of the selected water scenario from mrwater (stage 2, backlog 15)
vm_watdem.fx("ecosystem",j) = 0;

v25_watavail.fx(j,"renewable") = i25_wat_avail(t,j,"renewable");
v25_watavail.fx(j,"non_renewable") = i25_wat_avail(t,j,"non_renewable");
v25_watavail.fx(j,"technical") = i25_wat_avail(t,j,"technical");
