// library SpikeAbilityLib
// {

//     public struct Spike
//     {
//         private static integer unitId = 'h002';
//         private static string mainEffect = "Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl";
//         private static string mainAttach = "origin";
//         private static string additionalEffect = "Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl";

//         private static string blood = "Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodPeasant.mdl";
//         private static string bloodAttach = "origin";

//         static Spike list[20];
//         static integer CACHE_SIZE = 20;
//         static timer updateTimer;
//         static real deltaTime;
//         static integer iteratorIndex;

//         boolean isUsing;
//         real lifetime;
//         real targetX;
//         real targetY;
//         real x,y;
//         real sizeOvetime;
//         real scale;
//         group targets;
//         group damaged;
//         real radius;

//         integer maxUnitCount;
//         integer currentUnitCount;

//         unit actor;

//         public static method Update()
//         {
//             integer i;
//             for(i = 0; i < CACHE_SIZE;i+=1)
//             {
//                 if(list[i].isUsing == true)
//                 {
//                     list[i].update(deltaTime);
//                 }
//             }
//         }

//         public static method poolObject(Spike spike)
//         {
//             if(thistype.iteratorIndex >= 20)
//             {
//                 iteratorIndex = 0;
//             }
//             list[thistype.iteratorIndex] = spike;
//             thistype.iteratorIndex +=1;
//         }

//         public method update(real deltaTime)
//         {
//             lifetime -= deltaTime;
            
//             createDummy();

//             if(lifetime <= 0 ||currentUnitCount >= maxUnitCount )
//             {
               
//                 this.reuse();
//             } 

//         }

//         private method createDummy()
//         {         
//             modifyRadius();
//             setNextTarget();         
//             createUnit();
//             createVFX();
//             damageUnits(actor);
//         }

//         private method modifyRadius()
//         {
//             scale *= sizeOvetime;
//             radius*= sizeOvetime;
//         }

//         private method setNextTarget()
//         {
//             this.x += targetX;
//             this.y += targetY;
//         }

//         private method createUnit()
//         {
//             actor = CreateUnit(Player(0), unitId,x,y,GetRandomReal(-180,180));
//             SetUnitScale(actor,scale,scale,scale);
//             currentUnitCount +=1;
//         }

//         private method createVFX()
//         {
//             DestroyEffect(AddSpecialEffectTarget(mainEffect,actor,mainAttach));
//             DestroyEffect(AddSpecialEffectTarget(additionalEffect,actor,mainAttach));
//         }   

//         private method reuse()
//         {
//                 this.isUsing = false;   
//                 GroupClear(this.damaged);
//                 GroupClear(this.targets);
//                 DestroyGroup(this.damaged);
//                 DestroyGroup(this.targets);
//                 this.targets = null;
//                 this.damaged = null;
//         }

//         private method damageUnits(unit damager)
//         {
//             unit u;
//             GroupEnumUnitsInRange(this.targets,this.x,this.y,this.radius,null);
//             u = FirstOfGroup(this.targets);
            
//             while(u != null)
//             {
//                 if(GetUnitState(u, UNIT_STATE_LIFE) > 0 
//                         && IsUnitInGroup(u,this.damaged) == false )
//                 {
//                     GroupAddUnit(this.damaged,u); 
//                     DestroyEffect(AddSpecialEffectTarget(mainEffect,u,mainAttach));
//                     UnitDamageTarget(damager,u,1,false,false,null,null,WEAPON_TYPE_WHOKNOWS);
//                     DestroyEffect(AddSpecialEffectTarget(blood,u,bloodAttach));                  
//                 }   
//                 GroupRemoveUnit(this.targets,u); 
//                 u= FirstOfGroup(this.targets);        
//             }
            
//             GroupClear(this.targets);
//             u = null;   

//             UnitRemover.RecycleDummy(damager,2.3);
//         }

//         public static method GetObject(real x, real y,real facing)->thistype
//         {
//             thistype result = thistype.create();
//             result.isUsing = true;           
//             result.buildTarget(facing);
//             result.buildPosition(x,y);
//             result.buildArea();

//             result.damaged = CreateGroup();
//             result.targets = CreateGroup();

//             result.lifetime = 0.25;
            
//             return result;
//         }

//         private method buildPosition(real x, real y)
//         {
//             this.x = x;
//             this.y = y;
//         }
//         private method buildTarget(real facing)
//         {
//             targetX = 55 * Cos(facing * bj_DEGTORAD);
//             targetY = 55 * Sin(facing * bj_DEGTORAD);
//         }

//         private method buildArea()
//         {
//             sizeOvetime = 1.2;
//             scale = 0.7;
//             maxUnitCount = 8;
//             currentUnitCount = 0;
//             radius = 60;
//         }
        

//         static method onInit()
//         {
//             thistype.updateTimer = CreateTimer();
//             thistype.deltaTime = 0.04;
//             thistype.iteratorIndex = 0;
//             TimerStart(updateTimer,deltaTime,true,function thistype.Update);
            
//         }

//     }

//     function onSpikeCast()
//     {
//         Spike spike = Spike.GetObject(GetUnitX(GetTriggerUnit()),GetUnitY(GetTriggerUnit()),GetUnitFacing(GetTriggerUnit()));
//         Spike.poolObject(spike);
//         BJDebugMsg("hello");
//     }

//     function onInit()
//     {
//         trigger t = CreateTrigger();
//         TriggerRegisterPlayerUnitEvent(t, Player(0), EVENT_PLAYER_UNIT_SPELL_EFFECT, null);
//         TriggerAddAction(t,function onSpikeCast);

//     }

// }