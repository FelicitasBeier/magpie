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

* Volumetric water pricing in the current time step.
* Country-to-region weighting is fixed over time (p25_wat_avl_weight_iso).
p25_country_switch_wprice(iso) = 0;
p25_country_switch_wprice(water_pricing_countries) = 1;

p25_wprice_region_shr(i) = 0;
p25_wprice_region_shr(i)$(
  sum(i_to_iso(i,iso), p25_wat_avl_weight_iso(iso)) > 0
) =
  sum(i_to_iso(i,iso), p25_country_switch_wprice(iso) * p25_wat_avl_weight_iso(iso))
  / sum(i_to_iso(i,iso), p25_wat_avl_weight_iso(iso));

ic25_water_price(i) = 0;
if (m_year(t) >= s25_water_price_startyear,
  ic25_water_price(i) = s25_water_price * p25_wprice_region_shr(i);
);

* Water withdrawals in manufacturing, electricity, domestic, ecosystem
* depend on the socioeconomic scenario.
if (m_year(t) <= sm_fix_SSP2,
  vm_watdem.fx(watdem_ineldo25,j) = f25_watdem_ineldo(t,j,"ssp2",watdem_ineldo25,"withdrawal");
  i25_watdem_total(t,j,watdem_ineldo25,wtype25) = f25_watdem_ineldo_total(t,j,"ssp2",watdem_ineldo25,wtype25);
else
  vm_watdem.fx(watdem_ineldo25,j) = f25_watdem_ineldo(t,j,"%cm_watdem_nonagr_scenario%",watdem_ineldo25,"withdrawal");
  i25_watdem_total(t,j,watdem_ineldo25,wtype25) = f25_watdem_ineldo_total(t,j,"%cm_watdem_nonagr_scenario%",watdem_ineldo25,wtype25);
);

* Environmental flow scenarios depending on the switch s25_env_flow_scenario.
i25_env_flows_base(t,j) = s25_env_flow_base_fraction
  * sum(wat_source25, i25_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%",wat_source25));

if ((s25_env_flow_scenario = 0),
  i25_env_flows_base(t,j) = 0;
  i25_env_flows(t,j) = 0;
Elseif (s25_env_flow_scenario = 1),
  i25_env_flows(t,j) = s25_env_flow_fraction
    * sum(wat_source25, i25_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%",wat_source25));
);

* Country switch to determine countries for which EFP holds.
p25_country_switch_EFP(iso) = 0;
p25_country_switch_EFP(EFP_countries) = 1;
* Because MAgPIE is not run at country-level, but at region level, a region
* share is calculated that translates the countries' influence to regional level.
* Countries are weighted by fixed baseline irrigation water availability.
p25_EFP_region_shr(i) = 0;
p25_EFP_region_shr(i)$(sum(i_to_iso(i,iso), p25_wat_avl_weight_iso(iso)) > 0) =
  sum(i_to_iso(i,iso), p25_country_switch_EFP(iso) * p25_wat_avl_weight_iso(iso))
  / sum(i_to_iso(i,iso), p25_wat_avl_weight_iso(iso));

* Environmental policy switch.
i25_env_flow_policy(t,i) = p25_EFP(t,"%cm_env_flow_policy%") * p25_EFP_region_shr(i)
                     + p25_EFP(t,"off") * (1-p25_EFP_region_shr(i));

ic25_env_flow_policy(i) = i25_env_flow_policy(t,i);

vm_watdem.fx("ecosystem",j) = sum(cell(i,j), i25_env_flows_base(t,j) * (1 - ic25_env_flow_policy(i)) +
                                             i25_env_flows(t,j) * ic25_env_flow_policy(i));

v25_watavail.fx(j,"renewable") = i25_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","renewable");
v25_watavail.fx(j,"non_renewable") = i25_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","non_renewable");
v25_watavail.fx(j,"technical") = i25_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","technical");
