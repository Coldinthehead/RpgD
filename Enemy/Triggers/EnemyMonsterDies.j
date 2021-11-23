library EnemyMonsterDieEventLib
{

    public function onMonsterDie()
    {
       ExpReward.onMonsterDie();
       if(RectContainsCoords(gg_rct_WoodRect,GetUnitX(GetTriggerUnit()) , GetUnitY(GetTriggerUnit())) )
       {
           WoodZone.onEnemyDies(GetTriggerUnit());
       }
    }
    
    function onInit()
    {
        trigger trig = CreateTrigger();
        TriggerRegisterPlayerUnitEvent(trig, Player(11), EVENT_PLAYER_UNIT_DEATH, null);
        TriggerAddAction(trig,function onMonsterDie);
    }
}