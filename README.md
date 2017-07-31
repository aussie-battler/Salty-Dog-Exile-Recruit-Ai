Salty Dog Exile: Recruit Ai

Description: Recruit Ai Body guards from either placing objects around the map or from your XM8. 

Install 1: Recruit Ai from placed objects on the map.

1. You will need to place obects (I chose a statue) around the map and mark them on the map in your mission.sqm file.

Follow this tutorial

Install 2: Recruit Ai from your XM8.

1. Install ExAd by @Janski http://www.exilemod.com/topic/13865-exad-package-of-virtual-garagexm8statsbarhalo-parachuteadmin-eventshackinggrindingvehicle-upgrade/

2. Drop the DeployVehicle folder into your.mission\ExAdClient\XM8\Apps\DeployVehicle

3. In config.cpp search for class CFGXM8

+ Add the following to extraApps[] = { };

"ExAd_Unit" 

+ The line should now read:  extraApps[] = {"ExAd_Unit"};

4. Underneath the extraApps line add:

	class ExAd_Unit
	{
		title = "Attack Soldier: x2 Beef Parts needed";
		config = "ExAdClient\XM8\Apps\DeployVehicle\guard.sqf";
		logo = "ExAdClient\XM8\Apps\DeployVehicle\dog.paa";
		bambiState = 0;
		vehicleClass = "Land_AncientStatue_01_F";
		recipe[] = {{"Exile_Item_BeefParts",1}};
		packable = 1;
		autoCleanUp = 1;
		quickFunction = "['ExAd_Unit'] call ExAd_XM8_DV_fnc_spawnVehicle";
		onLoad = "ExAdClient\XM8\Apps\DeployVehicle\guard.sqf";
	};

5. In config.cpp search for BeefParts and change the line to:

class Exile_Item_BeefParts			{ quality = 1; price = 50000; sellPrice = 14;}; // change the buy/sell price to whatever suits.

6. In config.cpp find class CfgInteractionMenus and add this below it:

	class Bodyguard
	{
		targetType = 2;
		target = "Land_AncientStatue_01_F";

		class Actions 
		{
			class Body_guard: ExileAbstractAction
			{
				title = "Recruit Bodyguard";
				condition = "('Exile_Item_BeefParts' in (magazines player) && !ExilePlayerInSafezone)";
				action = "ExAdClient\XM8\Apps\DeployVehicle\bodyguard.sqf";
			};
		};
	};

Future Updates:

Would love the ai to attack players not in your group.
