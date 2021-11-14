library SpikeActiveAbilityLib
{
    public struct SpikeSlamAbility extends IActiveAbility
    {
        integer pid,rawCode;
        real lifetime , sizeOvetime , scale , radius;
        integer maxUnitCount;
        boolean addProjectile;
        boolean multiStrike;
    
        public method invoke(real x, real y, real facing)
        {
            SpikeProjectile spike = SpikeProjectile.getObject(this);
            spike.fireProjectile(x,y,facing);
            UpdatePool.poolObject(spike);

            if(addProjectile)
            {
                spike = SpikeProjectile.getObject(this);
                spike.fireProjectile(x,y,facing -45);
                UpdatePool.poolObject(spike);

                spike = SpikeProjectile.getObject(this);
                spike.fireProjectile(x,y,facing +45);
                UpdatePool.poolObject(spike);
            }

            if(multiStrike)
            {
                spike = SpikeProjectile.getObject(this);
                spike.modifyForMultistrike();
                spike.fireProjectile(x,y,facing);
                UpdatePool.poolObject(spike);
                if(addProjectile)
                {
                    spike = SpikeProjectile.getObject(this);
                    spike.modifyForMultistrike();
                    spike.fireProjectile(x,y,facing -45);
                    UpdatePool.poolObject(spike);

                    spike = SpikeProjectile.getObject(this);
                    spike.modifyForMultistrike();
                    spike.fireProjectile(x,y,facing +45);
                    UpdatePool.poolObject(spike);
                }
            }
        }

        public method getRawCode()->integer{return this.rawCode;}

        public method buildArea(real sizeOvetime , real scale , integer maxUnitCount, real radius)
        {
            this.sizeOvetime = sizeOvetime;
            this.scale = scale;
            this.maxUnitCount = maxUnitCount;
            this.radius = radius;
        }

        public method modifyAreaOvertime()
        {
            sizeOvetime = 1.2;
        }
        public method modifyMaxUnitCount()
        {
            maxUnitCount = 9;
        }

        public method modifyProjectile(boolean flag)
        {
            addProjectile = flag;
        }

        public method modifyMultistrike(boolean flag)
        {
            multiStrike = flag;
        }

        public method setLifeTime(real time)
        {
            this.lifetime = time;
        }

        public method onHit(unit target)
        {
            BJDebugMsg("onHit");
        }

        public method onKill(unit target)
        {
            BJDebugMsg("onKill");
        }

        public static method getObject(integer pid, integer rawCode)->thistype
        {
            thistype result = thistype.create();
            result.pid = pid;
            result.rawCode = rawCode;
            return result;
        }
    }
}