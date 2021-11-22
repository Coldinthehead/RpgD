library WoodZoneLib 
{
    public struct WoodZone
    {
        static boolean isInitialized = false;
        static boolean isActive = false;

        static SpawnPosition spawnPoints;
        static MonsterHolder monsterHolder;
        
        static integer playerCountInside = 0;


        public static method onPlayerEnter(unit actor)
        {

        }

        public static method onPlayerExit(unit actor)
        {

        }

        public method spawnMonsters()
        {

        }

        public method clearLocation()
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