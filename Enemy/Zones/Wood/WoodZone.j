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


        public static method onRectEnterTownToWood()
        {
            if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
            {
                thistype.onPlayerEnter(GetTriggerUnit());
                SetUnitX(GetTriggerUnit(),-2500);
                SetUnitY(GetTriggerUnit(),14977);
                IssueImmediateOrder( GetTriggerUnit(), "stop" );
            }
          
        }

        public static method onRectEnterWoodToTown()
        {
            if(IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true)
            {
                thistype.onPlayerExit(GetTriggerUnit());
                SetUnitX(GetTriggerUnit(),10527);
                SetUnitY(GetTriggerUnit(),5100);
                IssueImmediateOrder( GetTriggerUnit(), "stop" );
            }
           
        }

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
                if(thistype.checkCanBeCleared())
                {
                  thistype.clearLocation();

                }
                
            }
        }

        private static method checkCanBeCleared()->boolean
        {
            return monsterHolder.canBeCleared();
        }

        public static method spawnMonsters()
        {
            MonsterCreator.createMonstersInWoodZone(monsterHolder,spawnPoints);
            isActive = true;
        }

        public static method onEnemyDies(unit u)
        {
            thistype.monsterHolder.onMonsterDie(GetHandleId(u));
        }

        public static method clearLocation()
        {
            if(isActive == false)
            {
                return;
            }
            monsterHolder.clearData();
            isActive = false;
        }

        public static method initialize()
        {
            thistype.isActive = false;
            thistype.spawnPoints = SpawnPosition.getObject();
            thistype.spawnPoints.setRect(gg_rct_WoodRect);
            thistype.monsterHolder = MonsterHolder.getObject();
        }

        static method onInit()
        {
            trigger townToWood = CreateTrigger();
            trigger woodToTown = CreateTrigger();

            TriggerRegisterEnterRectSimple( townToWood, gg_rct_TownToWood );
            TriggerAddAction( townToWood, function thistype.onRectEnterTownToWood);

            TriggerRegisterEnterRectSimple(  woodToTown , gg_rct_WoodToTown);
            TriggerAddAction( woodToTown, function thistype.onRectEnterWoodToTown);
        }

    }
}