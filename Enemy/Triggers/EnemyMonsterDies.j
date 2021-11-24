library EnemyMonsterDieEventLib
{

    public function onMonsterDie()
    {
       ExpReward.onMonsterDie();
       if(RectContainsCoords(gg_rct_WoodRect,GetUnitX(GetTriggerUnit()) , GetUnitY(GetTriggerUnit())) )
       {
           InstanceHolder.getInstanceByTag(InstanceTag.WOOD).onEnemyDies(GetTriggerUnit());
       }
       else if(RectContainsCoords(gg_rct_Swamp,GetUnitX(GetTriggerUnit()) , GetUnitY(GetTriggerUnit())))
       {
           InstanceHolder.getInstanceByTag(InstanceTag.SWAMP).onEnemyDies(GetTriggerUnit());
       }
    }
    
    function onInit()
    {
        trigger trig = CreateTrigger();
        TriggerRegisterPlayerUnitEvent(trig, Player(11), EVENT_PLAYER_UNIT_DEATH, null);
        TriggerAddAction(trig,function onMonsterDie);
    }
}