library CastAbilityTriggers
{

    function onActiveAbilityCast()
    {
        integer pid = GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
        integer abilityRawCode = GetSpellAbilityId();
        real x = GetSpellTargetX();
        real y = GetSpellTargetY();
        PlayerEntity.instances[pid].cast(abilityRawCode,x,y);
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