RD_hunterMax = 6;
RD_hunterCount = 0;


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
	{
			//This event handler detects if  unit is killed and checks if his entire group is dead. If the group is all dead it reduces current count and begins building new group
			_x addMPEventHandler ["mpkilled", {if ({alive _x} count units group (_this select 0) < 1) then {RD_hunterCount = RD_hunterCount - 1; null = [] spawn RD_fnc_maintainHunters;};}];
			
	}forEach units _grp;
	_grp setBehaviour "SAFE";
	_grp setFormation "FILE";
		
	[_grp, downedCrew,30,100] spawn BIS_fnc_stalk;

	
	RD_hunterCount = RD_hunterCount + 1;


};

RD_fnc_findHunterArea = {

	_center = _this select 0;
	
	_minDist = 600;
	_maxDist = 800;
	_objDist = 2;
	_waterMode = 0;
	_maxGrad = 0.1;
	_shoreMode = 0;
		
	_hunterSpawn = [];
		
	_hunterSpawn = [_center,_minDist,_maxDist,_objDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
		
	[_hunterSpawn,_center] spawn RD_fnc_spawnPatrol;

};

RD_fnc_maintainHunters = {

	
	if (RD_hunterCount < RD_hunterMax) then 
	{
		_center = getPos  (leader downedCrew);
		[_center] spawn RD_fnc_findHunterArea;
		_delay = 20 + random 20;
		sleep _delay;
	};
	
	
};


for [{_a=0}, {_a <= RD_hunterMax}, {_a = _a + 1}] do 
{
		
		_center = getPos (leader downedCrew);
		[_center] spawn RD_fnc_findHunterArea;
		_delay = 20 + random 20;
		sleep _delay;
};






