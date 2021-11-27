library TalentHolderLib
{
    public struct TalentInteface
    {
        static InterfacePage currentPage[11];

        static PageData mainPage;
        static PageData warriorPageData[60];


        static method onInit()
        {
            mainPage = PageData.getObject();
            mainPage.addButton('A02G');
            mainPage.addButton('A02H');

            currentPage[0] = InterfacePage.getObject(0);
            mainPage.setContent(0);

            warriorPageData[0] = PageData.getObject();
            warriorPageData[0].addButton('A02I');

            warriorPageData[0].addButton('A02J');
            warriorPageData[0].addButton('A02K');
            warriorPageData[0].addButton('A02M');

            // warriorPageData[1] = PageData.getObject();

            // warriorPageData[1].addButton('');
            // warriorPageData[1].addButton('');
            // warriorPageData[1].addButton('');

        }
    }

    public struct PageData extends IPageContent
    {
        integer buttonsIds[10];
        integer length = 0;

        public method setContent(integer pid)
        {
            integer i;
            TalentInteface.currentPage[pid].clear();
            for(i = 0; i < length ;i+=1)
            {
                TalentInteface.currentPage[pid].addButton(buttonsIds[i]);
            }
        }

        public method addButton(integer buttonRawCode)
        {
            buttonsIds[length] = buttonRawCode;
            length+=1;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            return result;
        }
    }

    public interface IPageContent
    {
        public method setContent(integer pid);
    }
}