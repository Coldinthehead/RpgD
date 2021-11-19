library WoodZoneHolderLib
{
    public struct WoodZoneHolder
    {
        static boolean isActive;
        static SpawnPosition spawnPosition;

        static WoodMonsterData woodMonsterData;

        static group woodMonsterGroup;


        static boolean isInitialized;

        public static method clearZone()
        {
            unit n = FirstOfGroup(woodMonsterGroup);
            while(n != null)
            {
                GroupRemoveUnit(woodMonsterGroup,n);
                RemoveUnit(n);
                n = FirstOfGroup(woodMonsterGroup);
            }
            GroupClear(woodMonsterGroup);
            isActive = false;
        }

        public static method createMonsters(integer level)
        {
            MonsterData template =  woodMonsterData.getSingleMonsterTemplate(level);
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

        private static method initSpawnPosition()
        {
            // group units = CreateGroup();
            // unit n;
            // spawnPosition = SpawnPosition.getObject();
            // GroupEnumUnitsInRect(units,gg_rct_WoodRect,null);
            // n = FirstOfGroup(units);
            // while(n != null)
            // {
            //     spawnPosition.x[spawnPosition.length] = GetUnitX(n);
            //     spawnPosition.y[spawnPosition.length] = GetUnitY(n);
            //     spawnPosition.length +=1;
            //     RemoveUnit(n);

            //     GroupRemoveUnit(units,n);
            //     BJDebugMsg(R2S(spawnPosition.x) + "  " + R2S(spawnPosition.y));
            //     n = FirstOfGroup(units);
            // }
            // DestroyGroup(units);
            // n = null;
            // units = null;
        }   

        static method initialize()
        {
            thistype.isActive = false;
           // initSpawnPosition();
            thistype.spawnPosition = SpawnPosition.getObject();
            thistype.spawnPosition.setRect(gg_rct_WoodRect);
            woodMonsterData = WoodMonsterData.getObject();
            woodMonsterData.addTemplateById(0);
            woodMonsterGroup = CreateGroup();
        }
        static method onInit()
        {
            isInitialized = false;
        }
    }

}