/* 
Basic idea:

- Get object
- Get position Object. 
- Add Trigger on position of object
- With Range 20m

- AddTrigger action
	Action: 
		- Check if there is an AI at the gate (Someone needs to open it right?) 
		- Check if player is in a vehicle (No need opening the gate if there is noone there)
		

Land_Zavora => Door_1
Land_BarGate_F=> Door_1_rot

*/
// _pos = getPosATL triggerGate;
// _object = nearestObject [_pos, "Land_Zavora"];
// systemChat "[Bravo 2] Ian: Friendlies identified: Opening Gate";
// _object animate ["Door_1", 1];




if(isServer) then{
	//VANILLA
	_centerWorld = [ worldSize /2, worldSize/2 ,0];

	_VanillaGates = nearestObjects[_centerWorld, ["Land_BarGate_F"], (worldSize * 1.5)] ;
	_CupGates = nearestObjects[_centerWorld, ["Land_Zavora"], (worldSize * 1.5)] ;
     
	{
		_trg = createTrigger["EmptyDetector", (getPosATL _x)];	
		_trg setVariable ["BarGateObj", _x];
		_trg setTriggerArea[20,20,0,false];
		_trg setTriggerActivation["ANYPLAYER","PRESENT", true];
		_trg setTriggerStatements
		[
			"this", 
			"_objects = nearestObjects [getPos(thisTrigger getVariable ""BarGateObj""),[""Man""],10];;if((count _objects >0)and(side(_objects select 0) == west))then{thisTrigger getVariable ""BarGateObj"" animate [""Door_1_rot"", 1]};",
			"_objects = nearestObjects [getPos(thisTrigger getVariable ""BarGateObj""),[""Man""],10];;if((count _objects >0)and(side(_objects select 0) == west))then{thisTrigger getVariable ""BarGateObj"" animate [""Door_1_rot"", 0]};"
		];

	} forEach _VanillaGates;

	//CUP
	{
		_trg = createTrigger["EmptyDetector", (getPosATL _x)];
		_trg setVariable ["BarGateObj", _x];
		_trg setTriggerArea[20,20,0,false];
		_trg setTriggerActivation["ANYPLAYER","PRESENT", true];
		_trg setTriggerStatements
		[
			"this", 
			"_objects = nearestObjects [getPos(thisTrigger getVariable ""BarGateObj""),[""Man""],10];if((count _objects >0)and(side(_objects select 0) == west))then{thisTrigger getVariable ""BarGateObj"" animate [""Door_1"", 1]};", 
			"_objects = nearestObjects [getPos(thisTrigger getVariable ""BarGateObj""),[""Man""],10];if((count _objects >0)and(side(_objects select 0) == west))then{thisTrigger getVariable ""BarGateObj"" animate [""Door_1"", 0]};"
		];

	} forEach _CupGates;
};
