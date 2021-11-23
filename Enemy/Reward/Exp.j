library ExpLib
{
    public struct ExpReward
    {

    private
    {
        static integer minExp = 25;
        static integer maxExp = 45;
        static integer expPerMonsterLevel = 2;

        static real differenceMultiplier = 0.2;
    }

        static method  onMonsterDie()
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
                    BJDebugMsg("unit : " + I2S(GetHandleId(GetTriggerUnit())));
                }
                GroupRemoveUnit(g,n);
                n = FirstOfGroup(g);
            }
            GroupClear(g);
            DestroyGroup(g);
            n = null;
            g = null;
        }
    }

}