library ExpLib
{
    private
    {
        integer minExp = 25;
        integer maxExp = 45;
        integer expPerMonsterLevel = 2;

        real differenceMultiplier = 0.2;
    }

    function onMonsterDie()
    {
        group g = CreateGroup();
        unit n;
        real exp;
        GroupEnumUnitsInRange(g,GetUnitX(GetTriggerUnit()),GetUnitY(GetTriggerUnit()),2000,null);
        n = FirstOfGroup(g);
        while(n != null)
        {
            if(IsUnitType(n, UNIT_TYPE_HERO) == true)
            {
                exp = GetRandomInt(minExp,maxExp) + (GetUnitLevel(GetTriggerUnit()) * expPerMonsterLevel);
                exp += exp*  (differenceMultiplier * (GetUnitLevel(GetTriggerUnit()) - GetUnitLevel(n)));
                exp *=  (100 - GetUnitLevel(n)) / 100;
                if(exp <= 0)
                {
                    exp = 1;
                }
                AddHeroXP(n, R2I(exp), true);
                BJDebugMsg("Gained + " +  R2S(exp));
            }
            GroupRemoveUnit(g,n);
            n = FirstOfGroup(g);
        }
        GroupClear(g);
        DestroyGroup(g);
        n = null;
        g = null;
    }

    public struct ExpFromKill
    {

        static method onInit()
        {
            trigger trig = CreateTrigger();
            TriggerRegisterPlayerUnitEvent(trig, Player(11), EVENT_PLAYER_UNIT_DEATH, null);
            TriggerAddAction(trig,function onMonsterDie);
        }
    }
}