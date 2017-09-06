/** Salty Dog Exile: Recruit Ai V.1 
**  by aussie 2017
**  https://github.com/aussie-battler/Salty-Dog-Exile-Recruit-Ai 
**/

private ["_statue","unit","unitList"];
	if ("Exile_Item_BeefParts" in (magazines player)) then
    {
	player removeItem "Exile_Item_BeefParts";
	disableUserInput true;
	player playMove "AinvPknlMstpSnonWnonDr_medic3"; 
	unitList = ["B_Soldier_F","B_Soldier_lite_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_SL_F","B_Soldier_TL_F","B_soldier_M_F","B_soldier_LAT_F","B_medic_F","B_soldier_repair_F","B_soldier_exp_F","B_Helipilot_F","B_Soldier_A_F","B_soldier_AT_F","B_soldier_AA_F","B_engineer_F","B_crew_F","B_officer_F","B_Pilot_F","B_helicrew_F","B_soldier_PG_F","B_soldier_UAV_F"];
	unit = group player createUnit [unitList select (round(random ((count unitList) - 1))), getPos player, [], 0, "FORM"];
	unit setskill [["aimingAccuracy",0.90],["aimingShake",0.90],["aimingSpeed",0.90],["spotDistance",0.90],["spotTime",0.90],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.90]];
	["SuccessTitleAndText",["Bodyguard Deployed"]] call ExileClient_gui_toaster_addTemplateToast;
	_statue = nearestObject [player, "Land_AncientStatue_01_F"];
	deleteVehicle _statue;
	disableUserInput false;
	}; 
	else
	{
    ["ErrorTitleAndText", ["You need Beef Parts..."]] call ExileClient_gui_toaster_addTemplateToast;
	}; 
}; 
	
