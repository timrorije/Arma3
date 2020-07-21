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
		clientInit = "[] execVM '\Display\Scripts\initPlayerLocal.sqf'";
	};
};

class Cfg3DEN
{
	// Configuration of all objects
	class Object
	{
		// Categories collapsible in "Edit Attributes" window
		class AttributeCategories
		{
			// Category class, can be anything
			class MyCategory
			{
				displayName = "A.R.E.S. Picture initilizer"; // Category name visible in Edit Attributes window
				collapsed = 1; // When 1, the category is collapsed by default
				class Attributes
				{
					// Attribute class, can be anything
					class MyAttribute
					{
						//--- Mandatory properties
							displayName = "filename"; // Name assigned to UI control class Title
							tooltip = "!!Only works on TV's!!. Filename relative to your mission folder. eq. ""pictureFolder/picturename.jpg"" "; // Tooltip assigned to UI control class Title
							property = "PictureFileName"; // Unique config property name saved in SQM
							control = "Edit"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes

							// Expression called when applying the attribute in Eden and at the scenario start
							// The expression is called twice - first for data validation, and second for actual saving
							// Entity is passed as _this, value is passed as _value
							// %s is replaced by attribute config name. It can be used only once in the expression
							// In MP scenario, the expression is called only on server.
							expression = "_this setVariable [""ImagePath"",_value];";

							// Expression called when custom property is undefined yet (i.e., when setting the attribute for the first time)
							// Entity (unit, group, marker, comment etc.) is passed as _this
							// Returned value is the default value
							// Used when no value is returned, or when it's of other type than NUMBER, STRING or ARRAY
							// Custom attributes of logic entities (e.g., modules) are saved always, even when they have default value
							defaultValue = "42";

							//--- Optional properties
							unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
							validate = "none"; // Validate the value before saving. If the value is not of given type e.g. "number", the default value will be set. Can be "none", "expression", "condition", "number" or "variable"
							typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
					};
				};
			};
		};
	};
};