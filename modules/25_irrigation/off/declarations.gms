* With module 25 off, modules 41, 42 and 43 must be active
* (otherwise vm_cost_AEI and vm_water_cost are unbounded)
$ifi "%area_equipped_for_irrigation%" == "off" $abort "Module 25 is off: area_equipped_for_irrigation must not be off"
$ifi "%water_demand%" == "off" $abort "Module 25 is off: water_demand must not be off"
$ifi "%water_availability%" == "off" $abort "Module 25 is off: water_availability must not be off"

variables
 vm_cost_AEI(i)                    Annuitized irrigation expansion costs (mio. USD17MER per yr)
 vm_water_cost(i)                  Cost of volumetric agricultural water pricing (mio. USD17MER per yr)
;

positive variables
 vm_AEI(j)                         Area equipped for irrigation (mio. ha)
 vm_watdem(wat_dem,j)              Amount of water needed in different sectors (mio. m^3 per yr)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_AEI(t,i,type)       Annuitized irrigation expansion costs (mio. USD17MER per yr)
 ov_water_cost(t,i,type)     Cost of volumetric agricultural water pricing (mio. USD17MER per yr)
 ov_AEI(t,j,type)            Area equipped for irrigation (mio. ha)
 ov_watdem(t,wat_dem,j,type) Amount of water needed in different sectors (mio. m^3 per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

