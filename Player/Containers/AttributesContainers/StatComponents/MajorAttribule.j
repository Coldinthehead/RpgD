library MajorAttributeLib
{
    public struct MajorAttribute
    {
        BaseAttribute numericValue;
        PassiveAbilityStat abilityValue;
        IMajorModifier modifiers[6];
        integer modifiersLength =0;

        public method addValue(real amount)
        {
            modifyFromMajor(-numericValue.getValue());
            numericValue.addValue(amount);
            abilityValue.overrideAbility(R2I(numericValue.getValue()));   
            modifyFromMajor(numericValue.getValue());
        }

        public method addMofidier(IMajorModifier modifier)
        {
            modifiers[modifiersLength] = modifier;
            modifiers[modifiersLength].modifyValue(numericValue.getValue());
            modifiersLength+=1;      
        }
        
        private method modifyFromMajor(real amount)
        {
            integer i;
            for(i = 0; i < modifiersLength;i+=1)
            {
                modifiers[i].modifyValue(amount);
            }
        }

        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.numericValue = BaseAttribute.getObject();
            result.abilityValue = PassiveAbilityStat.getObject(pid);
            result.modifiersLength = 0;
            return result;
        }
    }
}