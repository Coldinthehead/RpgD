library DropDataLib
{
    public struct DropRewardHolder
    {
        static DropList dropData[3];
        static integer dropDataLength = 3;
        
        public static method createDropFromUnit(unit u,integer killerPid)
        {
            integer data = getDropDataIndexFromLevel(GetUnitLevel(u));
           // BJDebugMsg("data index : " + I2S(data) + " (" + I2S(GetUnitLevel(u)));
            thistype.processDropFromIndex(data,killerPid,GetUnitX(u),GetUnitY(u));
        }

        private static method getDropDataIndexFromLevel(integer level)->integer
        {
            integer i;
            for(i = 0; i < dropDataLength;i+=1 )
            {
                // BJDebugMsg(I2S(dropData[i].minLevel) + " >= " + I2S(level));
                // BJDebugMsg(I2S(dropData[i].maxLevel) + " <= " + I2S(level));

                if(dropData[i].minLevel <= level && dropData[i].maxLevel >= level)
                {

                    return i;
                }
            }
            return -1;
        }

        private static method processDropFromIndex(integer index,integer pid,real x, real y)
        {
            integer itemId;
            itemId = thistype.dropData[index].calculateMiscDrop(pid);
            if(itemId != 0)
            {
                CreateItem(itemId,x,y);
            }
            itemId = thistype.dropData[index].calculateNormalDrop(pid);
            if(itemId != 0)
            {
                CreateItem(itemId,x,y);
            }
            itemId = thistype.dropData[index].calculateMagicDrop(pid);
            if(itemId != 0)
            {
                CreateItem(itemId,x,y);
            }
            itemId = thistype.dropData[index].calculateRareDrop(pid);
            if(itemId != 0)
            {
                CreateItem(itemId,x,y);
            }
            itemId = thistype.dropData[index].calculateUniqDrop(pid);
            if(itemId != 0)
            {
                CreateItem(itemId,x,y);
            }
        }

        public static method onInit()
        {
            dropData[0] = DropList.getObject(0,3);
            dropData[0].addItem('I00C',ITEM_DROP_TYPE.MISC);
            dropData[0].addItem('I00D',ITEM_DROP_TYPE.MISC);
            dropData[0].addItem('I00B',ITEM_DROP_TYPE.MISC);
            dropData[0].addItem('I001',ITEM_DROP_TYPE.NORMAL);
            dropData[0].addItem('I005',ITEM_DROP_TYPE.NORMAL);
            dropData[0].addItem('I008',ITEM_DROP_TYPE.NORMAL);
            

            dropData[1] = DropList.getObject(4,7);
            dropData[1].addItem('I00C',ITEM_DROP_TYPE.MISC);
            dropData[1].addItem('I00D',ITEM_DROP_TYPE.MISC);
            dropData[1].addItem('I00B',ITEM_DROP_TYPE.MISC);
            dropData[1].addItem('I006',ITEM_DROP_TYPE.NORMAL);
            dropData[1].addItem('I009',ITEM_DROP_TYPE.NORMAL);
            dropData[1].addItem('I002',ITEM_DROP_TYPE.NORMAL);
            

            dropData[2] = DropList.getObject(8,11);
            dropData[2].addItem('I00C',ITEM_DROP_TYPE.MISC);
            dropData[2].addItem('I00B',ITEM_DROP_TYPE.MISC);
            dropData[2].addItem('I00D',ITEM_DROP_TYPE.MISC);
            dropData[2].addItem('I007',ITEM_DROP_TYPE.NORMAL);
            dropData[2].addItem('I00A',ITEM_DROP_TYPE.NORMAL);
            dropData[2].addItem('I003',ITEM_DROP_TYPE.NORMAL);



        
        }
    }

    public struct DropList
    {
        DropCategory category[5];
        integer minLevel;
        integer maxLevel;

        public method addItem(integer itemId, integer itemType)
        {
            category[itemType].addItem(itemId);
        }

        public method calculateMiscDrop(integer pid)->integer
        {
           return calculateDrop(pid,ITEM_DROP_TYPE.MISC);
        }

        public method calculateNormalDrop(integer pid)->integer
        {
            return calculateDrop(pid,ITEM_DROP_TYPE.NORMAL);
        }

        public method calculateMagicDrop(integer pid)->integer
        {
            return calculateDrop(pid,ITEM_DROP_TYPE.MAGIC);
        }

        public method calculateRareDrop(integer pid)->integer
        {
            return calculateDrop(pid,ITEM_DROP_TYPE.RARE);
        }

        public method calculateUniqDrop(integer pid)->integer
        {
            return calculateDrop(pid,ITEM_DROP_TYPE.UNIQUE);
        }

        private method calculateDrop(integer pid, integer itemType)->integer
        {
            integer rand = GetRandomInt(0,1000);
            BJDebugMsg("rand : " + I2S(rand / 10) + " cat chance : " + I2S(category[itemType].categoryChance));
            if(rand / 10 <= category[itemType].categoryChance)
            {
                BJDebugMsg("CreaatingItem for category : " + I2S(itemType) );
                return category[itemType].getItem();
            }
            else
            {
                return 0;
            }
        }


        static method getObject(integer minLevel, integer maxLevel)->thistype
        {
            thistype result = thistype.create();
            result.minLevel = minLevel;
            result.maxLevel = maxLevel;
            result.category[0] = DropCategory.getObject(40);
            result.category[1] = DropCategory.getObject(35);
            result.category[2] = DropCategory.getObject(20);
            result.category[3] = DropCategory.getObject(5);
            result.category[4] = DropCategory.getObject(2);
            return result;
        }
    }


    public struct DropCategory
    {
        integer itemList[50];
        integer length;
        integer categoryChance;

        public method addItem(integer itemId)
        {
            itemList[length] = itemId;
            length +=1;
        }
        public method getItem()->integer
        {
            integer rand = GetRandomInt(0,length -1);
            BJDebugMsg("item rand : " + I2S(rand));
            return itemList[GetRandomInt(0,length-1)];
        }

        public static method getObject(integer chance)->thistype
        {
            thistype result = thistype.create();
            result.length = 0;
            result.categoryChance = chance;
            return result;
        }
    }

    public struct ITEM_DROP_TYPE
    {
        static integer MISC = 0;
        static integer NORMAL = 1;
        static integer MAGIC = 2;
        static integer RARE = 3;
        static integer UNIQUE = 4;
    }
}