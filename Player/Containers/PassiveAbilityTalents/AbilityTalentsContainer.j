library AbilityTalentsContainer
{
    public struct AbilityTalentsContainer
    {
        integer warriorLevel;
        
        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.warriorLevel = 0;
            return result;
        }
    }



}