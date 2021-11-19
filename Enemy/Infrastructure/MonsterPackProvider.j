library MonsterProviderLib requires SetUnitMaxState
{
    public struct MonsterPackProvider
    {
        public static method createPack(real x, real y,MonsterData template, group g)
        {
            integer rand = GetRandomInt(0,100);
            integer i;
            integer packSize = template.getPackSize();
            if(rand <= 50)
            {
                for(i = 0 ; i < packSize ; i+=1)
                {
                   GroupAddUnit(g, CreateNormalEnemy(x,y,template) ) ;
                }
            }
            else if(rand >= 51 && rand <= 75)
            {
                for(i = 0 ; i < 3 ; i +=1)
                {
                   GroupAddUnit(g  , CreateMagicEnemy(x,y,template) );
                }
            }
            else 
            {
                for(i = 0 ; i < packSize / 2 ; i+=1)
                {
                    GroupAddUnit(g, CreateNormalEnemy(x,y,template) );
                }
                GroupAddUnit( g, CreateRareEnemy(x,y,template) );
            }
           
        }

        private static method CreateNormalEnemy(real x, real y, MonsterData template)->unit
        {
            unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
            SetUnitScale(u, template.scale , template.scale , template.scale);
            setMonsterHealth(u,template.health);
            setMonsterDamage(u,template.damage);
            setMonsterArmour(u,template.armour);
            return u;
        }

        private static  method CreateMagicEnemy(real x, real y, MonsterData template)->unit
        {
            unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
            real  magicMonsterMultiplier = 1.25;
            SetUnitScale(u, template.scale * magicMonsterMultiplier  ,
                             template.scale * magicMonsterMultiplier  , 
                                template.scale * magicMonsterMultiplier );
            setMonsterHealth(u,template.health * magicMonsterMultiplier );
            setMonsterDamage(u,template.damage * magicMonsterMultiplier );
            setMonsterArmour(u,template.armour * magicMonsterMultiplier );
            return u;
        }

        private static  method CreateRareEnemy(real x, real y, MonsterData template)->unit
        {
             unit u = CreateUnit(Player(11),  template.getUnitId() ,x,y,GetRandomReal(-180,180));
             real rareMonsterMultiplier = 2.0;
            SetUnitScale(u, template.scale * rareMonsterMultiplier , 
                            template.scale * rareMonsterMultiplier , 
                            template.scale * rareMonsterMultiplier);
            setMonsterHealth(u,template.health * rareMonsterMultiplier );
            setMonsterDamage(u,template.damage * rareMonsterMultiplier );
            setMonsterArmour(u,template.armour * rareMonsterMultiplier );
            return u;

        }

        private static method setMonsterHealth(unit u,real amount)
        {
            SetUnitMaxState(u,UNIT_STATE_MAX_LIFE,amount);
        }

        private static method setMonsterDamage(unit u,real amount)
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