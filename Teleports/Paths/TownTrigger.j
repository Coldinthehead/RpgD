library TownTriggersLib
{

    function onRectEnterTownToWood()
    {
        WoodZone.onPlayerEnter(GetTriggerUnit());
        SetUnitX(GetTriggerUnit(),-2500);
        SetUnitY(GetTriggerUnit(),14977);
        IssueImmediateOrder( GetTriggerUnit(), "stop" );
    }

    function onRectEnterWoodToTown()
    {
        WoodZone.onPlayerExit(GetTriggerUnit());
        SetUnitX(GetTriggerUnit(),10527);
        SetUnitY(GetTriggerUnit(),5100);
        IssueImmediateOrder( GetTriggerUnit(), "stop" );
        
    }

    function onInit()
    {
        trigger townToWood = CreateTrigger();
        trigger woodToTown = CreateTrigger();

        TriggerRegisterEnterRectSimple( townToWood, gg_rct_TownToWood );
        TriggerAddAction( townToWood, function onRectEnterTownToWood);

        TriggerRegisterEnterRectSimple(  woodToTown , gg_rct_WoodToTown);
        TriggerAddAction( woodToTown, function onRectEnterWoodToTown);
        
    }
}