
AttachCamera = {

	params["_player"];	
	_cam = "camera" camCreate[0,0,0];
	_cam attachTo [_player, [0,0.5,1.5]];
	_name = (name _player) + "_cam";
	hint _name;
	_cam cameraEffect ["INTERNAL","FRONT",_name];
};

_p = _this select 1;
[_p] remoteExec["AttachCamera",0];
