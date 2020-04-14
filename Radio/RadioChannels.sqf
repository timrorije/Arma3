SetupRadio = {

		if("ItemRadio" in assignedItems player)then{
				[typeOf player, 1, ["ACE_SelfActions", "COMS"]] call ace_interact_menu_fnc_removeActionFromClass;
				RadioChannels = [];
				_RadioChannels = [
					[
						[239,35,35,1],
						"90.0 FM",
						"90 ([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						2
					],
					[
						[244,208,102,1],
						"80.0 FM",
						"80 ([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						3
					],
					[
						[239,35,35,1],
						"70.0 FM",
						"70 ([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						4
					],
					[
						[53,47,248,1],
						"60.0 FM",
						"60 ([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						5
					],
					[
						[115,251,219,1],
						"50.0 FM",
						"50([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						6
					],
					[
						[251,163,115,1],
						"40.0 FM",
						"40([%UNIT_GRP_NAME] %UNIT_NAME) ",
						[],
						7
					],
					[
						[154,115,251,1],
						"30.0 FM",
						"30([%UNIT_GRP_NAME] %UNIT_NAME)",
						[],
						8
					],
					[
						[21,16,13,1],
						"20.0 FM",
						"20([%UNIT_GRP_NAME] %UNIT_NAME)",
						[],
						9
					]
				];
				{

					_channelId = radioChannelCreate[(_x select 0),(_x select 1), (_x select 2),(_x select 3)];
					if(_channelId isEqualTo 0)then{
						RadioChannels pushBack (_x select 4);
					}else{
						RadioChannels pushBack _channelId;
					};
				} forEach _RadioChannels;
			_baseAction = ["COMS", "COMS","",{},{true},{}] call ace_interact_menu_fnc_createAction;
			[(typeOf player), 1, ["ACE_SelfActions"], _baseAction] call ace_interact_menu_fnc_addActionToClass;

			IdToName = {
				params["_Id"];
				_return = "";
				switch(_Id) do{
					case 2:{ _return = 90.0;};
					case 3:{_return = 80.0;};
					case 4:{_return = 70.0;};
					case 5:{_return = 60.0;};
					case 6:{_return = 50.0;};
					case 7:{_return = 40.0;};
					case 8:{_return = 30.0;};
					case 9:{_return = 20.0;};
				};

					_return;
			};
			NameToId = {
				params["_Name"];
				_return = 9;
				switch(_Name)do{
					case 90.0:{ _return = 2};
					case 80.0:{_return = 3};
					case 70.0:{_return = 4};
					case 60.0:{_return = 5};
					case 50.0:{_return = 6};
					case 40.0:{_return = 7};
					case 30.0:{_return = 8};
					case 20.0:{_return = 9};
					};
					_return;
			};
			{
				_name = [_x] call IdToName;
				myaction = [str _name,
				str _name,
				"",
				{
					params ["_target", "_player", "_params", "_actionData"];
					_FMName = _params select 0;
					_id = ([_FMName] call NameToId);
					_exists = setCurrentChannel (_id +5);
					if(_exists isEqualTo true)then{
						_id radioChannelRemove [this];
						setCurrentChannel 0;
						colorText[] = {0,0,1,1};
						systemChat ("Signed out of Channel " + str _FMName);
						
					}else{
						
						_id radioChannelAdd [this];
						setCurrentChannel (_id +5);
						systemChat ("Signed in to Channel " + str _FMName);
					}
				},
				{("ItemRadio" in assignedItems player)},
				{},
				[_name]] call ace_interact_menu_fnc_createAction;	
				[typeOf player, 1, ["ACE_SelfActions","COMS"], myaction] call ace_interact_menu_fnc_addActionToClass;
			} forEach RadioChannels;

			
		}		
	};

systemChat "Initialising";
[]remoteExec["SetupRadio", player];

