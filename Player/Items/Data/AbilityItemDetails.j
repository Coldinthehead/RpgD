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

        static method onInit()
        {
            thistype.data[0] = AbilityData.getObject('I500','A000');
            thistype.data[0].builder = SpikeSlamBuilder.getObject();
        }
    }

    public struct AbilityData
    {
        integer itemRawCode;
        integer abilityRawCode;
        IAbilityBuilder builder;

        public static method getObject(integer itemCode,integer abilityCode)->thistype
        {
            thistype result = thistype.create();
            result.itemRawCode = itemCode;
            result.abilityRawCode = abilityCode;
            return result;
        }
    }
}