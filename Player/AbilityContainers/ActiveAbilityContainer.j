library ActiveAbilityContainer
{
    public struct ActiveAbilityContainer
    {
        integer pid;

        IActiveAbility abilityList[6];
        private static integer length = 6;

        public method get(integer abilityRawCode)->IActiveAbility
        {
            integer index = this.contains(abilityRawCode);
            if(index != -1)
            {
                return abilityList[index];
            }
            return -1;
        }

        public method tryAddAbility(AbilityData data)->boolean
        {
            integer index = contains(data.abilityRawCode);
            if(index == -1)
            {
                index = getFreeIndex();
                abilityList[index] = data.builder.build(this.pid,data.abilityRawCode);
                return true;
            }
            return false;
        }

        public method contains(integer rawCode)->integer
        {
            integer i;
            for(i = 0; i < thistype.length;i+=1)
            {
                if(abilityList[i].getRawCode() == rawCode)
                {
                    return i;
                }
            }
            return -1;
        }

        private method getFreeIndex()->integer
        {
            integer i;
            for(i = 0; i < thistype.length;i+=1)
            {
                if(abilityList[i] == 0)
                {
                    return i;
                }
            }
            return -1;
        }

        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            return result;
        }

    }
}