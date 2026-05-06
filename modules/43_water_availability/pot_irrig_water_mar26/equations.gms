*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

*' Water withdrawals for agriculture cannot exceed available water 
*' for agricultural purposes from all sources.

 q43_water_availability(j2)  ..
   vm_watdem("agriculture",j2) =l= sum(wat_source43,v43_watavail(j2,wat_source43))  ;
