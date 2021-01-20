# |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# ----------------------------------------------------------
# description: SIM4NEXUS paper simulations (water-land-climate-energy)
# ----------------------------------------------------------

library(gms)
source("scripts/start_functions.R")
source("scripts/performance_test.R")

# Set defaults
codeCheck <- FALSE

buildInputVector <- function(regionmapping   = "image10",
                             project_name    = "isimip_rcp",
                             climatescen_name= "rcp2p6",
                             co2             = "co2",
                             climate_model   = "IPSL_CM5A_LR",
                             resolution      = "c200",
                             archive_rev     = "52",
                             madrat_rev      = "4.55",
                             validation_rev  = "4.55",
                             calibration     = "calibration_sim4nexus_jan2021.tgz",
                             additional_data = "additional_data_rev3.92.tgz") {
  mappings <- c(H11="8a828c6ed5004e77d1ba2025e8ea2261",
                h12="690d3718e151be1b450b394c1064b1c5",
                image10="fe5e6d721036e0674a2d9c4590327160",
                mag="c30c1c580039c2b300d86cc46ff4036a",
                agmip="c77f075908c3bc29bdbe1976165eccaf",
                sim4nexus="25dd7264e8e145385b3bd0b89ec5f3fc",
                inms="44f1e181a3da765729f2f1bfc926425a",
                capri="e7e72fddc44cc3d546af7b038c651f51",
                coacch="c2a48c5eae535d4b8fe9c953d9986f1b")
  archive_name=paste(project_name,climate_model,climatescen_name,co2,sep="-")
  archive <- paste0(archive_name, "_rev", archive_rev, "_", resolution, "_", mappings[regionmapping], ".tgz")
  madrat  <- paste0("rev", madrat_rev,"sim4nexus_",  mappings[regionmapping], "_magpie", ".tgz")
  validation  <- paste0("rev", validation_rev,"sim4nexus_",  mappings[regionmapping], "_validation", ".tgz")
  return(c(archive,madrat,validation,calibration,additional_data))
}

### SIM4NEXUS runs ###
#general settings
general_settings<-function(title) {
  source("config/default.cfg")
  cfg$gms$c_timesteps <- "5year"
  cfg$input <- buildInputVector()
  cfg$output <- c(cfg$output,"sustag_report")
  cfg$recalibrate <- FALSE
  cfg<-gms::setScenario(cfg,"cc")
  cfg$gms$c52_carbon_scenario  <- "nocc" # with current LPJmL inputs, carbon must be switched off!
  cfg$gms$c56_emis_policy <- "maccs_excl_cropland_n2o"
  cfg$gms$som <- "cellpool_aug16"
  cfg$gms$c59_som_scenario  <- "cc"
  cfg$gms$forestry  <- "dynamic_may20"
  cfg$gms$maccs  <- "on_sep16" # marginal abatement cost curves
  cfg$gms$factor_costs <- "fixed_per_ton_mar18"
  cfg$title <- paste0("sim4nexus_v6_",title)
  return(cfg)
}

# SSP control runs ###############################################
# SSP2, no mitigation, no climate change
cfg<-general_settings(title="SSP2_NoCC_NoCC_NoMit_base")
cfg<-gms::setScenario(cfg,"SSP2")
cfg<-gms::setScenario(cfg,"nocc")
cfg$input <- buildInputVector(regionmapping="image10",calibration=NULL)
cfg$gms$c59_som_scenario  <- "nocc"
cfg$gms$c52_carbon_scenario  <- "nocc" # with current LPJmL inputs, carbon must be switched off!
cfg$recalibrate <- TRUE
start_run(cfg=cfg,codeCheck=codeCheck)
calib <- magpie4::submitCalibration(name = "calibration_sim4nexus_jan2021")
cfg$recalibrate <- "ifneeded"
