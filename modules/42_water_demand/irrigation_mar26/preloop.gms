*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

i42_wat_req_k(t,j,kve) = f42_wat_req_kve(t,j,kve);
i42_env_flows(t,j) = f42_env_flows(t,j);

i42_wat_req_k(t,j,kli) = f42_wat_req_kli(kli);

* Fixed country weights for country-selection logic.
* Use baseline irrigation water availability in the initial year.
* Weight is fixed to y1995, EFP = off, non-agricultural water demand scenario = ssp2.
p42_wat_avl_weight_iso(iso) =
  sum(pww43$(sameas(pww43,"ren_ag") OR sameas(pww43,"nonren_ag")),
    f42_wat_avl_iso("y1995",iso,"off","ssp2",pww43));

p42_wat_avl_weight_reg(i) =
  sum(i_to_iso(i,iso), p42_wat_avl_weight_iso(iso));

* Diagnostic output only for first-run assessment. Remove before merging.
p42_wat_avl_weight_iso_zero(iso) = 1$(p42_wat_avl_weight_iso(iso) = 0);
p42_wat_avl_weight_reg_zero(i) = 1$(p42_wat_avl_weight_reg(i) = 0);
display p42_wat_avl_weight_iso_zero, p42_wat_avl_weight_reg_zero;

* Trajectory for environmental flow policy
* (linear interpolation from start year to target year)
p42_EFP(t_all,"off") = 0;
m_linear_time_interpol(p42_EFP_fader, s42_EFP_startyear, s42_EFP_targetyear, 0, 1);
p42_EFP(t_all, "on") = p42_EFP_fader(t_all);
