library SlotContainerlib
{
    public struct SlotContainer
    {
        integer rightHand;
        integer leftHand;
        integer helment;
        integer body;
        integer ring;
        integer cloak;

        integer pid;

        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.rightHand = 0;
            result.leftHand = 0;
            result.helment = 0;
            result.body = 0;
            result.ring = 0 ;
            result.cloak = 0 ;
            result.pid = pid;
            return result;
        }

    }
}