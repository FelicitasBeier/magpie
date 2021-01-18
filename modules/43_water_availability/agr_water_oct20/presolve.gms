*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

v43_watavail_cons.fx("surface",j)    = i43_wat_avail_cons(t,"surface",j);
v43_watavail_cons.fx("technical",j)  = i43_wat_avail_cons(t,"technical",j);
v43_watavail_cons.fx("ground",j)     = i43_wat_avail_cons(t,"ground",j);
v43_watavail_cons.fx("ren_ground",j) = i43_wat_avail_cons(t,"ren_ground",j);

* Update groundwater availability to include overuse from exogenous demands
*v43_watavail.fx("ground",j) = v43_watavail.up("ground",j)
*                             + (((sum(watdem_exo, vm_watdem.lo(watdem_exo,j))-sum(wat_src,v43_watavail.up(wat_src,j)))*1.01))
*                             $(sum(watdem_exo, vm_watdem.lo(watdem_exo,j))-sum(wat_src,v43_watavail.up(wat_src,j))>0);
* NOTE: Should no longer be necessary. exo demands subtracted before (could only be livestock. account for this somewhere else)
