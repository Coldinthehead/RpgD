library PassiveAttributesLib
{
    public struct BaseAttributeContainer
    {
        integer pid;
        BaseAttribute attackDamage;
        private PassiveAbilityStat attackDamageAbility;

        BaseAttribute armour;
        private PassiveAbilityStat armourAbility;

        BaseAttribute attackSpeed;
        private PassiveAbilityStat attackSpeedAbility;

        BaseAttribute str;
        private PassiveAbilityStat strAbility;

        BaseAttribute dex;
        private PassiveAbilityStat dexAbility;

        BaseAttribute intelligence;
        private PassiveAbilityStat intelligenceAbility;





        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;

            return result;
        }   
    }
}