library TownTriggersLib
{
    function teleportUnit(real x, real y,unit u)
    {
        SetUnitX(u,x);
        SetUnitY(u,y);
        IssueImmediateOrder( u, "stop" );
    }

     function onRectEnterSwamp0ToWood2()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD2).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.SWAMP0).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(14132,-191,GetTriggerUnit());
        }
       
    }

    function onRectEnterWood2ToSwamp0()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.SWAMP0).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.WOOD2).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(14353,1039,GetTriggerUnit());
        }
       
    }

    function onRectEnterWood2ToWood1()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD1).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.WOOD2).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(8529,-343,GetTriggerUnit());
        }
       
    }

     function onRectEnterWood1ToWood2()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD2).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.WOOD1).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(9830,-458,GetTriggerUnit());
        }
       
    }


     function onRectEnterWood0ToWood1()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD1).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.WOOD0).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(3826,-2618,GetTriggerUnit());
        }
       
    }

     function onRectEnterWood1ToWood0()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD0).onPlayerEnter(GetTriggerUnit());

            InstanceHolder.getInstanceByTag(InstanceTag.WOOD1).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(2058,-2927,GetTriggerUnit());
        }
       
    }

    function onRectEnterTownToWood0()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD0).onPlayerEnter(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),-2500);
            // SetUnitY(GetTriggerUnit(),14977);
            teleportUnit(-2584,-543,GetTriggerUnit());
        }
       
    }
    

    function onRectEnterWood0ToTown()
    {
        if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
        {
            InstanceHolder.getInstanceByTag(InstanceTag.WOOD0).onPlayerExit(GetTriggerUnit());
            // SetUnitX(GetTriggerUnit(),10527);
            // SetUnitY(GetTriggerUnit(),5100);
            // IssueImmediateOrder( GetTriggerUnit(), "stop" );
            teleportUnit(10525,5100,GetTriggerUnit());
        }

        
    }

    function onInit()
    {
        trigger towntoWood0 = CreateTrigger();
        trigger wood0toTown = CreateTrigger();
        trigger wood0toWood1 = CreateTrigger();
        trigger wood1toWood0 = CreateTrigger();
        trigger wood1toWood2 = CreateTrigger();
        trigger wood2toWood1 = CreateTrigger();
        trigger wood2toSwamp0 = CreateTrigger();
        trigger swamp0toWood2 = CreateTrigger();

        TriggerRegisterEnterRectSimple( towntoWood0, gg_rct_TownToWood);
        TriggerAddAction( towntoWood0, function onRectEnterTownToWood0);

        TriggerRegisterEnterRectSimple(  wood0toTown , gg_rct_Wood0toTown);
        TriggerAddAction( wood0toTown, function onRectEnterWood0ToTown);

        TriggerRegisterEnterRectSimple(  wood0toWood1 , gg_rct_Wood0toWood1);
        TriggerAddAction(wood0toWood1 ,function onRectEnterWood0ToWood1);

        TriggerRegisterEnterRectSimple(  wood1toWood0 , gg_rct_Wood1toWood0);
        TriggerAddAction(wood1toWood0 ,function onRectEnterWood1ToWood0);

        TriggerRegisterEnterRectSimple(  wood1toWood2 , gg_rct_Wood1toWood2);
        TriggerAddAction(wood1toWood2 , function onRectEnterWood1ToWood2);

        TriggerRegisterEnterRectSimple(  wood2toWood1 , gg_rct_Wood2toWood1);
        TriggerAddAction(wood2toWood1 , function onRectEnterWood2ToWood1);

        TriggerRegisterEnterRectSimple(  wood2toSwamp0 , gg_rct_Wood2toSwamp0);
        TriggerAddAction(wood2toSwamp0 , function onRectEnterWood2ToSwamp0);

        TriggerRegisterEnterRectSimple(  swamp0toWood2 , gg_rct_Swamp0toWood2);
        TriggerAddAction(swamp0toWood2 , function onRectEnterSwamp0ToWood2);



    }
}