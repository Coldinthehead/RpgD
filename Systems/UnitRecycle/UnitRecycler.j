library UnitGrabageLib
{


    public struct UnitRemover
    {
        private static integer CASHE_SIZE = 250;
        private static integer iter = 0;
        private static boolean isCycling;
        private static integer toRemove;
        static unit dummy[250];
        static real time[250];

        private static timer cycleTimer;
        


        public static method Update()
        {
            integer i;
            integer used = 0;
            for(i = 0; i < CASHE_SIZE;i+=1)
            {   
                if(thistype.time[i] > 0.)
                {
                    time[i] -= 0.49;  
                    if(thistype.time[i] <0.)
                    {
                        RemoveUnit(thistype.dummy[i]);
                        thistype.time[i] = -1;
                        thistype.dummy[i] = null;
                    }
                    

                }
                
                if(thistype.dummy[i] != null)
                {
                    used +=1;
                }
               
            }
            BJDebugMsg("used : " + I2S(used));
            if(used == 0)
            {
                pauseCycle();
            }
        }

        public static method RecycleDummy(unit u , real time)
        {
            if(iter >=CASHE_SIZE)
            {
                iter = 0;
            } 
            thistype.dummy[iter] = u;
            thistype.time[iter] = time;
            iter+=1;
            if(isCycling == false)
            {
                startCycle();
                
            }
        }

        public static method startCycle()
        {
            TimerStart(thistype.cycleTimer,0.5,true,function thistype.Update);
            isCycling = true;
        }

        public static method pauseCycle()
        {
            PauseTimer(thistype.cycleTimer);
            isCycling = false;
        }

        static method onInit()
        {
            cycleTimer = CreateTimer();
            isCycling = false;
            startCycle();
            toRemove = 0;
        }
    }
}