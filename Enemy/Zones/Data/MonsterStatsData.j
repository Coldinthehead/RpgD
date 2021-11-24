library MonsterStatsDataLib
{
    public struct MonsterStatsData
    {
       static MonsterStatsTemplate templateList[20];
       static integer templateListLength = 20;

       public static method getTemplateForWoodZone(integer index)->MonsterStatsTemplate
       {
           return templateList[index];
       }

       static method onInit()
       {
           //lvl 2 spiders
           templateList[0] = MonsterStatsTemplate.getObject();

           templateList[0].minLevel = 0;
           templateList[0].level = 2;
           templateList[0].packSize = 3;

           templateList[0].health = 70;
           templateList[0].attackDamage = 4;
           templateList[0].armour = 0;
           templateList[0].attackSpeed =0;

           templateList[0].scale = 0.5;

           templateList[0].addUnitId('n000');
           templateList[0].addUnitId('n001');
           templateList[0].addUnitId('n002');
           templateList[0].addUnitId('n003');

            //4 lvl wolves
           templateList[1] = MonsterStatsTemplate.getObject();

           templateList[1].minLevel = 3;
           templateList[1].level = 4;
           templateList[1].packSize = 3;

           templateList[1].health = 150;
           templateList[1].attackDamage = 6;
           templateList[1].armour = 0;
           templateList[1].attackSpeed = 0;

           templateList[1].scale = 0.8;

           templateList[1].addUnitId('n004');
           templateList[1].addUnitId('n005');
           templateList[1].addUnitId('n006');
           templateList[1].addUnitId('n007');

       }

    }


    public struct MonsterStatsTemplate
    {
        real health;
        real attackDamage;
        real armour;
        real attackSpeed;
        integer level;
        integer minLevel;
        integer packSize;

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