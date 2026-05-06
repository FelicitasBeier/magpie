*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' Freshwater sources available for agricultural usage are provided 
*' by mrwater preprocessing.
*' It includes renewable resources (river discharge from precipitation,
*' including surface water flows and shallow / renewable groundwater)
*' and non-renewable water resources (e.g., fossil groundwater) that are
*' derived based on  current excessive water withdrawals in the initialization year
*' beyond locally available renewable freshwater resources.
*' Water reserved for non-agricultural purposes (exogenous to MAgPIE)
*' are already subtracted, such that these freshwater sources are those 
*' available for agricultural usage.
*' Technical water refers to desalination and is not explicitly accounted for in MAgPIE.

im_wat_avail(t,j,EFP,scen_watdem_nonagr,"renewable") = f43_wat_avail(t,j,EFP,scen_watdem_nonagr,"ren_ag");
im_wat_avail(t,j,EFP,scen_watdem_nonagr,"non_renewable") = f43_wat_avail(t,j,EFP,scen_watdem_nonagr,"nonren_ag");
im_wat_avail(t,j,EFP,scen_watdem_nonagr,"technical") = 0;
