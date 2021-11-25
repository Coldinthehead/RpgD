library MonsterCreatorLib requires SetUnitMaxState
{
    public struct MonsterCreator
    {
        public static method createMonstersInWoodZone(SpawnPosition points,MonsterHolder holder,MonsterStatsTemplate template)
        {
            integer i;
            for( i = 0; i < points.length; i+=1)
            {
                thistype.createMonsterPack(points.x[i], points.y[i],holder,template);
               // BJDebugMsg("holder length : " + I2S(holder.length));
            }
        }


        public static method createMonsterPack(real x, real y,
                                                MonsterHolder holder, MonsterStatsTemplate template )
        {
            integer rand = GetRandomInt(0,100);
            integer i;
            if(rand <= 50)
            {
                for(i = 0; i < 3;i+=1)
                {
                    holder.addMonster(thistype.createNormalEnemy(x,y,template));
                }

            }
            else if ( rand >= 51 && rand <= 75)
            {
                for(i = 0 ; i< 3;i+=1)
                {
                    holder.addMonster(thistype.CreateMagicEnemy(x,y,template));
                }
            }
            else
            {
                for(i = 0; i < 2;i+=1)
                {
                    holder.addMonster(thistype.createNormalEnemy(x,y,template));
                }
                holder.addMonster(thistype.CreateRareEnemy(x,y,template));
            }
        }

        public static method createNormalEnemy(real x, real y, MonsterStatsTemplate template)->unit
        {
            unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
            SetUnitScale(u, template.scale , template.scale , template.scale);
            setMonsterHealth(u,template.health);
            setMonsterDamage(u,template.attackDamage);
            setMonsterArmour(u,template.armour);
           // BJDebugMsg("Unit id : " + I2S(GetHandleId(u)));
            return u;
        }

        private static  method CreateMagicEnemy(real x, real y, MonsterStatsTemplate template)->unit
        {
            unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
            real  magicMonsterMultiplier = 1.25;
            SetUnitScale(u, template.scale * magicMonsterMultiplier  ,
                             template.scale * magicMonsterMultiplier  , 
                                template.scale * magicMonsterMultiplier );
            setMonsterHealth(u,template.health * magicMonsterMultiplier );
            setMonsterDamage(u,template.attackDamage * magicMonsterMultiplier );
            setMonsterArmour(u,template.armour * magicMonsterMultiplier );
           // BJDebugMsg("Unit id : " + I2S(GetHandleId(u)));
            return u;
        }

        private static  method CreateRareEnemy(real x, real y, MonsterStatsTemplate template)->unit
        {
             unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
             real rareMonsterMultiplier = 2.0;
            SetUnitScale(u, template.scale * rareMonsterMultiplier , 
                            template.scale * rareMonsterMultiplier , 
                            template.scale * rareMonsterMultiplier);
            setMonsterHealth(u,template.health * rareMonsterMultiplier );
            setMonsterDamage(u,template.attackDamage * rareMonsterMultiplier );
            setMonsterArmour(u,template.armour * rareMonsterMultiplier );
           // BJDebugMsg("Unit id : " + I2S(GetHandleId(u)));
            return u;
        }


        private static method setMonsterHealth(unit u , real amount)
        {
            SetUnitMaxState(u,UNIT_STATE_MAX_LIFE,amount);
        }

        private static method setMonsterDamage(unit u, real amount)
        {
            PassiveAbilityStat stat = PassiveAbilityStat.getObject(11);
            stat.setAttackCodes();
            stat.overrideMonsterAbility(u,R2I(amount));
            stat.destroy();
        }

        private static method setMonsterArmour(unit u , real amount)
        {
            PassiveAbilityStat stat = PassiveAbilityStat.getObject(11);
            stat.setArmourCodes();
            stat.overrideMonsterAbility(u,R2I(amount));
            stat.destroy();
        }
    }
}