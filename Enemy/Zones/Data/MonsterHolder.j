library MonsterHolderLib
{
    public struct MonsterHolder
    {
        SpawnedMonsterData monsters[150];
        integer length;

        public method addMonster(unit actor)
        {
            monsters[length] = SpawnedMonsterData.getObject(actor,GetHandleId(actor));
            length +=1;
        }

        public method clearData()
        {
            integer i;
            for(i = 0; i < length;i+=1)
            {
                monsters[i].destroy();
            }
            length = 0;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            return result;
        }
    }

    public struct SpawnedMonsterData
    {
        unit actor;
        integer hashcode;

        method onDestroy()
        {
            RemoveUnit(this.actor);
            actor = null;
            hashcode = 0;
        }

        public static method getObject(unit actor, integer hashcode)->thistype
        {
            thistype result = thistype.create();
            result.actor = actor;
            result.hashcode = hashcode;
            return result;
        }
    }
}