library CastAbilityTriggers
{

    function onActiveAbilityCast()
    {
        integer pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
        integer abilityRawCode = GetSpellAbilityId();
        integer abilityDataId;
        integer targetType;
        real x;
        real y;

        if(GetUnitTypeId(GetTriggerUnit()) == 'h004')
        {
            ButtonDetails.onButtonDown(pid,abilityRawCode);
            return;
        }
        abilityDataId = AbilityItemDetails.getIndexByAbilityRawCode(abilityRawCode);
        targetType = AbilityItemDetails.data[abilityDataId].targetType;
        
        if(targetType == ABILITY_TARGET_TYPE.MELEE_HIT)
        {
            x = GetUnitX(GetTriggerUnit()) + (55 * Cos(GetUnitFacing(GetTriggerUnit()) * bj_DEGTORAD));
            y = GetUnitY(GetTriggerUnit()) + (55 * Sin(GetUnitFacing(GetTriggerUnit())  * bj_DEGTORAD));
        }
        BJDebugMsg(R2S(x) + " " + R2S(y));
        PlayerEntity.instances[pid].cast(abilityRawCode,x,y,GetUnitFacing(GetTriggerUnit()));
    }


    function onInit()
    {
        trigger t = CreateTrigger();
        integer i;
        for(i = 0; i < 8;i+=1)
        {
            TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_SPELL_EFFECT, null);
        }
        TriggerAddAction(t,function onActiveAbilityCast);
        
    }

}