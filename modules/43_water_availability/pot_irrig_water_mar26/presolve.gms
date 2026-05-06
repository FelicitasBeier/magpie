*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

v43_watavail.fx(j,"renewable") = im_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","renewable");
v43_watavail.fx(j,"non_renewable") = im_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","non_renewable");
v43_watavail.fx(j,"technical") = im_wat_avail(t,j,"%cm_env_flow_policy%","%cm_watdem_nonagr_scenario%","technical");

*' Where exogenous water demands exceed renewable and non-renewable water availability,
*' technical water resources (e.g., desalination) can provide the missing water.
*** To Do: Delete if this is no longer needed. (If it can be deleted: simplify: v43_watavail no longer needed. Just use im_wat_avail)
*v43_watavail.fx("technical",j) = v43_watavail.up("technical",j)
*                             + (((sum(watdem_exo, vm_watdem.lo(watdem_exo,j)) - sum(wat_src,v43_watavail.up(wat_src,j))) * 1.01))
*                             $(sum(watdem_exo, vm_watdem.lo(watdem_exo,j)) - sum(wat_src,v43_watavail.up(wat_src,j)) > 0);
