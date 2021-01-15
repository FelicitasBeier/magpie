*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

* Water available for agricultural consumption considering environmental flows
* and non-agricultural water demands
im_wat_avail_cons(t,"surface",j) = f43_wat_avail_cons(t,j,"%c43_env_flow_policy%","%c43_non_ag_wat_demand%");

im_wat_avail_cons(t,"ground",j) = 0;
im_wat_avail_cons(t,"ren_ground",j) = 0;
im_wat_avail_cons(t,"technical",j) = 0;
