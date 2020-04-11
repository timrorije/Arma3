getViewer = {

	params["_player"];

	_player addAction["Open Cam Viewer", {execVM "openDialog.sqf"}];

};

_p = _this select 1;
[_p] remoteExec ["getViewer",0]; 