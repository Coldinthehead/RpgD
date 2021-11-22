library NumeriAttributeLib 
{
    public struct NumeriAttribute extends IMinorAttribute
    {
        integer pid;
        BaseAttribute numericValue;


        public method getValue()->real
        {
            return this.numericValue.getValue();
        }
        public method getMultiplier()->real
        {
            return this.numericValue.getMultiplier();
        }
        public method addValue(real value)
        {
            numericValue.addValue(value);
        }
        public method addMultiplier(real value)
        {
            numericValue.addMultiplier(value);
        }
        public static method getObject(integer pid)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            result.numericValue = BaseAttribute.getObject();
            return result;
        }
    }
}