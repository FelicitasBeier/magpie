*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

i42_wat_req_k(t,j,kve) = f42_wat_req_kve(t,j,kve);
i42_env_flows(t,j) = f42_env_flows(t,j);

i42_wat_req_k(t,j,kli) = f42_wat_req_kli(kli);

* Trajectory for environmental flow policy
* (linear interpolation from start year to target year)
p42_EFP(t_all,"off") = 0;
m_linear_time_interpol(p42_EFP_fader, s42_EFP_startyear, s42_EFP_targetyear, 0, 1);
p42_EFP(t_all, "on") = p42_EFP_fader(t_all);
