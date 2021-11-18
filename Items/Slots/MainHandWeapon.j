library MainHandWeaponSlotLib
{
    public struct OneHandedWeapon extends IEquipableItemSlot
    {
        public method canPick(integer pid)->boolean
        {
            return PlayerEntity.instances[pid].equippedItemList.rightHand == 0;
        }

        public method pick(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.rightHand +=1;
        }

        public method drop(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.rightHand -=1;

        }

        public static method getObject()->thistype { return thistype.create();}
    }
}