library PowerUpItemsLib
{
    public struct PowerUpItemDetails
    {
        static PowerUpItemData dataList[3];
        static integer dataListLength = 3;
        
        public static method getPowerUpByRawCode(integer rawCode)->IPowerUpItem
        {
            integer i;
            for(i = 0 ; i < dataListLength;i+=1)
            {
                if(dataList[i].itemRawCode == rawCode)
                {
                    return dataList[i];
                }
            }
            return 0;
        }

        static method onInit()
        {
            dataList[0] = PowerUpItemData.getObject('I00C',HealthSphere.getObject());
            dataList[1] = PowerUpItemData.getObject('I00D',GoldCoin.getObject(10));
            dataList[2] = PowerUpItemData.getObject('I00B',ManaSphere.getObject());
        }
    }


    

    public struct PowerUpItemData
    {
        integer itemRawCode;
        IPowerUpItem consumableEffect;

        public static method getObject(integer itemRawCode , IPowerUpItem singleEffect)->thistype
        {
            thistype result = thistype.create();
            result.itemRawCode = itemRawCode;
            result.consumableEffect = singleEffect;
            return result;
        }
    }
}