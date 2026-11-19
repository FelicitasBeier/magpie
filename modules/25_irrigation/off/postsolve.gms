
*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov_cost_AEI(t,i,"marginal")       = vm_cost_AEI.m(i);
 ov_water_cost(t,i,"marginal")     = vm_water_cost.m(i);
 ov_AEI(t,j,"marginal")            = vm_AEI.m(j);
 ov_watdem(t,wat_dem,j,"marginal") = vm_watdem.m(wat_dem,j);
 ov_cost_AEI(t,i,"level")          = vm_cost_AEI.l(i);
 ov_water_cost(t,i,"level")        = vm_water_cost.l(i);
 ov_AEI(t,j,"level")               = vm_AEI.l(j);
 ov_watdem(t,wat_dem,j,"level")    = vm_watdem.l(wat_dem,j);
 ov_cost_AEI(t,i,"upper")          = vm_cost_AEI.up(i);
 ov_water_cost(t,i,"upper")        = vm_water_cost.up(i);
 ov_AEI(t,j,"upper")               = vm_AEI.up(j);
 ov_watdem(t,wat_dem,j,"upper")    = vm_watdem.up(wat_dem,j);
 ov_cost_AEI(t,i,"lower")          = vm_cost_AEI.lo(i);
 ov_water_cost(t,i,"lower")        = vm_water_cost.lo(i);
 ov_AEI(t,j,"lower")               = vm_AEI.lo(j);
 ov_watdem(t,wat_dem,j,"lower")    = vm_watdem.lo(wat_dem,j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

