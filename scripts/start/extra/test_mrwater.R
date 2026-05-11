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

# old realizations
cfg$title <- "default_ir2rfOff"
# new lpjml data without mrwater integration
cfg$input <- c(regional    = "rev4.130l2m_v5-10-0m2_feb2026_h12_magpie.tgz",
               cellular    = "rev4.130l2m_v5-10-0m2_feb2026_h12_e3aebc2e_cellularmagpie_c200_MRI-ESM2-0-ssp126_lpjml-a0c283bd.tgz",
               validation  = "rev4.130l2m_v5-10-0m2_feb2026_h12_92e02314_validation.tgz",
               additional  = "additional_data_rev4.63.tgz",
               calibration = "calibration_H12_FAO_18Sep25.tgz")  

# old default realizations
cfg$gms$area_equipped_for_irrigation <- "endo_apr13" 
cfg$gms$water_demand <- "all_sectors_aug13"  
cfg$gms$water_availability <- "total_water_aug13" 
cfg$gms$irrigation <- "off"   
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)


# old realizations
cfg$title <- "default_mrwaterinput_ir2rfOff_v5"
# new lpjml data with mrwater integration
cfg$input <- c(regional    = "rev4.130mrwater_lpjml5-10-0m2_v5_h12_magpie.tgz",
               cellular    = "rev4.130mrwater_lpjml5-10-0m2_v4_h12_00e02813_cellularmagpie_c200_MRI-ESM2-0-ssp370_lpjml-a0c283bd.tgz",
               validation  = "rev4.130mrwater_lpjml5-10-0m2_v4_h12_92e02314_validation.tgz",
               additional  = "additional_data_rev4.63.tgz",
               calibration = "calibration_H12_FAO_18Sep25.tgz")

# old default realizations
cfg$gms$area_equipped_for_irrigation <- "endo_apr13" 
cfg$gms$water_demand <- "all_sectors_aug13"  
cfg$gms$water_availability <- "total_water_aug13" 
cfg$gms$irrigation <- "off"   
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)


# new realization with new module 
cfg$title <- "mrwater_integration_module25"
# new lpjml data with mrwater integration
cfg$input <- c(regional    = "rev4.130mrwater_lpjml5-10-0m2_v5_h12_magpie.tgz",
               cellular    = "rev4.130mrwater_lpjml5-10-0m2_v4_h12_00e02813_cellularmagpie_c200_MRI-ESM2-0-ssp370_lpjml-a0c283bd.tgz",
               validation  = "rev4.130mrwater_lpjml5-10-0m2_v4_h12_92e02314_validation.tgz",
               additional  = "additional_data_rev4.63.tgz",
               calibration = "calibration_H12_FAO_18Sep25.tgz")

# deactivate old module
cfg$gms$area_equipped_for_irrigation <- "off" 
cfg$gms$water_demand <- "off" 
cfg$gms$water_availability <- "off" 
# activate new module
cfg$gms$irrigation <- "pot_irrig_may26"   
cfg$gms$s14_calib_ir2rf <- 0

start_run(cfg)
