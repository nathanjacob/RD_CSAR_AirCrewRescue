//Definining Custom Unit Classes

ME_Militia_Inf = ["LOP_AM_OPF_Infantry_Engineer","LOP_AM_OPF_Infantry_Corpsman","LOP_AM_OPF_Infantry_GL","LOP_AM_OPF_Infantry_Rifleman_6","LOP_AM_OPF_Infantry_Rifleman","LOP_AM_OPF_Infantry_Rifleman_2",
			"LOP_AM_OPF_Infantry_Rifleman_4","LOP_AM_OPF_Infantry_Rifleman_5","LOP_AM_OPF_Infantry_Rifleman_3","LOP_AM_OPF_Infantry_AT","LOP_AM_OPF_Infantry_Marksman","LOP_AM_OPF_Infantry_AR",
			"LOP_AM_OPF_Infantry_AR_Asst","LOP_AM_OPF_Infantry_SL"];
			
ME_Militia_Cars = ["LOP_AM_OPF_BM21","LOP_AM_OPF_Landrover","LOP_AM_OPF_Landrover_M2","LOP_AM_OPF_Nissan_PKM","LOP_AM_OPF_Offroad","LOP_AM_OPF_Offroad_M2","LOP_AM_OPF_UAZ","LOP_AM_OPF_UAZ_AGS",
			"LOP_AM_OPF_UAZ_DshKM","LOP_AM_OPF_UAZ_Open","LOP_AM_OPF_UAZ_SPG"];
			
ME_Militia_Armor = ["LOP_AM_OPF_BTR60"];

ME_Militia_Static = ["LOP_AM_OPF_Static_AT4","LOP_AM_OPF_Igla_AA_pod","LOP_AM_OPF_AGS30_TriPod","LOP_AM_OPF_Static_DSHKM","LOP_AM_OPF_Kord","LOP_AM_OPF_Kord_High","LOP_AM_OPF_Static_M2",
			"LOP_AM_OPF_Static_M2_MiniTripod","LOP_AM_OPF_Static_Mk19_TriPod","LOP_AM_OPF_NSV_TriPod","LOP_AM_OPF_Static_SPG9","LOP_AM_OPF_Static_ZU23"];
			
//Independent Forces
Peshmerga_Inf = ["LOP_PESH_IND_Infantry_Corpsman","LOP_PESH_IND_Infantry_SL","LOP_PESH_IND_Infantry_Engineer","LOP_PESH_IND_Infantry_GL","LOP_PESH_IND_Infantry_AT","LOP_PESH_IND_Infantry_MG",
			"LOP_PESH_IND_Infantry_Marksman","LOP_PESH_IND_Infantry_Rifleman_4","LOP_PESH_IND_Infantry_Rifleman","LOP_PESH_IND_Infantry_Rifleman_2","LOP_PESH_IND_Infantry_Rifleman_3",	
			"LOP_PESH_IND_Infantry_Sniper","LOP_PESH_IND_Infantry_TL"];

Peshmerga_Cars = ["LOP_PESH_IND_BM21","LOP_PESH_IND_HEMTT_Mover_D","LOP_PESH_IND_HEMTT_Covered_D","LOP_PESH_IND_HEMTT_Box_D","LOP_PESH_IND_HEMTT_Transport_D","LOP_PESH_IND_M1025_W_M2","LOP_PESH_IND_M1025_W_Mk19",
			"LOP_PESH_IND_M1025_D","LOP_PESH_IND_M998_D_4DR","LOP_PESH_IND_Nissan_PKM","LOP_PESH_IND_Offroad","LOP_PESH_IND_Offroad_M2","LOP_PESH_IND_HEMTT_Fuel_D","LOP_PESH_IND_HEMTT_Ammo_D"];
			
Peshmerga_Static = ["LOP_PESH_IND_Static_D30","LOP_PESH_IND_Static_AGS17","LOP_PESH_IND_Static_DSHKM","LOP_PESH_IND_Static_M252","LOP_PESH_IND_NSV_TriPod","LOP_PESH_IND_Static_SPG9","LOP_PESH_IND_ZU23"];

//Civilian Units
Afghan_Civ_Inf = ["LOP_Tak_Civ_Man_06","LOP_Tak_Civ_Man_08","LOP_Tak_Civ_Man_07","LOP_Tak_Civ_Man_05","LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_10","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_09","LOP_Tak_Civ_Man_11",
			"LOP_Tak_Civ_Man_12","LOP_Tak_Civ_Man_04","LOP_Tak_Civ_Man_14","LOP_Tak_Civ_Man_13","LOP_Tak_Civ_Man_16","LOP_Tak_Civ_Man_15"];

Afgan_Civ_Cars = ["LOP_TAK_Civ_Landrover","LOP_TAK_Civ_Offroad","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open","LOP_TAK_Civ_Ural","LOP_TAK_Civ_Ural_open","C_Truck_02_fuel_F"];


//RedDevil Scripts

["downedCrewZone_", downedChopper] execVM "RD_Scripts\locate_Wreck.sqf"; 


//Other Authors scripts
[] execVM "eos\OpenMe.sqf";





[] spawn {
     while {true} do {
          {
               if (!isNull (getAssignedCuratorUnit _x)) then {
                    _x addCuratorEditableObjects [allUnits + vehicles + (allMissionObjects "All"),true];
               };
          } count allCurators;
          sleep 5;
     };
};
