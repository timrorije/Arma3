class CfgPatches {

	class insignia_addon
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		version = "1.0.0";
		author[]= {"Timro"};
		authorUrl = "https://discord.gg/sHTaxX";
	};

};

class Extended_PostInit_EventHandlers
{
	class North_Tables
	{
		init = "[] execVM '\AutoGates\Scripts\Script.sqf'";
	};
};