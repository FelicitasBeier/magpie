# |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# ----------------------------------------------------------
# description: Water test runs
# position: 6
# ----------------------------------------------------------


##### Version log (YYYYMMDD - Description - Author(s))
## v0.1 - 20210115 - New water realization test runs - FB

library(lucode2)
library(magclass)
library(gms)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

# Sources the default configuration file
source("config/default.cfg")

# Use extra inputs
cfg$input <- c("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev48_c200_690d3718e151be1b450b394c1064b1c5.tgz",
         "rev4.54+mrmagpie10_riverrouting_allocation_h12_magpie.tgz",
         "first_water_test.tgz",
         "rev4.54+mrmagpie10_riverrouting_allocation_h12_validation.tgz",
         "calibration_H12_c200_26Feb20.tgz",
         "additional_data_rev3.86.tgz")

cfg$repositories <- append(list("https://rse.pik-potsdam.de/data/magpie/public"=NULL, "/p/projects/landuse/users/beier/watertest_input"=NULL),
                                    getOption("magpie_repos"))

# Recalibrate
cfg$recalibrate <- "ifneeded"

# Set new water realizations
cfg$gms$water_demand <- "agr_sector_oct20"
cfg$gms$water_availability <- "agr_water_oct20"

#Change the results folder name
cfg$title <- "WaterTest"

# Start run
start_run(cfg=cfg)
