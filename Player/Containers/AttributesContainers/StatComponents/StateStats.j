library StateStatlib requires SetUnitMaxState
{
    public struct StateStat extends IMinorAttribute
    {
        integer pid;
        real value;
        real multiplier;
        real totalValue;
        unitstate state;

        public method addValue(real amount)
        {
            this.value += amount;
            overrideState();
        }

        public method addMultiplier(real amount)
        {
            this.multiplier +=multiplier;
            overrideState();
        }

        public method getMultiplier()->real
        {
            return this.multiplier;
        }

        public method getValue()->real
        {
            return value * multiplier;
        }

        public method overrideState()
        {
            this.totalValue = value * multiplier;
            SetUnitMaxState(PlayerEntity.instances[pid].actor,this.state,this.totalValue);
        }

        public static method getObject(integer pid,unitstate state)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            result.value = 1;
            result.multiplier = 1;
            result.state = state;
            return result;
        }
        
    }
}