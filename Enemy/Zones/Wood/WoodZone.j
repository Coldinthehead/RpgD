library WoodZoneLib 
{
    public struct WoodZone
    {
        static boolean isInitialized = false;
        static boolean isActive = false;
        static boolean canClear = false;

        static SpawnPosition spawnPoints;
        static MonsterHolder monsterHolder;
        
        static integer playerCountInside = 0;


        public static method onPlayerEnter(unit actor)
        {
            playerCountInside += 1;
            if(isInitialized == false)
            {
                thistype.initialize();
                isInitialized = true;
            }
            if(isActive == false)
            {
                thistype.spawnMonsters();
            }
        }

        public static method onPlayerExit(unit actor)
        {
            playerCountInside -= 1;
            if(playerCountInside == 0)
            {
                if(canClear)
                {
                    thistype.clearLocation();
                }
            }
        }

        public static method spawnMonsters()
        {
            MonsterCreator.createMonstersInWoodZone(monsterHolder,spawnPoints);
            isActive = true;
        }

        public static method clearLocation()
        {
            if(isActive == false)
            {
                return;
            }
            monsterHolder.clearData();
        }

        public static method initialize()
        {
            thistype.isActive = false;
            thistype.spawnPoints = SpawnPosition.getObject();
            thistype.spawnPoints.setRect(gg_rct_WoodRect);
            thistype.monsterHolder = MonsterHolder.getObject();
        }

    }
}