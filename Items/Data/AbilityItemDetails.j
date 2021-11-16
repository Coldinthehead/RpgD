library AbilityItemDetailsLib
{
    public struct AbilityItemDetails
    {
        static AbilityData data[1];
        static integer dataLength = 1;

        public static method getIndexByItemRawCode(integer itemRawCode)->integer
        {
            integer i;
            for(i = 0; i < dataLength;i+=1)
            {
                if(data[i].itemRawCode == itemRawCode)
                {
                        
                    return i;
                }
            }
            return -1;
        }

        public static method getIndexByAbilityRawCode(integer abilityRawCode)->integer
        {
            integer i;
            for(i = 0; i < dataLength;i+=1)
            {
                if(data[i].abilityRawCode == abilityRawCode)
                {
                    return i;
                }
            }
            return -1;
        }

        static method onInit()
        {
            thistype.data[0] = AbilityData.getObject('I500','A000');
            thistype.data[0].builder = SpikeSlamBuilder.getObject();
            thistype.data[0].targetType = 1; // ABILITY_TARGET_TYPE.MELEE_HIT; //1
        }
    }

    public struct AbilityData
    {
        integer itemRawCode;
        integer abilityRawCode;
        integer targetType;
        IAbilityBuilder builder;


        public static method getObject(integer itemCode,integer abilityCode)->thistype
        {
            thistype result = thistype.create();
            result.itemRawCode = itemCode;
            result.abilityRawCode = abilityCode;
            return result;
        }
    }
    public struct ABILITY_TARGET_TYPE
    {
        static integer SELF = 0;
        static integer MELEE_HIT = 1;
        static integer UNIT = 2;
        static integer AOE = 3;

    }
}