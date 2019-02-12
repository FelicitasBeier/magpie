*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

*' @equations

q42_water_demand("agriculture",j2)..

 v42_watdem("agriculture",j2)*v42_irrig_eff(j2) =e=
 sum(kcr, vm_area(j2,kcr,"irrigated")*ic42_wat_req_k(j2,kcr))
 + sum(kli,vm_prod(j2,kli)*ic42_wat_req_k(j2,kli)*v42_irrig_eff(j2));

*' `v42_watdem` is composed by irrigation and livestock demand uses.
*' The factor `v42_irrig_eff` corresponds to the amount of water that is used
*' inefficiently in the irrigation process.


 q42_water(j2)  ..
   sum(wat_dem,v42_watdem(wat_dem,j2)) =l= sum(wat_src,v42_watavail(wat_src,j2))  ;

*' The water constraint, `q42_water`, assures that, in each
*' cluster, the sum of water withdrawals in all sectors `v42_watdem`
*' does not exceed available water from all sources `v42_watavail`.
*' The local seasonal water constraints is the sum of the amount of water needed
*' in the sectors defined by `wat_dem` (agriculture, industry, electricity,
*' domestic and ecosystem). This value must be lower than the sum of the amount of
*' water available from different sources in the sectors defined by `wat_src` (surface,
*' ground, technical and renewable groundwater).
