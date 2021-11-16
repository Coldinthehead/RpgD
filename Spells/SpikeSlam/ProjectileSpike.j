library ProjectileSpikeLib
{
    public struct SpikeProjectile extends IUpdateable
    {
        private static integer unitId = 'h002';
        private static string mainEffect = "Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl";
        private static string mainAttach = "origin";
        private static string additionalEffect = "Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl";

        private static string blood = "Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodPeasant.mdl";
        private static string bloodAttach = "origin";

        boolean isAlive;
        integer pid, maxUnitCount,currentUnitCount;
        real scale,sizeOvetime,radius,lifetime,x,y,targetX,targetY,facing,delay,tick,tickTime;
        SpikeSlamAbility gameObject;
        group damaged,targets;
        unit actor;
        DummyUnit reusable;

        public method update(real deltaTime)
        {
            delay -= deltaTime;
            if(delay > 0)
            {
                return;
            }
            tick-=deltaTime;
            lifetime -= deltaTime;
            if(tick <= 0)
            {
                //BJDebugMsg("tick" + R2S(tick));
                createDummy();
                tick = tickTime;
            }
            
            if(lifetime <= 0 ||currentUnitCount >= maxUnitCount )
            {
               this.reuse();
            } 
        }

        private method createDummy()
        {         
            modifyRadius();
            setNextTarget();         
            createUnit();
            createVFX();
            damageUnits();
        }

        private method modifyRadius()
        {
            scale *= sizeOvetime;
            radius*= sizeOvetime;
        }
        

        private method setNextTarget()
        {
            // if(this.x + targetX >= 3200 || this.y +targetY >= 3000)
            // {
            //     return;
            // }
            this.x += targetX;
            this.y += targetY;
        }

        private method createUnit()
        {
            reusable = UnitPool.GetUnit();
            actor = reusable.actor; //CreateUnit(Player(pid), unitId,x,y,GetRandomReal(-180,180));
            SetUnitOwner(actor,Player(pid),false);
            SetUnitX(actor,x);
            SetUnitY(actor,y);
            SetUnitFacing(actor,GetRandomReal(-180,180)); 
            SetUnitScale(actor,scale,scale,scale);
            currentUnitCount +=1;
        }

        private method createVFX()
        {
            DestroyEffect(AddSpecialEffectTarget(mainEffect,actor,mainAttach));
        } 

        private method damageUnits()
        {
            unit u;
            GroupEnumUnitsInRange(this.targets,this.x,this.y,this.radius,null);
            u = FirstOfGroup(this.targets);
            
            while(u != null)
            {
                if(GetUnitState(u, UNIT_STATE_LIFE) > 0 
                        && IsPlayerEnemy(Player(pid), GetOwningPlayer(u))
                        && IsUnitInGroup(u,this.damaged) == false )
                {
                    GroupAddUnit(this.damaged,u); 
                    gameObject.onHit(u);
                    DestroyEffect(AddSpecialEffectTarget(mainEffect,u,mainAttach));
                    UnitDamageTarget(this.actor,u,25,false,false,null,null,WEAPON_TYPE_WHOKNOWS);
                   // DestroyEffect(AddSpecialEffectTarget(blood,u,bloodAttach));      
                    if(GetUnitState(u,UNIT_STATE_LIFE) <= 0)
                    {
                        gameObject.onKill(u);
                    }            
                }   
                GroupRemoveUnit(this.targets,u); 
                u= FirstOfGroup(this.targets);        
            }
            
            GroupClear(this.targets);
            u = null;   

            //UnitRemover.RecycleDummy(this.actor,2.3);
            UnitPool.reuseUnit(reusable);
            actor = null;
        }

        public method isUsing()->boolean
        {
            return isAlive;
        }

        public method modifyForMultistrike()
        {
            delay = 1;
        }

        public method reuse()
        {
            this.isAlive= false;   
            GroupClear(this.damaged);
            GroupClear(this.targets);
           // DestroyGroup(this.damaged);
           // DestroyGroup(this.targets);
            this.targets = null;
            this.damaged = null;
            this.gameObject = 0;
            UnitPool.reuse(this.actor);
            this.actor = null;
        }

        public method getTime()->real
        {
            return this.lifetime;
        }

        public method fireProjectile(real x, real y, real facing)
        {
            pid = gameObject.pid;
            maxUnitCount = gameObject.maxUnitCount;
            currentUnitCount =0;
            scale = gameObject.scale;
            sizeOvetime = gameObject.sizeOvetime;
            radius = gameObject.radius;
            lifetime = gameObject.lifetime;

            this.x = x;
            this.y = y;
            this.facing = facing;

            targetX = 55 * Cos(facing * bj_DEGTORAD);
            targetY = 55 * Sin(facing * bj_DEGTORAD);

            damaged = GroupPool.GetGroup(); // CreateGroup();
            targets = GroupPool.GetGroup(); // CreateGroup();
            isAlive = true;
            tickTime = 0.07;
            tick = 0;
            
        }

        public static method getObject(SpikeSlamAbility gameObject)->thistype
        {
            thistype result = thistype.create();
            result.gameObject = gameObject;
            result.delay = 0;
            return result;
        }
    }
}