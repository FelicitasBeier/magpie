*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

q42_agwat_demand(j2) ..

 vm_agwatdem(j2) =e=
   sum(kcr, vm_area(j2,kcr,"irrigated")*ic42_wat_req_k_cons(j2,kcr))
   + sum(kli,vm_prod(j2,kli)*ic42_wat_req_k_cons(j2,kli));

*' `vm_agwatdem` is composed by consumptive irrigation and livestock water demand.
