package com.company.assembleegameclient.util
{
   import flash.filters.GlowFilter;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import com.company.util.TextureLibrary;
   import _0R_W_._0R_c;
   import com.company.util.PointUtil;
   import flash.filters.BitmapFilterQuality;
   import _C_._1O_I_;
   
   public class ConditionEffect
   {
      
      public static const NothingIndex:uint = 0;
      
      public static const DeadIndex:uint = 1;
      
      public static const QuietIndex:uint = 2;
      
      public static const WeakIndex:uint = 3;
      
      public static const SlowedIndex:uint = 4;
      
      public static const SickIndex:uint = 5;
      
      public static const DazedIndex:uint = 6;
      
      public static const StunnedIndex:uint = 7;
      
      public static const BlindIndex:uint = 8;
      
      public static const HallucinatingIndex:uint = 9;
      
      public static const DrunkIndex:uint = 10;
      
      public static const ConfusedIndex:uint = 11;
      
      public static const StunImmuneIndex:uint = 12;
      
      public static const InvisibleIndex:uint = 13;
      
      public static const ParalyzedIndex:uint = 14;
      
      public static const SpeedyIndex:uint = 15;
      
      public static const BleedingIndex:uint = 16;
      
      public static const ArmorBrokenImmuneIndex:uint = 17;
      
      public static const HealingIndex:uint = 18;
      
      public static const DamagingIndex:uint = 19;
      
      public static const BerserkIndex:uint = 20;
      
      public static const PausedIndex:uint = 21;
      
      public static const StasisIndex:uint = 22;
      
      public static const StasisImmuneIndex:uint = 23;
      
      public static const InvincibleIndex:uint = 24;
      
      public static const InvulnerableIndex:uint = 25;
      
      public static const ArmoredIndex:uint = 26;
      
      public static const ArmorBrokenIndex:uint = 27;
      
      public static const HexedIndex:uint = 28;
      
      public static const NinjaSpeedyIndex:uint = 29;
      
      public static const UnstableIndex:uint = 30;
      
      public static const DarknessIndex:uint = 31;
      
      public static const SlowedImmuneIndex:uint = 32;
      
      public static const DazedImmuneIndex:uint = 33;
      
      public static const ParalyzedImmuneIndex:uint = 34;
      
      public static const PetrifyIndex:uint = 35;
      
      public static const PetrifyImmuneIndex:uint = 36;
      
      public static const PetDisableIndex:uint = 37;
      
      public static const CurseIndex:uint = 38;
      
      public static const CurseImmuneIndex:uint = 39;
      
      public static const HPBoostIndex:uint = 40;
      
      public static const MPBoostIndex:uint = 41;
      
      public static const AttBoostIndex:uint = 42;
      
      public static const DefBoostIndex:uint = 43;
      
      public static const SpdBoostIndex:uint = 44;
      
      public static const DexBoostIndex:uint = 45;
      
      public static const VitBoostIndex:uint = 46;
      
      public static const WisBoostIndex:uint = 47;
      
      public static const HiddenIndex:uint = 48;
      
      public static const MutedIndex:uint = 49;
      
      public static const PartyVisionIndex:uint = 50;
      
      public static const XMasVisionIndex:uint = 51;
      
      public static const _1F_f:uint = 99;
      
      public static const Dead:uint = 1 << DeadIndex - 1;
      
      public static const Quiet:uint = 1 << QuietIndex - 1;
      
      public static const Weak:uint = 1 << WeakIndex - 1;
      
      public static const Slowed:uint = 1 << SlowedIndex - 1;
      
      public static const Sick:uint = 1 << SickIndex - 1;
      
      public static const Dazed:uint = 1 << DazedIndex - 1;
      
      public static const Stunned:uint = 1 << StunnedIndex - 1;
      
      public static const Blind:uint = 1 << BlindIndex - 1;
      
      public static const Hallucinating:uint = 1 << HallucinatingIndex - 1;
      
      public static const Drunk:uint = 1 << DrunkIndex - 1;
      
      public static const Confused:uint = 1 << ConfusedIndex - 1;
      
      public static const StunImmune:uint = 1 << StunImmuneIndex - 1;
      
      public static const Invisible:uint = 1 << InvisibleIndex - 1;
      
      public static const Paralyzed:uint = 1 << ParalyzedIndex - 1;
      
      public static const Speedy:uint = 1 << SpeedyIndex - 1;
      
      public static const Bleeding:uint = 1 << BleedingIndex - 1;
      
      public static const ArmorBrokenImmune:uint = 1 << ArmorBrokenImmuneIndex - 1;
      
      public static const Healing:uint = 1 << HealingIndex - 1;
      
      public static const Damaging:uint = 1 << DamagingIndex - 1;
      
      public static const Berserk:uint = 1 << BerserkIndex - 1;
      
      public static const Paused:uint = 1 << PausedIndex - 1;
      
      public static const Stasis:uint = 1 << StasisIndex - 1;
      
      public static const StasisImmune:uint = 1 << StasisImmuneIndex - 1;
      
      public static const Invincible:uint = 1 << InvincibleIndex - 1;
      
      public static const Invulnerable:uint = 1 << InvulnerableIndex - 1;
      
      public static const Armored:uint = 1 << ArmoredIndex - 1;
      
      public static const ArmorBroken:uint = 1 << ArmorBrokenIndex - 1;
      
      public static const Hexed:uint = 1 << HexedIndex - 1;
      
      public static const NinjaSpeedy:uint = 1 << NinjaSpeedyIndex - 1;
      
      public static const Unstable:uint = 1 << UnstableIndex - 1;
      
      public static const Darkness:uint = 1 << DarknessIndex - 1;
      
      public static const SlowedImmune:uint = 1 << SlowedImmuneIndex - SecondOrderOffset;
      
      public static const DazedImmune:uint = 1 << DazedImmuneIndex - SecondOrderOffset;
      
      public static const ParalyzedImmune:uint = 1 << ParalyzedImmuneIndex - SecondOrderOffset;
      
      public static const Petrify:uint = 1 << PetrifyIndex - SecondOrderOffset;
      
      public static const PetrifyImmune:uint = 1 << PetrifyImmuneIndex - SecondOrderOffset;
      
      public static const PetDisable:uint = 1 << PetDisableIndex - SecondOrderOffset;
      
      public static const Curse:uint = 1 << CurseIndex - SecondOrderOffset;
      
      public static const CurseImmune:uint = 1 << CurseImmuneIndex - SecondOrderOffset;
      
      public static const HPBoost:uint = 1 << HPBoostIndex - SecondOrderOffset;
      
      public static const MPBoost:uint = 1 << MPBoostIndex - SecondOrderOffset;
      
      public static const AttBoost:uint = 1 << AttBoostIndex - SecondOrderOffset;
      
      public static const DefBoost:uint = 1 << DefBoostIndex - SecondOrderOffset;
      
      public static const SpdBoost:uint = 1 << SpdBoostIndex - SecondOrderOffset;
      
      public static const DexBoost:uint = 1 << DexBoostIndex - SecondOrderOffset;
      
      public static const VitBoost:uint = 1 << VitBoostIndex - SecondOrderOffset;
      
      public static const WisBoost:uint = 1 << WisBoostIndex - SecondOrderOffset;
      
      public static const Hidden:uint = 1 << HiddenIndex - SecondOrderOffset;
      
      public static const Muted:uint = 1 << MutedIndex - SecondOrderOffset;
      
      public static const PartyVision:uint = 1 << PartyVisionIndex - SecondOrderOffset;
      
      public static const XMasVision:uint = 1 << XMasVisionIndex - SecondOrderOffset;
      
      public static const FilteredEffect:uint = Drunk | Blind | Paused;
      
      public static const IgnoreProjEffect:uint = Invincible | Stasis | Paused;
      
      public static const FirstOrder:uint = 0;
      
      public static const SecondOrder:uint = 1;
      
      public static const ThirdOrder:uint = 2;
      
      public static const SecondOrderOffset:uint = 32;
      
      private static const GLOW_FILTER:GlowFilter = new GlowFilter(0,0.3,6,6,2,BitmapFilterQuality.LOW,false,false);
      
      public static var effects_:Vector.<com.company.assembleegameclient.util.ConditionEffect> = new <com.company.assembleegameclient.util.ConditionEffect>[new com.company.assembleegameclient.util.ConditionEffect("Nothing",0,null,_1O_I_._0Y_k),new com.company.assembleegameclient.util.ConditionEffect("Dead",Dead,null,_1O_I_._rg),new com.company.assembleegameclient.util.ConditionEffect("Quiet",Quiet,[32],_1O_I_._D_K_),new com.company.assembleegameclient.util.ConditionEffect("Weak",Weak,[34,35,36,37],_1O_I_._1W___),new com.company.assembleegameclient.util.ConditionEffect("Slowed",Slowed,[1],_1O_I_._1J_f),new com.company.assembleegameclient.util.ConditionEffect("Sick",Sick,[39],_1O_I_._fh),new com.company.assembleegameclient.util.ConditionEffect("Dazed",Dazed,[44],_1O_I_._1T_o),new com.company.assembleegameclient.util.ConditionEffect("Stunned",Stunned,[45],_1O_I_._P_h),new com.company.assembleegameclient.util.ConditionEffect("Blind",Blind,[41],_1O_I_._0e7),new com.company.assembleegameclient.util.ConditionEffect("Hallucinating",Hallucinating,[42],_1O_I_._16K_),new com.company.assembleegameclient.util.ConditionEffect("Drunk",Drunk,[43],_1O_I_._02e),new com.company.assembleegameclient.util.ConditionEffect("Confused",Confused,[2],_1O_I_._1X_B_),new com.company.assembleegameclient.util.ConditionEffect("Stun Immune",StunImmune,null,_1O_I_._2S_),new com.company.assembleegameclient.util.ConditionEffect("Invisible",Invisible,null,_1O_I_._0F___),new com.company.assembleegameclient.util.ConditionEffect("Paralyzed",Paralyzed,[53,54],_1O_I_._1T_v),new com.company.assembleegameclient.util.ConditionEffect("Speedy",Speedy,[0],_1O_I_._N_q),new com.company.assembleegameclient.util.ConditionEffect("Bleeding",Bleeding,[46],_1O_I_._gg),new com.company.assembleegameclient.util.ConditionEffect("Armor Broken Immune",ArmorBrokenImmune,null,_1O_I_._g),new com.company.assembleegameclient.util.ConditionEffect("Healing",Healing,[47],_1O_I_._P_D_),new com.company.assembleegameclient.util.ConditionEffect("Damaging",Damaging,[49],_1O_I_._1K_8),new com.company.assembleegameclient.util.ConditionEffect("Berserk",Berserk,[50],_1O_I_._0Z_t),new com.company.assembleegameclient.util.ConditionEffect("Paused",Paused,null,_1O_I_._1q0),new com.company.assembleegameclient.util.ConditionEffect("Stasis",Stasis,null,_1O_I_._1cN_),new com.company.assembleegameclient.util.ConditionEffect("Stasis Immune",StasisImmune,null,_1O_I_._1P_O_),new com.company.assembleegameclient.util.ConditionEffect("Invincible",Invincible,null,_1O_I_._0E_u),new com.company.assembleegameclient.util.ConditionEffect("Invulnerable",Invulnerable,[17],_1O_I_._0V_Z_),new com.company.assembleegameclient.util.ConditionEffect("Armored",Armored,[16],_1O_I_._0M_),new com.company.assembleegameclient.util.ConditionEffect("Armor Broken",ArmorBroken,[55],_1O_I_._0W_t),new com.company.assembleegameclient.util.ConditionEffect("Hexed",Hexed,[42],_1O_I_._eZ_),new com.company.assembleegameclient.util.ConditionEffect("Ninja Speedy",NinjaSpeedy,[0],_1O_I_._0B_l),new com.company.assembleegameclient.util.ConditionEffect("Unstable",Unstable,[56],_1O_I_._eD_),new com.company.assembleegameclient.util.ConditionEffect("Darkness",Darkness,[57],_1O_I_._1__j),new com.company.assembleegameclient.util.ConditionEffect("Slowed Immune",SlowedImmune,null,_1O_I_._fq),new com.company.assembleegameclient.util.ConditionEffect("Dazed Immune",DazedImmune,null,_1O_I_._0m3),new com.company.assembleegameclient.util.ConditionEffect("Paralyzed Immune",ParalyzedImmune,null,_1O_I_._cq),new com.company.assembleegameclient.util.ConditionEffect("Petrify",Petrify,null,_1O_I_._1R_p),new com.company.assembleegameclient.util.ConditionEffect("Petrify Immune",PetrifyImmune,null,_1O_I_._y7),new com.company.assembleegameclient.util.ConditionEffect("Pet Disable",PetDisable,[27],_1O_I_._1cN_,true),new com.company.assembleegameclient.util.ConditionEffect("Curse",Curse,[58],_1O_I_._1T_S_),new com.company.assembleegameclient.util.ConditionEffect("Curse Immune",CurseImmune,null,_1O_I_._1T_Z_1),new com.company.assembleegameclient.util.ConditionEffect("HP Boost",HPBoost,[32],"HP Boost",true),new com.company.assembleegameclient.util.ConditionEffect("MP Boost",MPBoost,[33],"MP Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Att Boost",AttBoost,[34],"Att Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Def Boost",DefBoost,[35],"Def Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Spd Boost",SpdBoost,[36],"Spd Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Dex Boost",DexBoost,[37],"Dex Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Vit Boost",VitBoost,[38],"Vit Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Wis Boost",WisBoost,[39],"Wis Boost",true),new com.company.assembleegameclient.util.ConditionEffect("Hidden",Hidden,[27],"Hidden",true),new com.company.assembleegameclient.util.ConditionEffect("Muted",Muted,[21],"Muted",true),new com.company.assembleegameclient.util.ConditionEffect("Party Vision",PartyVision,null,true)];
      
      private static var _J_6:Object = null;
      
      private static var _lQ_:Object = null;
      
      private static var _1B_W_:Object = null;
      
      private static var _1__m:Object = null;
       
      
      public var name_:String;
      
      public var bit_:uint;
      
      public var iconOffsets_:Array;
      
      public var sbName_:String;
      
      public var icon16Bit_:Boolean;
      
      public function ConditionEffect(param1:String, param2:uint, param3:Array, param4:String = "", param5:Boolean = false)
      {
         super();
         this.name_ = param1;
         this.bit_ = param2;
         this.iconOffsets_ = param3;
         this.sbName_ = param4;
         this.icon16Bit_ = param5;
      }
      
      public static function GetCondEffectIndex(param1:String) : uint
      {
         var _loc2_:uint = 0;
         if(_J_6 == null)
         {
            _J_6 = new Object();
            _loc2_ = 0;
            while(_loc2_ < effects_.length)
            {
               _J_6[effects_[_loc2_].name_] = _loc2_;
               _loc2_++;
            }
         }
         return _J_6[param1];
      }
      
      public static function GetCondEffect(param1:String) : com.company.assembleegameclient.util.ConditionEffect
      {
         var _loc2_:com.company.assembleegameclient.util.ConditionEffect = null;
         for each(_loc2_ in effects_)
         {
            if(_loc2_.name_ == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function getConditionEffectIcons(param1:uint, param2:Vector.<BitmapData>, param3:int) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Vector.<BitmapData> = null;
         while(param1 != 0)
         {
            _loc4_ = param1 & param1 - 1;
            _loc5_ = param1 ^ _loc4_;
            _loc6_ = _1Y_1(_loc5_);
            if(_loc6_ != null)
            {
               param2.push(_loc6_[param3 % _loc6_.length]);
            }
            param1 = _loc4_;
         }
      }
      
      public static function getConditionEffectIcons2(param1:uint, param2:Vector.<BitmapData>, param3:int) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Vector.<BitmapData> = null;
         while(param1 != 0)
         {
            _loc4_ = param1 & param1 - 1;
            _loc5_ = param1 ^ _loc4_;
            _loc6_ = getIconsFromBit2(_loc5_);
            if(_loc6_ != null)
            {
               param2.push(_loc6_[param3 % _loc6_.length]);
            }
            param1 = _loc4_;
         }
      }
      
      public static function _mY_(param1:Vector.<BitmapData>, param2:int, param3:Boolean) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         var _loc6_:Matrix = null;
         if(_lQ_ == null)
         {
            _lQ_ = {};
         }
         if(_lQ_[param2])
         {
            _loc4_ = _lQ_[param2];
         }
         else
         {
            _loc5_ = new Matrix();
            _loc5_.translate(4,4);
            _loc6_ = new Matrix();
            _loc6_.translate(1.5,1.5);
            if(param3)
            {
               _loc4_ = new _1wr(18,18,true,0);
               _loc4_.draw(TextureLibrary.getBitmap("lofiInterfaceBig",param2),_loc6_);
            }
            else
            {
               _loc4_ = new _1wr(16,16,true,0);
               _loc4_.draw(TextureLibrary.getBitmap("lofiInterface2",param2),_loc5_);
            }
            _loc4_ = _0R_c._1iY_(_loc4_,4294967295);
            _loc4_.applyFilter(_loc4_,_loc4_.rect,PointUtil._17Q_,GLOW_FILTER);
            _lQ_[param2] = _loc4_;
         }
         param1.push(_loc4_);
      }
      
      private static function _1Y_1(param1:uint) : Vector.<BitmapData>
      {
         var _loc2_:Matrix = null;
         var _loc3_:uint = 0;
         var _loc4_:Vector.<BitmapData> = null;
         var _loc5_:int = 0;
         var _loc6_:BitmapData = null;
         if(_1B_W_ == null)
         {
            _1B_W_ = new Object();
            _loc2_ = new Matrix();
            _loc2_.translate(4,4);
            _loc3_ = 0;
            while(_loc3_ < 32)
            {
               _loc4_ = null;
               if(effects_[_loc3_].iconOffsets_ != null)
               {
                  _loc4_ = new Vector.<BitmapData>();
                  _loc5_ = 0;
                  while(_loc5_ < effects_[_loc3_].iconOffsets_.length)
                  {
                     _loc6_ = new _1wr(16,16,true,0);
                     _loc6_.draw(TextureLibrary.getBitmap("lofiInterface2",effects_[_loc3_].iconOffsets_[_loc5_]),_loc2_);
                     _loc6_ = _0R_c._1iY_(_loc6_,4294967295);
                     _loc6_.applyFilter(_loc6_,_loc6_.rect,PointUtil._17Q_,GLOW_FILTER);
                     _loc4_.push(_loc6_);
                     _loc5_++;
                  }
               }
               _1B_W_[effects_[_loc3_].bit_] = _loc4_;
               _loc3_++;
            }
         }
         return _1B_W_[param1];
      }
      
      private static function getIconsFromBit2(param1:uint) : Vector.<BitmapData>
      {
         var _loc2_:Vector.<BitmapData> = null;
         var _loc3_:BitmapData = null;
         var _loc4_:Matrix = null;
         var _loc5_:Matrix = null;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         if(_1__m == null)
         {
            _1__m = [];
            _loc2_ = new Vector.<BitmapData>();
            _loc4_ = new Matrix();
            _loc4_.translate(4,4);
            _loc5_ = new Matrix();
            _loc5_.translate(1.5,1.5);
            _loc6_ = 32;
            while(_loc6_ < effects_.length)
            {
               _loc2_ = null;
               if(effects_[_loc6_].iconOffsets_ != null)
               {
                  _loc2_ = new Vector.<BitmapData>();
                  _loc7_ = 0;
                  while(_loc7_ < effects_[_loc6_].iconOffsets_.length)
                  {
                     if(effects_[_loc6_].icon16Bit_)
                     {
                        _loc3_ = new _1wr(18,18,true,0);
                        _loc3_.draw(TextureLibrary.getBitmap("lofiInterfaceBig",effects_[_loc6_].iconOffsets_[_loc7_]),_loc5_);
                     }
                     else
                     {
                        _loc3_ = new _1wr(16,16,true,0);
                        _loc3_.draw(TextureLibrary.getBitmap("lofiInterface2",effects_[_loc6_].iconOffsets_[_loc7_]),_loc4_);
                     }
                     _loc3_ = _0R_c._1iY_(_loc3_,4294967295);
                     _loc3_.applyFilter(_loc3_,_loc3_.rect,PointUtil._17Q_,GLOW_FILTER);
                     _loc2_.push(_loc3_);
                     _loc7_++;
                  }
               }
               _1__m[effects_[_loc6_].bit_] = _loc2_;
               _loc6_++;
            }
         }
         if(_1__m[param1] != null)
         {
            return _1__m[param1];
         }
         return null;
      }
   }
}
