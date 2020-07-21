/*

	class :Land_TripodScreen_01_large_F


	texture image.

	Trigger, if within 100 metres.

	


*/
_centerWorld = [ worldSize /2, worldSize/2 ,0];
_screens = nearestObjects[_centerWorld, ["Land_TripodScreen_01_large_F"], (worldSize * 1.5)] ;


setTexture ={
	try{
		params["_screen", "_texture"];
		_screen setObjectTexture [0, _texture];
	}catch{
		systemChat str _exception;
	};
};

setScreen = {
	params["_players", "_screen"];
 
	_texture = _screen getVariable "imagepath";
	{
		
		_id = owner _x;
		[_screen, _texture] remoteExec ["setTexture", _id, false]
		
	} forEach _players;
	

};


{
	_pos = getPos _x;
	_trg = createTrigger ["EmptyDetector", _pos];
	_trg setTriggerArea [100, 100, 0, true];
	_trg setVariable ["ScreenObj", _x];
	_trg triggerAttachVehicle[_player];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements 
	[
		"this", 
		"[thisList, thisTrigger getVariable 'ScreenObj'] call setScreen", 
		""
	];
} forEach _screens;