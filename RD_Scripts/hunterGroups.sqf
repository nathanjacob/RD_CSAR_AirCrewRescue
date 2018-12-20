_center = _this select 0;


RD_fnc_spawnPatrol = {
	
	_spawnPosition = _this select 0;
	_targetLocation = _this select 1;
	
	_tempArray = [];
	_groupSize = 2 + (floor random 4);
	
	for [{_i=0}, {_i <= _groupSize}, {_i = _i + 1}] do 
	{
		
		_tempArray pushback (selectRandom ME_Militia_Inf);
		
	};
	
	_grp = [_spawnPosition, east, _tempArray] call BIS_fnc_spawnGroup;
	_grp deleteGroupWhenEmpty true;
	_grp  addwaypoint [_targetLocation,1,1];
	[_grp,1] setWaypointType "MOVE";
	[_grp,1] setWaypointFormation "FILE";
	[_grp,1] setWaypointSpeed "NORMAL";
	[_grp,1] setWaypointBehaviour "SAFE";
	[_grp,1] setWaypointCompletionRadius 15;
	_grp setCurrentWaypoint [_grp, 1];
	//[_grp,1] setWaypointStatements ["true","{deleteVehicle _x;}forEach thisList; patrolCount = patrolCount - 1; [] call fnc_spawnSquads;"];
	
	{
		_grp reveal [_x,4];
	}forEach units downedCrew;
	
	
	[_grp,1] setWaypointStatements ["true","_stalking = [(group this),downedCrew] spawn BIS_fnc_stalk;"];	
		
	


};

RD_fnc_findHunterArea = {

	_center = _this select 0;
	
	_minDist = 750;
	_maxDist = 1500;
	_objDist = 2;
	_waterMode = 0;
	_maxGrad = 0.1;
	_shoreMode = 0;
		
	_hunterSpawn = [];
	
	
	_hunterSpawn = [_center,_minDist,_maxDist,_objDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
	while {(_hunterSpawn distance (downedCrew leader)) < 600} do
	{
		_hunterSpawn = [_center,_minDist,_maxDist,_objDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
	};
	
	
	[_hunterSpawn,_center] spawn RD_fnc_spawnPatrol;

};


RD_fnc_findHunterArea = {

	_center = _this select 0;
	
	_minDist = 700;
	_maxDist = 900;
	_objDist = 2;
	_waterMode = 0;
	_maxGrad = 0.1;
	_shoreMode = 0;
		
	_hunterSpawn = [];
	
	_hunterSpawn = [_center,_minDist,_maxDist,_objDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
	
	[_hunterSpawn,_center] spawn RD_fnc_spawnPatrol;

};


[_center] spawn RD_fnc_findHunterArea;

[_center] spawn RD_fnc_findHunterArea;

[_center] spawn RD_fnc_findHunterArea;










