library InstanceHolder
{
    public struct InstanceHolder
    {
        public static InstanceZone zoneList[3];


        static method onInit()
        {
            zoneList[InstanceTag.WOOD] = InstanceZone.getObject(gg_rct_WoodRect,0);
            zoneList[InstanceTag.SWAMP] = InstanceZone.getObject(gg_rct_Swamp,8);
        }

        static method getInstanceByTag(integer tag)->InstanceZone
        {
            return zoneList[tag];
        }
    }

    public struct InstanceTag
    {
        static integer DARD_TOWN = 0;
        static integer WOOD = 1;
        static integer SWAMP = 2;
    }
}