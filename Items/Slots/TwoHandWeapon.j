library TwoHandWeaponSlotLib
{
     public struct TwoHandedWeapon extends IEquipableItemSlot
    {
        public method canPick(integer pid)->boolean
        {
            return PlayerEntity.instances[pid].equippedItemList.rightHand == 0 
            && PlayerEntity.instances[pid].equippedItemList.leftHand == 0;
        }

        public method pick(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.rightHand +=1;
            PlayerEntity.instances[pid].equippedItemList.leftHand +=1;
                    }

        public method drop(integer pid)
        {
            PlayerEntity.instances[pid].equippedItemList.rightHand -=1;
            PlayerEntity.instances[pid].equippedItemList.leftHand -=1;

        }

        public static method getObject()->thistype { return thistype.create();}
    }
}