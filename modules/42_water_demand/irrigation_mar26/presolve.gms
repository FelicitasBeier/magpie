*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

* Agricultural water demand
ic42_wat_req_k(j,k) = i42_wat_req_k(t,j,k);

* Volumetric water pricing in the current time step.
* Country-to-region weighting is fixed over time (p42_wat_avl_weight_iso).
p42_country_switch_wprice(iso) = 0;
p42_country_switch_wprice(water_pricing_countries) = 1;

p42_wprice_region_shr(i) = 0;
p42_wprice_region_shr(i)$(
  sum(i_to_iso(i,iso), p42_wat_avl_weight_iso(iso)) > 0
) =
  sum(i_to_iso(i,iso), p42_country_switch_wprice(iso) * p42_wat_avl_weight_iso(iso))
  / sum(i_to_iso(i,iso), p42_wat_avl_weight_iso(iso));

ic42_water_price(i) = 0;
if (m_year(t) >= s42_water_price_startyear,
  ic42_water_price(i) = s42_water_price * p42_wprice_region_shr(i);
);


* Water withdrawals in manufacturing, electricity, domestic, ecosystem
* depend on the socioeconomic scenario
if (m_year(t) <= sm_fix_SSP2,
  vm_watdem.fx(watdem_ineldo,j) = f42_watdem_ineldo(t,j,"ssp2",watdem_ineldo,"withdrawal");
  i42_watdem_total(t,j,watdem_ineldo,wtype) = f42_watdem_ineldo_total(t,j,"ssp2",watdem_ineldo,wtype);
else
  vm_watdem.fx(watdem_ineldo,j) = f42_watdem_ineldo(t,j,"%cm_watdem_nonagr_scenario%",watdem_ineldo,"withdrawal");
  i42_watdem_total(t,j,watdem_ineldo,wtype) = f42_watdem_ineldo_total(t,j,"%cm_watdem_nonagr_scenario%",watdem_ineldo,wtype);
);


* Environmental flow scenarios depending on the switch s42_env_flow_scenario
i42_env_flows_base(t,j) = s42_env_flow_base_fraction
  * sum(wat_source43, im_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%",wat_source43));

if ((s42_env_flow_scenario = 0),
  i42_env_flows_base(t,j) = 0;
  i42_env_flows(t,j) = 0;
Elseif (s42_env_flow_scenario = 1),
  i42_env_flows(t,j) = s42_env_flow_fraction
    * sum(wat_source43, im_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%",wat_source43));
);

* Country switch to determine countries for which EFP holds.
p42_country_switch_EFP(iso) = 0;
p42_country_switch_EFP(EFP_countries) = 1;
* Because MAgPIE is not run at country-level, but at region level, a region
* share is calculated that translates the countries' influence to regional level.
* Countries are weighted by fixed baseline irrigation water availability.
p42_EFP_region_shr(i) = 0;
p42_EFP_region_shr(i)$(sum(i_to_iso(i,iso), p42_wat_avl_weight_iso(iso)) > 0) =
  sum(i_to_iso(i,iso), p42_country_switch_EFP(iso) * p42_wat_avl_weight_iso(iso))
  / sum(i_to_iso(i,iso), p42_wat_avl_weight_iso(iso));

* Environmental policy switch:
i42_env_flow_policy(t,i) = p42_EFP(t,"%cm_env_flow_policy%") * p42_EFP_region_shr(i)
                     + p42_EFP(t,"off") * (1-p42_EFP_region_shr(i));

ic42_env_flow_policy(i) = i42_env_flow_policy(t,i);

vm_watdem.fx("ecosystem",j) = sum(cell(i,j), i42_env_flows_base(t,j) * (1 - ic42_env_flow_policy(i)) +
                                             i42_env_flows(t,j) * ic42_env_flow_policy(i));
