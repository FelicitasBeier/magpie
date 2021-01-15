*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

 q43_agwater_cons(j2)  ..
   vm_agwatdem(j2) =l= sum(wat_src,v43_watavail_agcons(wat_src,j2));

*' @description The water constraint, `q43_water_cons`, ensures that the sum of
*' agricultural water withdrawals `vm_agwatdem` does not exceed available water
*' for consumptive agricultural purposes `v43_watavail_cons`.
