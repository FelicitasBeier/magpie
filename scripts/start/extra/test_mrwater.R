# |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# ------------------------------------------------
# description: testing mrwater integration in MAgPIE
# ------------------------------------------------

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")
source("config/default.cfg")

# mrwater preprocessing to be tested (e.g. "", "bugfix2_", "bugfix3_")
mrwRev <- "bugfix3_"
# input data with mrwater integration
inputMrwater <- c(regional    = paste0("rev4.139mrwater_L2M_", mrwRev, "h12_magpie.tgz"),
                  cellular    = paste0("rev4.139mrwater_L2M_", mrwRev,
                                       "h12_bb6334c1_cellularmagpie_c200_MRI-ESM2-0-ssp245_lpjml-501e8913.tgz"),
                  validation  = paste0("rev4.139mrwater_L2M_", mrwRev, "h12_92e02314_validation.tgz"),
                  additional  = "additional_data_rev4.78.tgz",
                  calibration = "calibration_H12_FAO_04Nov26.tgz")

# old realizations
cfg$title <- "default_ir2rfOff"
# new lpjml data without mrwater integration
cfg$input <- c(regional    = "rev4.139L2M_h12_magpie.tgz",
               cellular    = "rev4.139L2M_h12_bb6334c1_cellularmagpie_c200_MRI-ESM2-0-ssp245_lpjml-501e8913.tgz",
               validation  = "rev4.139L2M_h12_92e02314_validation.tgz",
               additional  = "additional_data_rev4.78.tgz",
               calibration = "calibration_H12_FAO_04Nov26.tgz")

# old default realizations
cfg$gms$area_equipped_for_irrigation <- "endo_apr13" 
cfg$gms$water_demand <- "all_sectors_aug13"  
cfg$gms$water_availability <- "total_water_aug13" 
cfg$gms$irrigation <- "off"   
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)


# old realizations
cfg$title <- paste0("default_mrwaterinput_", mrwRev, "ir2rfOff")
# new lpjml data with mrwater integration
cfg$input <- inputMrwater

# old default realizations
cfg$gms$area_equipped_for_irrigation <- "endo_apr13" 
cfg$gms$water_demand <- "all_sectors_aug13"  
cfg$gms$water_availability <- "total_water_aug13" 
cfg$gms$irrigation <- "off"   
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)


# new realization with new module 
cfg$title <- paste0("mrwater_integration_", mrwRev, "module25")
# new lpjml data with mrwater integration
cfg$input <- inputMrwater

# deactivate old module
cfg$gms$area_equipped_for_irrigation <- "off" 
cfg$gms$water_demand <- "off" 
cfg$gms$water_availability <- "off" 
# activate new module
cfg$gms$irrigation <- "pot_irrig_may26"
cfg$gms$c25_water_scenario <- "ssp2"
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)
