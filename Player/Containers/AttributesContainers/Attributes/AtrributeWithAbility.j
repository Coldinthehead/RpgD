library AttributeWithAbilityLib
{
    public struct PassiveAbilityStat
    {
        integer pid;
        integer abilityRawCode[12];
        static integer MAX_POWER = 2048;

        public method overrideAbility(integer value)
        {
            integer i;
            integer power = MAX_POWER;
            for(i =11;i> -1;i-=1)
            {
                UnitRemoveAbility(PlayerEntity.instances[pid].actor,this.abilityRawCode[i]);
                if(value - power >= 0)
                {
                    UnitAddAbility(PlayerEntity.instances[pid].actor,this.abilityRawCode[i]);
                    value -= power;
                }
                power = power / 2;
            }
        }

        public static method getObject(integer pid)->thistype 
        {
            thistype result = thistype.create();
            result.pid =pid;
            return result;
        }
    }

    struct AbilityRawCodeHolder
    {
        static integer attackCodes[12];
        static integer armourCodes[12];
        static integer strCodes[12];
        static integer dexCodes[12];
        static integer intCodes[12];
        static integer attackSpeedCodes[12];

        static method onInit()
        {

        }
    }
}