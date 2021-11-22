library MonsterStatsDataLib
{
    public struct MonsterStatsData
    {
       static MonsterStatsTemplate statsData[20];
       static MonsterActorTemplate actorData[20];


       static method onInit()
       {
            statsData[0] = MonsterStatsTemplate.getObject();

            statsData[0].level = 1;
            statsData[0].health = 70;
            statsData[0].attackDamage = 4;
            statsData[0].armour = 1;
            statsData[0].attackSpeed = 0;

            statsData[1] = MonsterStatsTemplate.getObject();

            statsData[1].level = 2;
            statsData[1].health = 110;
            statsData[1].attackDamage = 6;
            statsData[1].armour = 1;
            statsData[1].attackSpeed = 0;

            statsData[2] = MonsterStatsTemplate.getObject();

            statsData[2].level = 3;
            statsData[2].health = 180;
            statsData[2].attackDamage = 9;
            statsData[2].armour = 1;
            statsData[2].attackSpeed = 0;

            statsData[3] = MonsterStatsTemplate.getObject();

            statsData[3].level = 4;
            statsData[3].health = 245;
            statsData[3].attackDamage = 14;
            statsData[3].armour = 1;
            statsData[3].attackSpeed = 0;

            statsData[4] = MonsterStatsTemplate.getObject();

            statsData[4].level = 5;
            statsData[4].health = 360;
            statsData[4].attackDamage = 21;
            statsData[4].armour = 2;
            statsData[4].attackSpeed = 0;

       }
    }


    public struct MonsterStatsTemplate
    {
        real health;
        real attackDamage;
        real armour;
        real attackSpeed;
        integer level;

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            return result;
        }
    }

    public struct MonsterActorTemplate
    {
        integer unitId[5];
        integer length;
        real scale;

        public method getUnitId()->integer
        {
            return unitId[GetRandomInt(0,length-1)];
        }

        public method addUnitId(integer rawCode)
        {
            unitId[length] = rawCode;
            length+=1;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            return result;
        }
    }
}