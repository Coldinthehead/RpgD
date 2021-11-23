library MonsterHolderLib
{
    public struct MonsterHolder
    {
        SpawnedMonsterData monsters[150];
        integer length;
        integer died;

        public method addMonster(unit actor)
        {
            monsters[length] = SpawnedMonsterData.getObject(actor,GetHandleId(actor));
            length +=1;
        }

        public method onMonsterDie(integer hashcode)
        {
            integer index = this.contains(hashcode);
            if(index != -1)
            {
                died +=1;
                BJDebugMsg("died :  " + I2S(died) + " / " + I2S(length));
                if(this.canBeCleared())
                {
                    BJDebugMsg("location can be reused");
                }
            }
        }

        private method contains(integer hashcode)->integer
        {
            integer i;
            for(i  = 0 ; i < length ; i+=1)
            {
                if(monsters[i].hashcode == hashcode)
                {
                    return i;
                }
            }
            return -1;
        }

        public method clearData()
        {
            integer i;
            for(i = 0; i < length;i+=1)
            {
                monsters[i].destroy();
            }
            length = 0;
            died = 0;
        }

        public method canBeCleared()->boolean
        {
            return (length / 2 ) <= died;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            result.died = 0;
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