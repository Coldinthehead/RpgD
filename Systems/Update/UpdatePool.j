library UpdatePoolLib
{
    public struct UpdatePool
    {
        static IUpdateable list[200];
        static integer CACHE_SIZE = 200;
        static timer updateTimer;
        static real deltaTime;
        static integer iteratorIndex;
        static boolean isCycling;

        public static method Update()
        {
            integer i;
            integer used = 0;
            for(i = 0; i < CACHE_SIZE;i+=1)
            {
                if(list[i].isUsing() == true)
                {
                    list[i].update(deltaTime);
                    used +=1;
                }
            }
            //BJDebugMsg(I2S(i));
            if(used == 0)
            {
                pauseTimer();
            }
        }

        public static method poolObject(IUpdateable updateable)
        {
            if(thistype.iteratorIndex >= CACHE_SIZE)
            {
                iteratorIndex = 0;
            }
            list[thistype.iteratorIndex] = updateable;
            thistype.iteratorIndex +=1;
            if(isCycling == false)
            {
                StartTimer();
            }
        }

        static method StartTimer()
        {
            TimerStart(updateTimer,deltaTime,true,function thistype.Update);
            isCycling = true;
        }

        static method pauseTimer()
        {
            PauseTimer(thistype.updateTimer);
            isCycling = false;
        }

        static method onInit()
        {
            thistype.updateTimer = CreateTimer();
            thistype.deltaTime = 0.04;
            thistype.iteratorIndex = 0;
            StartTimer();          
        }

        
    }

    public interface IUpdateable
    {
        method isUsing()->boolean;
        method update(real deltaTime);
    }
}