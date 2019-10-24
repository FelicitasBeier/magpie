
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/43_water_availability/water_policy_oct19/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/43_water_availability/water_policy_oct19/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/43_water_availability/water_policy_oct19/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/43_water_availability/water_policy_oct19/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/43_water_availability/water_policy_oct19/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/43_water_availability/water_policy_oct19/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/43_water_availability/water_policy_oct19/presolve.gms"
$Ifi "%phase%" == "solve" $include "./modules/43_water_availability/water_policy_oct19/solve.gms"
$Ifi "%phase%" == "intersolve" $include "./modules/43_water_availability/water_policy_oct19/intersolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/43_water_availability/water_policy_oct19/postsolve.gms"
$Ifi "%phase%" == "nl_fix" $include "./modules/43_water_availability/water_policy_oct19/nl_fix.gms"
$Ifi "%phase%" == "nl_release" $include "./modules/43_water_availability/water_policy_oct19/nl_release.gms"
$Ifi "%phase%" == "nl_relax" $include "./modules/43_water_availability/water_policy_oct19/nl_relax.gms"
*######################## R SECTION END (PHASES) ###############################
