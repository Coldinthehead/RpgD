library InstanceZoneLib 
{
    public struct InstanceZone
    {
        boolean isActive;
        boolean canClear;

        rect rec;

        SpawnPosition spawnPoints;
        MonsterHolder monsterHolder;
        
        integer playerCountInside;

        integer minLevel;
        integer maxLevel;

        integer templateIndex;


        public method onPlayerEnter(unit actor)
        {
            playerCountInside+=1;
            //BJDebugMsg(I2S(playerCountInside) + " pcinside");
            if(isActive == false)
            {
                spawnMonsters();
                isActive = true;
            }
        }

        public method onPlayerExit(unit actor)
        {
            playerCountInside -= 1;
            //BJDebugMsg("OnPLayerExt;" + I2S(playerCountInside));
            if(playerCountInside == 0)
            {   
                //BJDebugMsg("playerConut =0");
                if(checkCanBeCleared())
                {
                    //BJDebugMsg("cleartingLocation");
                  clearLocation();
                }
                
            }
        }

        private method checkCanBeCleared()->boolean
        {
            return monsterHolder.canBeCleared();
        }

        public method spawnMonsters()
        {
            MonsterCreator.createMonstersInWoodZone(monsterHolder,spawnPoints,getTemplate());
        }

        public method onEnemyDies(unit u)
        {
           monsterHolder.onMonsterDie(GetHandleId(u));
        }

        public  method clearLocation()
        {
            if(isActive == false)
            {
                return;
            }
            monsterHolder.clearData();
            isActive = false;
        }

        public method setTemplateIndex(integer index)
        {
            templateIndex = index;
        }

        private method getTemplate()->MonsterStatsTemplate
        {
            return MonsterStatsData.templateList[templateIndex];
        }

        public method contains(unit u)->boolean
        {
            return RectContainsCoords(this.rec,GetUnitX(u),GetUnitY(u));
        }

        public static method getObject(rect r)->thistype
        {
            thistype result = thistype.create();
            result.isActive = false;
            result.canClear = false;
            result.playerCountInside = 0;
            result.spawnPoints = SpawnPosition.getObject();
            result.spawnPoints.setRect(r);
            result.monsterHolder = MonsterHolder.getObject();
            result.rec = r;
            return result;
        }
    }
}