library TownTriggersLib
{
    function teleportUnit(real x, real y,unit u)
    {
        SetUnitX(u,x);
        SetUnitY(u,y);
        IssueImmediateOrder( u, "stop" );
    }

    function onRectEnterWoodToSwamp()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.SWAMP).onPlayerEnter(GetTriggerUnit());
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD).onPlayerExit(GetTriggerUnit());
            teleportUnit(6474,9687,GetTriggerUnit());
        }
    }

    function onRectEnterSwampToWood()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD).onPlayerEnter(GetTriggerUnit());
            InstanceHolder.getInstanceByTag(InstanceTag.SWAMP).onPlayerExit(GetTriggerUnit());
            teleportUnit(4479,9654,GetTriggerUnit());
        }
    }

    function onRectEnterTownToWood()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD).onPlayerEnter(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(-2500,14977,GetTriggerUnit());
        }
       
    }

    function onRectEnterWoodToTown()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),10527);
            // SetUnitY(GetTriggerUnit(),5100);
            // IssueImmediateOrder( GetTriggerUnit(), "stop" );
            teleportUnit(10525,5100,GetTriggerUnit());
        }

        
    }

    function onInit()
    {
        trigger townToWood = CreateTrigger();
        trigger woodToTown = CreateTrigger();
        trigger woodToSwamp = CreateTrigger();
        trigger swampToWood = CreateTrigger();

        TriggerRegisterEnterRectSimple( townToWood, gg_rct_TownToWood );
        TriggerAddAction( townToWood, function onRectEnterTownToWood);

        TriggerRegisterEnterRectSimple(  woodToTown , gg_rct_WoodToTown);
        TriggerAddAction( woodToTown, function onRectEnterWoodToTown);

        TriggerRegisterEnterRectSimple(  woodToSwamp , gg_rct_WoodToSwamp);
        TriggerAddAction(woodToSwamp , function onRectEnterWoodToSwamp);

        TriggerRegisterEnterRectSimple(  swampToWood , gg_rct_SwampToWood);
        TriggerAddAction(swampToWood , function onRectEnterSwampToWood);

    }
}