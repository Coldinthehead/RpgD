library EquipableItemDetailsLib
{
    public struct EquipableItemDetails
    {
        static EquipableItemData data[1];
        static integer dataLength = 1;

        public static method getEquipableItemByRawCode(integer itemRawCode)->integer
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
            data[0] = EquipableItemData.getObject('I000');
            data[0].slot = OneHandedWeapon.getObject();
            data[0].stat[0] = AttackDamageStat.getObject(25);
        }
    }

    public struct EquipableItemData
    {
        integer itemRawCode;
        IEquipableItemStat stat[6];
        IEquipableItemSlot slot;
        static integer statLength = 6;

        public static method getObject(integer itemRawCode)->thistype
        {
            thistype result = thistype.create();
            result.itemRawCode = itemRawCode;
            return result;
        }
    }
}