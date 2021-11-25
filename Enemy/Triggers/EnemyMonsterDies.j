library EnemyMonsterDieEventLib
{

    public function onMonsterDie()
    {
       ExpReward.onMonsterDie(GetTriggerUnit());
       InstanceHolder.removeUnit(GetTriggerUnit());
    }
    
    function onInit()
    {
        trigger trig = CreateTrigger();
        TriggerRegisterPlayerUnitEvent(trig, Player(11), EVENT_PLAYER_UNIT_DEATH, null);
        TriggerAddAction(trig,function onMonsterDie);
    }
}