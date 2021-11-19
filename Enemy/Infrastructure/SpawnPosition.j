library SpawnPositionLib
{
    public struct SpawnPosition
    {
        real x[50];
        real y[50];
        integer length;

        public method setRect(rect r)
        {
            real x;
            real y;
            group units = CreateGroup();
            unit n;
            integer i =0;
            GroupEnumUnitsInRect(units,r,null);
            n = FirstOfGroup(units);
            while(n != null)
            {
                x = GetUnitX(n);
                y = GetUnitY(n);
                this.x[i] = x;
                this.y[i] = y;
                i+=1;
                GroupRemoveUnit(units,n);
                RemoveUnit(n);
               // BJDebugMsg(R2S(this.x[i-1]) + "  " + R2S(this.y[i-1]));
                n = FirstOfGroup(units);
            }
            this.length = i;
            DestroyGroup(units);
            units = null;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            return result;
        }
    }
}