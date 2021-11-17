library PassiveAbilityStatLib
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

        public method setAttackCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.attackCodes[i];
            }
        }

        public method setArmourCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.armourCodes[i];
            }
        }

        public method setStrCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.strCodes[i];
            }
        }

        public method setDexCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.dexCodes[i];
            }
        }

        public method setIntCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.intCodes[i];
            }
        }

        public method setAttackSpeedCodes()
        {
            integer i;
            for(i = 0; i < 12;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.attackSpeedCodes[i];
            }
        }
        

    }

    public struct AbilityRawCodeHolder
    {
        static integer attackCodes[12];
        static integer armourCodes[12];
        static integer strCodes[12];
        static integer dexCodes[12];
        static integer intCodes[12];
        static integer attackSpeedCodes[12];

        static method onInit()
        {
            thistype.attackCodes[0] = 'A001';
            thistype.attackCodes[1] = 'A002';
            thistype.attackCodes[2] = 'A003';
            thistype.attackCodes[3] = 'A004';
            thistype.attackCodes[4] = 'A005';
            thistype.attackCodes[5] = 'A006';
            thistype.attackCodes[6] = 'A007';
            thistype.attackCodes[7] = 'A008';
            thistype.attackCodes[8] = 'A009';
            thistype.attackCodes[9] = 'A00A';
            thistype.attackCodes[10] = 'A00B';
            thistype.attackCodes[11] = 'A00C';

        }
        
    }
}