library RingSlotLib
{
    public struct RingSlot extends IEquipableItemSlot
    {
        public method canPick(integer pid)->boolean
        {
            return PlayerEntity.instances[pid].equippedItemList.ring == 0;
        }

        public method pick(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.ring +=1;
        }

        public method drop(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.ring -=1;
        }

        public static method getObject()->thistype { return thistype.create();}
    }
}