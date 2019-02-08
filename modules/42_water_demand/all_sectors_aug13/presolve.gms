*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

if (sum(sameas(t_past,t),1) = 1,

i42_env_flow_policy(t,i) = f42_env_flow_policy(t,"off");

else

$ifthen "%c42_env_flow_policy%" == "mixed" i42_env_flow_policy(t,i) = im_development_state(t,i) * f42_env_flow_policy(t,"on");
$else i42_env_flow_policy(t,i) = f42_env_flow_policy(t,"%c42_env_flow_policy%");
$endif

);


* Agricultural water demand
ic42_wat_req_k(j,k) = i42_wat_req_k(t,j,k);
ic42_env_flow_policy(i) = i42_env_flow_policy(t,i);

* water consumption in industry, sanitation, ecosystem
* depends on the socioeconomic scenario
if((s42_watdem_nonagr_scenario = 1),
 v42_watdem.fx(watdem_ineldo,j) = f42_watdem_ineldo(t,j,"SSP2",watdem_ineldo);
Elseif(s42_watdem_nonagr_scenario = 2),
 v42_watdem.fx(watdem_ineldo,j) = f42_watdem_ineldo(t,j,"A2",watdem_ineldo);
Elseif(s42_watdem_nonagr_scenario = 3),
 v42_watdem.fx(watdem_ineldo,j) = f42_watdem_ineldo(t,j,"B1",watdem_ineldo);
);

* Environmental flow scenarios depending on the switch s42_env_flow_scenario
i42_env_flows_base(t,j) = s42_env_flow_base_fraction * sum(wat_src, i42_wat_avail(t,wat_src,j));

if((s42_env_flow_scenario=0),
 i42_env_flows_base(t,j) = 0;
 i42_env_flows(t,j) = 0;
Elseif(s42_env_flow_scenario=1),
  i42_env_flows(t,j) = s42_env_flow_fraction * sum(wat_src, i42_wat_avail(t,wat_src,j));
);

v42_watdem.fx("ecosystem",j) = sum(cell(i,j), i42_env_flows_base(t,j) * (1-ic42_env_flow_policy(i)) +
                                                          i42_env_flows(t,j) * ic42_env_flow_policy(i));


* irrigation efficiency
if((s42_irrig_eff_scenario = 1),
 v42_irrig_eff.fx(j) = s42_irrigation_efficiency;
Elseif (s42_irrig_eff_scenario=2),
 v42_irrig_eff.fx(j) = 1/(1+2.718282**((-22160-sum(cell(i,j),im_gdp_pc_mer("y1995",i)))/37767));
Elseif (s42_irrig_eff_scenario=3),
 v42_irrig_eff.fx(j) = 1/(1+2.718282**((-22160-sum(cell(i,j),im_gdp_pc_mer(t,i)))/37767));
);


* Water availability
v42_watavail.fx("surface",j) = i42_wat_avail(t,"surface",j);
v42_watavail.fx("technical",j)= i42_wat_avail(t,"technical",j);
v42_watavail.fx("ground",j) = i42_wat_avail(t,"ground",j);
v42_watavail.fx("ren_ground",j) = i42_wat_avail(t,"ren_ground",j);

* Update groundwater availability to include overuse from exogenous demands
v42_watavail.fx("ground",j) = v42_watavail.up("ground",j)
                             + (((sum(watdem_exo, v42_watdem.lo(watdem_exo,j))-sum(wat_src,v42_watavail.up(wat_src,j)))*1.01))
                             $(sum(watdem_exo, v42_watdem.lo(watdem_exo,j))-sum(wat_src,v42_watavail.up(wat_src,j))>0);
