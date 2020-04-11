createDialog "camViewer";

_ctrl = (findDisplay 1234) displayCtrl 1500;
_ctrl2 = (findDisplay 1234) displayCtrl 1501;
_players = allPlayers;
playerListArray = [];

playerListArray pushBack "Nothing";
	_ctrl lbAdd "Nothing";
	_ctrl2 lbAdd "Nothing";

{
	playerListArray pushBack _x;
	_name = name _x;
	_ctrl lbAdd _name;
	_ctrl2 lbAdd _name;
} forEach _players;