/*
 * Author: PabstMirror,commy2, esteldunedain, Ruthberg
 * Gets magazine children for interaciton menu
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return value:
 * ChildActiosn<ARRAY>
 *
 * Example:
 * [player, player] call ace_magazinerepack_fnc_getMagazineChildren
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unitMagazines", "_unitMagCounts", "_xFullMagazineCount", "_index", "_childCondition", "_actions", "_displayName", "_picture", "_action"];

PARAMS_2(_target,_player);

// get all mags and ammo count
_unitMagazines = [];
_unitMagCounts = [];
{
    EXPLODE_2_PVT(_x,_xClassname,_xCount);
    _xFullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _xClassname >> "count");

    if ((_xCount != _xFullMagazineCount) && {_xCount > 0}) then {//for every partial magazine
        _index = _unitMagazines find _xClassname;
        if (_index == -1) then {
            _unitMagazines pushBack _xClassname;
            _unitMagCounts pushBack [_xCount];
        } else {
            (_unitMagCounts select _index) pushBack _xCount;
        };
    };
} forEach (magazinesAmmoFull _player);

_childCondition = {
    PARAMS_3(_target,_player,_classname);
    (_classname in (magazines _player)) && {[_player, _player, ["isNotInside"]] call EFUNC(common,canInteractWith)}
};

//Create the action children for all appropriate magazines
_actions = [];
{
    if ((count (_unitMagCounts select _forEachIndex)) >= 2) then {// Ignore invalid magazines types (need 2+ partial mags to do anything)
        _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");

        _action = [_x, _displayName, _picture, {_this call FUNC(startRepackingMagazine)}, _childCondition, {}, _x] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _player];
    };
} forEach _unitMagazines;

_actions
