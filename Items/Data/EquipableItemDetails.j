library EquipableItemDetailsLib
{
    public struct EquipableItemDetails
    {
        static EquipableItemData data[9];
        static integer dataLength = 9;

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
            data[0] = EquipableItemData.getObject('I001');
            data[0].slot = OneHandedWeapon.getObject();
            data[0].stat[0] = AttackDamageStat.getObject(35);

            data[1] = EquipableItemData.getObject('I002');
            data[1].slot = OneHandedWeapon.getObject();
            data[1].stat[0] = AttackDamageStat.getObject(65);

            data[2] = EquipableItemData.getObject('I003');
            data[2].slot = OneHandedWeapon.getObject();
            data[2].stat[0] = AttackDamageStat.getObject(110);

            data[3] = EquipableItemData.getObject('I005');
            data[3].slot = BodyArmourSlot.getObject();
            data[3].stat[0] = ArmourStat.getObject(2);
            data[3].stat[1] = HealthStat.getObject(100);

            data[4] = EquipableItemData.getObject('I006');
            data[4].slot = BodyArmourSlot.getObject();
            data[4].stat[0] = ArmourStat.getObject(2);
            data[4].stat[1] = HealthStat.getObject(150);

            data[5] = EquipableItemData.getObject('I007');
            data[5].slot = BodyArmourSlot.getObject();
            data[5].stat[0] = ArmourStat.getObject(3);
            data[5].stat[1] = HealthStat.getObject(225);

            data[6] = EquipableItemData.getObject('I008');
            data[6].slot = HelmetSlot.getObject();
            data[6].stat[0] = ArmourStat.getObject(1);
            data[6].stat[1] = HealthStat.getObject(30);
            
            data[7] = EquipableItemData.getObject('I009');
            data[7].slot = HelmetSlot.getObject();
            data[7].stat[0] = ArmourStat.getObject(1);
            data[7].stat[1] = HealthStat.getObject(60);

            data[8] = EquipableItemData.getObject('I00A');
            data[8].slot = HelmetSlot.getObject();
            data[8].stat[0] = ArmourStat.getObject(2);
            data[8].stat[1] = HealthStat.getObject(90);
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