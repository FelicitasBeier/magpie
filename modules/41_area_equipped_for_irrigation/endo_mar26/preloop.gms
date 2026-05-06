*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' Area equipped for irrigation in initialization year
pc41_AEI_start(j) = f41_irrig("y1995",j);

*' Potenially irrigated area scenario selection
p41_PIA(t_all,j) = f41_pia(t_all,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%");

*' Unit costs for irrigation expansion
p41_unitcost_AEI(i, invtype41) = f41_cost_irrig("y1995",i,invtype41);
*To Do: make unit cost convergence scenario dependent (SSP2: converge to cheapest; SSP3, SSP4: keep as is).
*Currently: one time step (initialization)
