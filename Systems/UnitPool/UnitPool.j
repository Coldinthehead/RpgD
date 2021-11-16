library UnitPool
{
    public struct UnitPool
    {
        static DummyUnit list[500];
        static integer CASHE_SIZE = 500;
        static integer recyclesCount =0;
        static integer iteratorIndex = 0;

        public static method GetUnit()->DummyUnit
        {
            iteratorIndex +=1;
            if(iteratorIndex >= CASHE_SIZE)
            {
                iteratorIndex = 0;
            }
            return list[iteratorIndex];
        }


        public static method reuseUnit(DummyUnit iter)
        {
            
        }

        public static method reuse(unit u)
        {
            SetUnitX(u,0);
            SetUnitY(u,0);
        }

        public static method onInit()
        {
            integer i;
            for(i = 0; i < CASHE_SIZE;i+=1)
            {
                list[i] = DummyUnit.getObject();
            }
           
        }
    }

    public struct DummyUnit
    {
        boolean isUsing;
        unit actor;
        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.actor = CreateUnit(Player(11), 'h002',0,0,GetRandomReal(-180,180));
            return result;
        }
    }
}