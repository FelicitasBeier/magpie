*** |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

sets
   watdem_exo(wat_dem) Exogenous water demands
   / manufacturing, electricity, domestic, ecosystem /

   watdem_ineldo(wat_dem) Exogenous water demand subset covering humanly induced demands
   / domestic, manufacturing, electricity /

   EFP_to_dev(EFP,dev) Mapping between EFP and economic development status
   /  off . (lic, mic)
      on  . (hic) /

   wtype Water abstraction type 
   / consumption, withdrawal /
;
