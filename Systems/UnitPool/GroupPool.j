library GroupPoolLib
{
    public struct GroupPool
    {
        static group list[400];
        static integer CACHE_SIZE = 400;
        static integer iteratorIndex =0;

        public static method GetGroup()->group
        {
            iteratorIndex +=1;
            GroupClear(list[iteratorIndex]);
            return list[iteratorIndex];
        }

        static method onInit()
        {
            integer i;
            for(i = 0; i < CACHE_SIZE;i+=1)
            {
                list[i] = CreateGroup();
            }
        }
    }
}