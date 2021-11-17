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
            integer rand = GetRandomInt(1,4096);
            data[0] = EquipableItemData.getObject('I000');
            data[0].slot = OneHandedWeapon.getObject();
            data[0].stat[0] = AttackDamageStat.getObject(rand);
            data[0].stat[1] = ArmourStat.getObject(rand);
            data[0].stat[2] = AttackSpeedStat.getObject(rand);
            data[0].stat[3] = StrStat.getObject(rand);
            data[0].stat[4] = DexStat.getObject(rand);
            data[0].stat[5] = IntStat.getObject(rand);
            BJDebugMsg(I2S(rand));
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