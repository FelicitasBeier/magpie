*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de


*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 oq41_area_irrig(t,j,"marginal") = q41_area_irrig.m(j);
 oq41_area_irrig(t,j,"level")    = q41_area_irrig.l(j);
 oq41_area_irrig(t,j,"upper")    = q41_area_irrig.up(j);
 oq41_area_irrig(t,j,"lower")    = q41_area_irrig.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################
