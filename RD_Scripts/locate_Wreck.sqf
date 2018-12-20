/*
Sample call for this script should look like this 

["downedCrewZone_", downedChopper] execVM "RD_Scripts\locate_Wreck.sqf"; 

*/

_zoneNames	= _this select 0; 		//"downedCrewZone_"
_vehicle	= _this select 1;		//Object to relocate downedChopper  need to figure out what class the vehicle is "RHS_UH60M_d"
_vehicleClass = typeOf _vehicle;	//This should return the vehicle class to allow the search to find a large enough area


RD_fnc_findZones = {
	_startString = _this select 0;
	_downedZones = [];
	_checkNum = 1;
	_checkString = _startString + str _checkNum;
	while {(getmarkerColor _checkString) != "" } do 
	{
		_downedZones pushback _checkString;
		_checkNum = _checkNum + 1;
		_checkString = _startString + str _checkNum;
	};
	
	//Selecting the zone to use for the script
	_chosenLocation = selectRandom _downedZones;
	_downedZones deleteAt ( _downedZones find _chosenLocation);
		
	//Cleaning up 
	_checkNum = nil;
	_checkString = nil;
	{
		deleteMarker _x;
	}forEach _downedZones;
	
	//Returing "The Chosen One"
	_chosenLocation;
};


RD_fnc_findWreckLocation = {

	_startingZone = _this select 0;
	_vehicleToLocate = _this select 1; //"RHS_UH60M_d"
	
	_wreckLocation = [];
	
	while {(count _wreckLocation) == 0} do {
		_randomSpot = _startingZone call BIS_fnc_randomPosTrigger;
		_wreckLocation = _randomSpot findEmptyPosition[5,200,_vehicleToLocate];
	};

	_startingZone = nil;
	_randomSpot = nil;
	
	_wreckLocation;

};


RD_fnc_moveVehicle = {
	
	_targetPos = _this select 0;
	_targetVehicle = _this select 1;
	
	_targetVehicle setPos _targetPos;
	_targetVehicle setDir floor random 360;
	_targetVehicle allowDamage false;

	_targetPos = nil;
	_targetVehicle = nil;
	

};

RD_fnc_setVehicleTask = {
	
	_location = _this select 0;
	
	[west,["Rescue_Crew"],["Recover Crew","Recover Crew","Locate and recover vehicle crew"],(getMarkerPos _location),true,0,true,"search",true] call BIS_fnc_taskCreate;
	
};


/*
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
	[_grp,1] setWaypointSpeed "LIMITED";
	[_grp,1] setWaypointBehaviour "SAFE";
	[_grp,1] setWaypointCompletionRadius 15;
	_grp setCurrentWaypoint [_grp, 1];
	//Stalk isn't working. Try deleting group in (group this)
	//[_grp,1] setWaypointStatements ["true","_stalking = [(group this),downedCrew] spawn BIS_fnc_stalk;"];
	
	{
		_grp reveal [_x,4];
	}forEach units downedCrew;
	
	
	[_grp,1] setWaypointStatements ["true","_stalking = [(group this),downedCrew] spawn BIS_fnc_stalk;"];
		
		
	


};

*/


_location = [_zoneNames] call RD_fnc_findZones;

_wreckSpot = [_location, _vehicleClass] call RD_fnc_findWreckLocation;

[_wreckSpot, _vehicle] call RD_fnc_moveVehicle;

[_location] call RD_fnc_setVehicleTask;

//[_wreckSpot] spawn RD_fnc_findHunterArea;
[_wreckSpot] execVM "RD_Scripts\hunterGroups.sqf";

















