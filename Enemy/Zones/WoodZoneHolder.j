library WoodZoneHolderLib
{
    public struct WoodZoneHolder
    {
        static boolean isActive;
        static boolean isInitialized;

        static SpawnPosition spawnPosition;
        static group woodMonsterGroup;
     

        public static method clearZone()
        {
            unit n = FirstOfGroup(woodMonsterGroup);
            while(n != null)
            {
                GroupRemoveUnit(woodMonsterGroup,n);
                RemoveUnit(n);
                n = FirstOfGroup(woodMonsterGroup);
                BJDebugMsg(GetUnitName(n));
            }
            //GroupClear(woodMonsterGroup);
            n = null;
            isActive = false;
        }

        public static method createMonsters(integer level)
        {
            MonsterData template =  MonsterTemplate.getMonsterTemlateForWood(level);
            MonsterProvider.createMonsters(woodMonsterGroup,spawnPosition,template);
        }

        public static method CreateZone(integer level)
        {
            if(isInitialized == false)
            {
                initialize();
                isInitialized = true;
            }     
            if(isActive)
            {
                return;

            }
            createMonsters(level);
            isActive = true;
        }


        static method initialize()
        {
            thistype.isActive = false;
            thistype.spawnPosition = SpawnPosition.getObject();
            thistype.spawnPosition.setRect(gg_rct_WoodRect);
            woodMonsterGroup = CreateGroup();
        }
        static method onInit()
        {
            isInitialized = false;
        }
    }

}