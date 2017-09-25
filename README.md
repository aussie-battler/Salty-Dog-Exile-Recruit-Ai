## Salty Dog Exile: Recruit Bodyguard Ai

**Description:** Recruit Ai Body guards from your XM8 or from placed objects on the map. 

**How it works:** Deploy a statue from your Xm8 using beef parts. Scroll on the spawned statue & choose "Recruit Bodyguard". The statue despawns & an ai will appear in your group. 

**Rules:** Can't deploy the ai guard in a safe zone. Ai despawns on restarts. Ai only attacks mission ai (only tested on DMS Ai).

**Command Ai movement:**

1. Press ESC>Configure>Controls>Show:Command

2. Change the "ACTION" of "Select all units" to the key of your choice (I used "semicolon"). Press "OK" and go back to the game.

3. Press "semicolon" to select your Ai, then hit "space bar"

4. Move your mouse to the position you wish the Ai to hold or vehicle you wish the Ai to enter. Now hit the "space bar" :)

**Command Ai to drive:**

1. Exist a vehicle from a passenger seat.
2. Order the Ai will hop in the vehicle.
3. Get in the vehicle & mark waypoints on the map. You can also take over driving.

I would like to change the ai behaviour to help kill other Exile Players out of the players group. Let me know if you have any ideas.


**Install: Recruit Ai from your XM8.**

1. Install ExAd by @Janski https://goo.gl/VBxFFa

2. Drop the DeployVehicle folder into your.mission\ExAdClient\XM8\Apps\DeployVehicle
   
   Make sure you drop the Deploy Vehicle server file in your @ExileServer/addons folder found here https://goo.gl/VopP4g

3. In config.cpp search for class CFGXM8

Add the following to extraApps[] = { };

"ExAd_Unit" 

The line should now read:  extraApps[] = {"ExAd_Unit"};

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

class Exile_Item_BeefParts    { quality = 1; price = 50000; sellPrice = 14;}; // change the buy/sell price to whatever suits.

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
	

**Optional Extra: RECRUIT AI FROM PLACED OBJECTS ON THE MAP.**

1. You will need to place objects (I chose a statue Land_AncientStatue_01_F) around the map using M3Editor and mark them on the map in your mission.sqm file.

Follow this tutorial by @BetterDeadThanZed: https://goo.gl/MZZ6ph

**Want to make changes?**

1. Change the XM8 logo at:

your.mission\ExAdClient\XM8\Apps\DeployVehicle\dog.paa

In config.cpp under "class ExAd_Unit", change the line to suit your logo name

logo = "ExAdClient\XM8\Apps\DeployVehicle\dog.paa";

2. Change the soldiers at:

your.mission\ExAdClient\XM8\Apps\DeployVehicle\bodyguard.sqf (line 7)

Here are the classnames: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER

**Infistar Settings (thanks to @1man):**
Add "Craft Vehicle" to the allowedActions section:

allowedActions[] = {"Break free","Use AutoLockPicker","Craft Vehicle","Hack UAV"};

**Future Updates:**

Would love the ai to attack players not in your group. Let me know if you have ideas on how to do this.

Thanks to @Janski for making the cool EXAD XM8 Apps and @BetterDeadThanZed for the custom buildings to server addons script.

Enjoy!!
aussie


https://raw.githubusercontent.com/aussie-battler/Salty-Dog-Exile-Recruit-Ai/master/20170906170504_1.jpg
