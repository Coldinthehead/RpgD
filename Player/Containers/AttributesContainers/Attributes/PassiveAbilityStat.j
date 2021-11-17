library PassiveAbilityStatLib
{
    public struct PassiveAbilityStat
    {
        integer pid; 
        integer abilityRawCode[12];
        static integer MAX_POWER = 4096;

        public method overrideAbility(integer value)
        {
            integer i;
            integer power = MAX_POWER;
            for(i =12;i> -1;i-=1)
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
            for(i = 0; i < 13;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.attackCodes[i];
            }
        }

        public method setArmourCodes()
        {
            integer i;
            for(i = 0; i < 13;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.armourCodes[i];
            }
        }

        public method setStrCodes()
        {
            integer i;
            for(i = 0; i < 13;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.strCodes[i];
            }
        }

        public method setDexCodes()
        {
            integer i;
            for(i = 0; i < 13;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.dexCodes[i];
            }
        }

        public method setIntCodes()
        {
            integer i;
            for(i = 0; i < 13;i+=1)
            {
                this.abilityRawCode[i] = AbilityRawCodeHolder.intCodes[i];
            }
        }

        public method setAttackSpeedCodes()
        {
            integer i;
            for(i = 0; i < 13;i+=1)
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

            thistype.armourCodes[0] = 'A00D';
            thistype.armourCodes[1] = 'A00E';
            thistype.armourCodes[2] = 'A00F';
            thistype.armourCodes[3] = 'A00G';
            thistype.armourCodes[4] = 'A00H';
            thistype.armourCodes[5] = 'A00I';
            thistype.armourCodes[6] = 'A00J';
            thistype.armourCodes[7] = 'A00K';
            thistype.armourCodes[8] = 'A00L';
            thistype.armourCodes[9] = 'A00M';
            thistype.armourCodes[10] = 'A00N';
            thistype.armourCodes[11] = 'A00O';

            thistype.attackSpeedCodes[0] = 'A00P';
            thistype.attackSpeedCodes[1] = 'A00Q';
            thistype.attackSpeedCodes[2] = 'A00R';
            thistype.attackSpeedCodes[3] = 'A00S';
            thistype.attackSpeedCodes[4] = 'A00T';
            thistype.attackSpeedCodes[5] = 'A00U';
            thistype.attackSpeedCodes[6] = 'A00V';
            thistype.attackSpeedCodes[7] = 'A00W';        
            thistype.attackSpeedCodes[8] = 'A00X';
            thistype.attackSpeedCodes[9] = 'A00Y';
            thistype.attackSpeedCodes[10] = 'A00Z';
            thistype.attackSpeedCodes[11] = 'A010';

            thistype.strCodes[0] = 'A011';
            thistype.strCodes[1] = 'A012';
            thistype.strCodes[2] = 'A013';
            thistype.strCodes[3] = 'A014';
            thistype.strCodes[4] = 'A015';
            thistype.strCodes[5] = 'A016';
            thistype.strCodes[6] = 'A017';
            thistype.strCodes[7] = 'A018';
            thistype.strCodes[8] = 'A019';
            thistype.strCodes[9] = 'A01A';
            thistype.strCodes[10] = 'A01B';
            thistype.strCodes[11] = 'A01C';

            thistype.dexCodes[0] = 'A01D';
            thistype.dexCodes[1] = 'A01E';
            thistype.dexCodes[2] = 'A01F';
            thistype.dexCodes[3] = 'A01G';
            thistype.dexCodes[4] = 'A01H';
            thistype.dexCodes[5] = 'A01I';
            thistype.dexCodes[6] = 'A01J';
            thistype.dexCodes[7] = 'A01K';
            thistype.dexCodes[8] = 'A01L';
            thistype.dexCodes[9] = 'A01M';
            thistype.dexCodes[10] = 'A01N';
            thistype.dexCodes[11] = 'A01O';

            thistype.intCodes[0] = 'A01P';
            thistype.intCodes[1] = 'A01Q';
            thistype.intCodes[2] = 'A01R';
            thistype.intCodes[3] = 'A01S';
            thistype.intCodes[4] = 'A01T';
            thistype.intCodes[5] = 'A01U';
            thistype.intCodes[6] = 'A01V';
            thistype.intCodes[7] = 'A01W';
            thistype.intCodes[8] = 'A01X';
            thistype.intCodes[9] = 'A01Y';
            thistype.intCodes[10] = 'A01Z';
            thistype.intCodes[11] = 'A020';

        }
        
    }
}