library BaseAtrributeLib
{
    public struct BaseAttribute
    {
        real value;
        real multiplier;
        real totalValue;

        public method addValue(real amount)
        {
            value +=amount;
            setTotalValue();
            
        }

        public method addMultiplier(real amount)
        {
            multiplier += amount;
            setTotalValue();
        }
        
        private method setTotalValue() {this.totalValue = value *multiplier;}

        public method getValue()->real {return totalValue;}

        public method getMultiplier()->real {return multiplier;}

        public static method getObject()->thistype 
        {
            thistype result = thistype.create();
            result.value = 0;
            result.multiplier = 1;
            result.totalValue = 0;
            return result;
        }
    }
}