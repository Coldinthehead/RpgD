library InstanceHolder
{
    public struct InstanceHolder
    {
        public static InstanceZone zoneList[4];
        public static integer zoneListLength = 4;


        static method onInit()
        {
            zoneList[0] = InstanceZone.getObject(gg_rct_Wood0);
            zoneList[0].setTemplateIndex(0);
            zoneList[1] = InstanceZone.getObject(gg_rct_Wood1);
            zoneList[1].setTemplateIndex(1);
            zoneList[2] = InstanceZone.getObject(gg_rct_Wood2);
            zoneList[2].setTemplateIndex(2);
            zoneList[3] = InstanceZone.getObject(gg_rct_Swamp0);
            zoneList[3].setTemplateIndex(3);
        }

        static method removeUnit(unit u)
        {
            integer i;
            for(i = 0 ; i < zoneListLength;i+=1)
            {
                if(zoneList[i].contains(u))
                {
                    zoneList[i].onEnemyDies(u);
                    return;
                }
            }
        }

        static method getInstanceByTag(integer tag)->InstanceZone
        {
            return zoneList[tag];
        }
    }

    public struct InstanceTag
    {
        static integer WOOD0 = 0;
        static integer WOOD1 = 1;
        static integer WOOD2 = 2;
        static integer SWAMP0 = 3;
    }
}