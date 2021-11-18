library BodyArmourSlotLib
{
    public struct BodyArmourSlot extends IEquipableItemSlot
    {
        public method canPick(integer pid)->boolean
        {
            return PlayerEntity.instances[pid].equippedItemList.body == 0;
        }

        public method pick(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.body +=1;
        }

        public method drop(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.body -=1;
        }

        public static method getObject()->thistype { return thistype.create();}
    }
}