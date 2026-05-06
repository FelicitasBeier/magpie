*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

*' Agricultural water demand is composed by livestock water demand and
*' demand for irrigation water withdrawals.
q42_water_demand("agriculture",j2) ..
 vm_watdem("agriculture",j2) =e=
   sum(kcr, vm_area(j2,kcr,"irrigated") * ic42_wat_req_k(j2,kcr))
 + sum(kli, vm_prod(j2,kli) * ic42_wat_req_k(j2,kli));

*' Volumetric water pricing in agricultural sector can be chosen by the user.
*** To Do: implement time frame for this
q42_water_cost(i2) ..
  vm_water_cost(i2) =e= sum(cell(i2,j2), vm_watdem("agriculture",j2)) * ic42_water_price(i2);
