library InterfacePagelib
{
    public struct InterfacePage
    {
       unit actor;
       integer buttonList[10];
       integer length;

       public method addButton(integer rawCode)
       {
           UnitAddAbility(this.actor,rawCode);
           buttonList[length] = rawCode;
           length +=1;
       }

       public method clear()
       {
           integer i;
           for(i = 0; i < length;i +=1)
           {
               UnitRemoveAbility(this.actor,buttonList[i]);
               buttonList[i] = 0;
           }
           length = 0;
       }

       public static method getObject(integer pid)->thistype
       {
            thistype result = thistype.create();
            result.actor = CreateUnit(Player(pid),'h004',9950,5420,0);
            result.length = 0;
            return result;
       }
    }
}