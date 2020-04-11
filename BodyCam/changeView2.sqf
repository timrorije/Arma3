params ["_param"];

_selectedIndex = _param select 1;

_player = playerListArray select _selectedIndex;
_name = "";
if(_player isEqualTo "Nothing")then{
	_name = "Nothing";
}else{
	_name = name _player;
};
systemChat  _name;


_view = (findDisplay 1234) displayCtrl 1201;
_text =  "#(argb,512,512,1)r2t("+_name+"_cam,1)";
_view ctrlSetText _text;
