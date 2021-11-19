library MonsterTemplateLib
{
    public struct MonsterTemplate
    {
        static MonsterData data[20];


        static method onInit()
        {
            //spiders
            data[0] = MonsterData.getObject();

            data[0].health = 120.;
            data[0].damage = 8.;
            data[0].armour = 1;
            data[0].level = 1;

            data[0].scale = 0.5;

            data[0].minPackSize = 3;
            data[0].maxPackSize = 5;
            
            data[0].addUnitId('n000');
            data[0].addUnitId('n001');
            data[0].addUnitId('n002');
            data[0].addUnitId('n003');
        }
    }

    public struct MonsterData
    {
        integer unitIds[5];
        public real health;
        public real armour;
        public real damage;
        public real scale;
        public integer level;
        public integer minPackSize;
        public integer maxPackSize;
        integer idsSize =0;

        public method addUnitId(integer id)
        {
            unitIds[idsSize] = id;
            idsSize+=1;
        }

        public method getPackSize()->integer
        {
            return GetRandomInt(minPackSize,maxPackSize);
        }

        public method getUnitId()->integer
        {
            return unitIds[GetRandomInt(0,idsSize -1)];
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.idsSize =0;
            return result;
        }

    }
}