

			class CfgXM8
			{
				extraApps[] = {"ExAd_Unit"}; //"ExAd_JX","ExAd_modChecker",
	
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
			}; 



			class CfgExileArsenal
			{
	
			class Exile_Item_BeefParts { quality = 1; price = 50000; sellPrice = 14;}; // change the buy/sell price to whatever suits.
	
			};
	
	
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
