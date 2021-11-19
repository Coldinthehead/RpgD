library WoodMonsterDataLib
{
    public struct WoodMonsterData
    {
        integer ids[1];
        integer length = 0;

        public method getSingleMonsterTemplate(integer level)->MonsterData
        {
            MonsterData template = MonsterTemplate.data[ids[GetRandomInt(0,length-1)]];
            while(template.level > level)
            {
                template = MonsterTemplate.data[ids[GetRandomInt(0,length-1)]];
            }
            BJDebugMsg(I2S(template.level) + " Level chosen");
            return template;
        }

        public method addTemplateById(integer id)
        {
            this.ids[length] = id;
            length+=1;
        }

        public static method getObject()->thistype
        {
            thistype result = thistype.create();
            result.length = 0; 
            return result;
        }
    }
}