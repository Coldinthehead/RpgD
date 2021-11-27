library ButtonsDataLib
{
    public struct ButtonDetails
    {
        static ButtonData buttonsList[20];
        static integer length;


        public static method onButtonDown(integer pid,integer rawCode)
        {
            integer index = thistype.getButtonIndexByRawCode(rawCode);
            //BJDebugMsg("on button down");
            //BJDebugMsg(I2S(index));
            if(index != -1)
            {
                thistype.buttonsList[index].action.run(pid);
            } 
        }

        private static method getButtonIndexByRawCode(integer rawCode)->integer
        {
            integer i;
            for(i = 0; i < thistype.length; i+=1)
            {
                //BJDebugMsg(I2S(thistype.buttonsList[i].rawCode));
                if(thistype.buttonsList[i].rawCode == rawCode)
                {
                    return i;
                }
            }
            return -1;
        }

        static method onInit()
        {
            thistype.length = 20;
            buttonsList[0] = ButtonData.getObject('A02G',WarriorContent.getObject());
            buttonsList[1] = ButtonData.getObject('A02I',BackToMainPage.getObject());
        }
    }

    public struct BackToMainPage extends IButtonAction
    {
        public method run(integer pid)
        {
            TalentInteface.currentPage[pid].clear();
            TalentInteface.mainPage.setContent(pid);
        }

        public static method getObject()->thistype
        {
            return thistype.create();
        }
    }

    public struct WarriorContent extends IButtonAction
    {
        public method run(integer pid)
        {
           // BJDebugMsg("Hello world + " + I2S(pid));
            TalentInteface.currentPage[pid].clear();
            TalentInteface.warriorPageData[0].setContent(pid);
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            return result;
        }
    }

    public struct ButtonData 
    {
        integer rawCode;
        IButtonAction action;

        public static method getObject(integer rawCode, IButtonAction action)->thistype
        {
            thistype result = thistype.create();
            result.rawCode = rawCode;
            result.action = action;
            return result;
        }

    }

    public interface IButtonAction
    {
        public method run(integer pid);
    }
}