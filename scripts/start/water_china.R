# |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de


##########################################################
#### Script to MAgPIE test runs ####
##########################################################

library(lucode)
source("scripts/start_functions.R")
source("config/default.cfg")

# Normal MAgPIE run (all sectors)
cfg$title <- "baseline_allsec"
cfg$gms$water_availability <- "total_water_aug13"
cfg$gms$water_demand<- "all_sectors_aug13"            # def = agr_sector_aug13
start_run(cfg=cfg,codeCheck=FALSE)
cfg$recalibrate <- "ifneeded"

# Normal MAgPIE run (agr sector)
cfg$title <- "baseline_agrsec"
cfg$gms$water_availability <- "total_water_aug13"
cfg$gms$water_demand<- "agr_sector_aug13"            # def = agr_sector_aug13
start_run(cfg=cfg,codeCheck=FALSE)
cfg$recalibrate <- "ifneeded"

# Water cap China (all sectors)
cfg$title <- "watercapChina_allsec"
cfg$gms$water_availability <- "water_policy_oct19" 	# def = "total_water_aug13"
cfg$gms$water_demand<- "all_sectors_aug13"            	# def = agr_sector_aug13
start_run(cfg=cfg,codeCheck=FALSE)
cfg$recalibrate <- "ifneeded"

# Water cap China (agr sector)
cfg$title <- "watercapChina_agrsec"
cfg$gms$water_demand<- "agr_sector_aug13"            	# def = agr_sector_aug13
cfg$gms$water_availability <- "water_policy_oct19"	# def = "total_water_aug13"
start_run(cfg=cfg,codeCheck=FALSE)
