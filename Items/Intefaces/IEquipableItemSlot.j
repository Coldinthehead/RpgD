library IEquipableItemSlotLib
{
    public interface IEquipableItemSlot
    {
        public method canPick(integer pid)->boolean;
        public method pick(integer pid);
        public method drop(integer pid);
    }
}