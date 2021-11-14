library SpikeAbilityBuilderLib
{
    public struct SpikeSlamBuilder extends IAbilityBuilder
    {
        public method build(integer pid, integer rawCode)->IActiveAbility
        {
            SpikeSlamAbility spike = SpikeSlamAbility.getObject(pid,rawCode);

            real sizeOvetime = 1;
            real scale = 0.8;
            integer maxUnitCount = 6; //6;
            real radius = 100;
            real lifetime =  0.6;

            spike.buildArea(sizeOvetime , scale ,  maxUnitCount, radius);
            spike.setLifeTime(lifetime);
            return spike;
        }

        

        public static method getObject()->thistype {return thistype.create();}
    }
}