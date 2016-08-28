package com.company.assembleegameclient.objects
{
   import flash.geom.Point;
   import flash.geom.Matrix;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.util.ConversionUtil;
   import _0x1.HealingEffect;
   import _0jo._0oc;
   import kabam.rotmg.assets.services._0pW_;
   import com.company.util.IntPoint;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.utils.getTimer;
   import _C_._1O_I_;
   import _05L_.ChatMessage;
   import com.company.assembleegameclient.parameters.Parameters;
   import _18._qP_;
   import _1xa._dU_;
   import _ll.SFX;
   import _0x1.LevelUpEffect;
   import _113._13g;
   import com.company.util.PointUtil;
   import com.company.assembleegameclient.util.ConditionEffect;
   import com.company.assembleegameclient.map.Square;
   import flash.display.BitmapData;
   import _1xa.SText;
   import _1xa._1eo;
   import _0H_6.GameContext;
   import _1gF_._0ke;
   import com.company.assembleegameclient.util.Star;
   import flash.display.IGraphicsData;
   import com.company.util.GraphicHelper;
   import com.company.util.MoreColorUtil;
   import _V_E_.HWAccelerate;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.util._18Q_;
   import flash.utils.Dictionary;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util._1eD_;
   import _0R_W_._0R_c;
   import _1pm.ActivateEffect;
   import _1pm._7o;
   import com.company.assembleegameclient.tutorial.doneAction;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.util.Trig;
   import com.company.assembleegameclient.util._1C_q;
   import _1pm._1Y_F_;
   import _S_b._1K_S_;
   import _ge._I_I_;
   import _wi.Injector;
   
   public class Player extends Character
   {
      
      public static const _16U_:int = 10000;
      
      private static const _0iH_:Vector.<Point> = new <Point>[new Point(0,0),new Point(1,0),new Point(0,1),new Point(1,1)];
      
      private static const _x8:Matrix = new Matrix(1,0,0,1,2,2);
      
      private static const _07C_:Matrix = new Matrix(1,0,0,1,20,1);
      
      private static const _0wY_:Number = 0.004;
      
      private static const _nB_:Number = 0.0096;
      
      private static const _lw:Number = 0.0015;
      
      private static const _N_7:Number = 0.008;
      
      private static const _1d9:Number = 0.5;
      
      private static const _1D_p:Number = 2;
      
      public static var isAdmin:Boolean = false;
      
      public static var rank:int = 0;
      
      public static var clownSkin:_Z_4;
      
      public static var playerXMasSkin:_Z_4;
      
      public static var adminXMasSkin:_Z_4;
       
      
      public var commune:com.company.assembleegameclient.objects.GameObject;
      
      public var savedLoc:Point;
      
      public var rank_:int;
      
      public var admin_:Boolean;
      
      public var xpBoostTime_:int;
      
      public var skin_:int;
      
      public var skin:_Z_4;
      
      public var isShooting:Boolean;
      
      public var accountId_:String = "";
      
      public var credits_:int = 0;
      
      public var tokens:int = 0;
      
      public var numStars_:int = 0;
      
      public var currentFame_:int = 0;
      
      public var nameChosen_:Boolean = false;
      
      public var fame_:int = 0;
      
      public var fameGoal_:int = -1;
      
      public var glowing_:int = -1;
      
      public var guildName_:String = null;
      
      public var guildRank_:int = -1;
      
      public var _0xU_:Boolean = false;
      
      public var breath_:int = -1;
      
      public var maxMp_:int = 200;
      
      public var mp_:Number = 0;
      
      public var expGoal_:int = 1000;
      
      public var exp_:int = 0;
      
      public var attack_:int = 0;
      
      public var speed_:int = 0;
      
      public var dexterity_:int = 0;
      
      public var vitality_:int = 0;
      
      public var wisdom_:int = 0;
      
      public var damageMin_:int = 0;
      
      public var damageMax_:int = 0;
      
      public var hpBonus_:int = 0;
      
      public var mpBonus_:int = 0;
      
      public var attackBonus_:int = 0;
      
      public var defenseBonus_:int = 0;
      
      public var speedBonus_:int = 0;
      
      public var vitalityBonus_:int = 0;
      
      public var wisdomBonus_:int = 0;
      
      public var dexterityBonus_:int = 0;
      
      public var damageMinBonus_:int = 0;
      
      public var damageMaxBonus_:int = 0;
      
      public var xpBoost_:int = 0;
      
      public var healthStackCount_:int = 0;
      
      public var magicStackCount_:int = 0;
      
      public var _15v:int = 0;
      
      public var _029:int = 0;
      
      public var _0fg:int = 0;
      
      public var _I_k:int = 0;
      
      public var _0A_h:int = 0;
      
      public var _00c:int = 0;
      
      public var _1S_q:int = 0;
      
      public var _z2:int = 0;
      
      public var hasBackpack_:Boolean = false;
      
      public var starred_:Boolean = false;
      
      public var ignored_:Boolean = false;
      
      public var distSqFromThisPlayer_:Number = 0;
      
      protected var _kP_:Number = 1;
      
      public var _K_1:int = 0;
      
      public var _0sw:int = 0;
      
      public var _Z_z:int = 0;
      
      public var dropRateTime_:int = 0;
      
      public var lootTierTime_:int = 0;
      
      protected var _0mE_:HealingEffect = null;
      
      protected var _O_D_:com.company.assembleegameclient.objects.Merchant = null;
      
      public var _08X_:Boolean = true;
      
      public var _sB_:String = "";
      
      public var _0vn:String = "";
      
      private var _V_8:_0oc;
      
      private var factory:_0pW_;
      
      private var _14W_:IntPoint;
      
      private var _Y_x:GraphicsSolidFill = null;
      
      private var _0nq:GraphicsPath = null;
      
      private var _9q:GraphicsSolidFill = null;
      
      private var _02x:GraphicsPath = null;
      
      public function Player(param1:XML)
      {
         this._14W_ = new IntPoint();
         var _loc2_:Injector = GameContext.getInjector();
         this._V_8 = _loc2_.getInstance(_0oc);
         this.factory = _loc2_.getInstance(_0pW_);
         super(param1);
         this._15v = int(param1.Attack.@max);
         this._029 = int(param1.Defense.@max);
         this._0fg = int(param1.Speed.@max);
         this._I_k = int(param1.Dexterity.@max);
         this._0A_h = int(param1.HpRegen.@max);
         this._00c = int(param1.MpRegen.@max);
         this._1S_q = int(param1.MaxHitPoints.@max);
         this._z2 = int(param1.MaxMagicPoints.@max);
         _1zo = new Dictionary();
      }
      
      public static function _3o(param1:String, param2:XML) : Player
      {
         var _loc3_:int = int(param2.ObjectType);
         var _loc4_:XML = ObjectLibrary.XmlData[_loc3_];
         var _loc5_:Player = new Player(_loc4_);
         _loc5_.name_ = param1;
         _loc5_.level_ = int(param2.Level);
         _loc5_.exp_ = int(param2.Exp);
         _loc5_.inventory_ = ConversionUtil._1b5(param2.Equipment);
         _loc5_.maxHp_ = int(param2.MaxHitPoints);
         _loc5_.hp_ = int(param2.HitPoints);
         _loc5_.maxMp_ = int(param2.MaxMagicPoints);
         _loc5_.mp_ = int(param2.MagicPoints);
         _loc5_.attack_ = int(param2.Attack);
         _loc5_.defense_ = int(param2.Defense);
         _loc5_.speed_ = int(param2.Speed);
         _loc5_.dexterity_ = int(param2.Dexterity);
         _loc5_.vitality_ = int(param2.HpRegen);
         _loc5_.wisdom_ = int(param2.MpRegen);
         _loc5_.tex1Id_ = int(param2.Tex1);
         _loc5_.tex2Id_ = int(param2.Tex2);
         return _loc5_;
      }
      
      public function _0D_B_(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc4_:com.company.assembleegameclient.objects.GameObject = this.commune != null && !(this.commune is Player)?this.commune:this;
         if(_loc4_.movDir == null)
         {
            _loc4_.movDir = new Point();
         }
         _loc4_.rotateDir = param1;
         _loc4_.movDir.x = param2;
         _loc4_.movDir.y = param3;
         if(isConfused())
         {
            _loc5_ = _loc4_.movDir.x;
            _loc4_.movDir.x = -_loc4_.movDir.y;
            _loc4_.movDir.y = -_loc5_;
            _loc4_.rotateDir = -_loc4_.rotateDir;
         }
      }
      
      public function setCredits(param1:int) : void
      {
         this.credits_ = param1;
      }
      
      public function setTokens(param1:int) : void
      {
         this.tokens = param1;
      }
      
      public function setGuild(param1:String) : void
      {
         var _loc2_:com.company.assembleegameclient.objects.GameObject = null;
         var _loc3_:Player = null;
         var _loc4_:Boolean = false;
         this.guildName_ = param1;
         var _loc5_:Player = map_.player_;
         if(_loc5_ == this)
         {
            for each(_loc2_ in map_.goDict_)
            {
               _loc3_ = _loc2_ as Player;
               if(_loc3_ != null && _loc3_ != this)
               {
                  _loc3_.setGuild(_loc3_.guildName_);
               }
            }
         }
         else
         {
            _loc4_ = _loc5_ != null && _loc5_.guildName_ != null && _loc5_.guildName_ != "" && _loc5_.guildName_ == this.guildName_;
            if(_loc4_ != this._0xU_)
            {
               this._0xU_ = _loc4_;
               _11b = null;
            }
         }
      }
      
      public function _D_a(param1:Player) : Boolean
      {
         return !(param1.isPaused() || param1.isInvisible());
      }
      
      public function _0oX_() : int
      {
         var _loc1_:int = getTimer();
         return Math.max(0,this._Z_z - _loc1_);
      }
      
      public function teleport(param1:Player) : Boolean
      {
         if(isPaused())
         {
            this._V_8.dispatch(this._1wZ_(_1O_I_._F_4));
            return false;
         }
         var _loc2_:int = this._0oX_();
         if(_loc2_ > 0)
         {
            this._V_8.dispatch(this._1wZ_(_1O_I_._Y_q,{"seconds":int(_loc2_ / 1000 + 1)}));
            return false;
         }
         if(!this._D_a(param1))
         {
            if(param1.isInvisible())
            {
               this._V_8.dispatch(this._1wZ_(_1O_I_._0oe,{"player":param1.name_}));
            }
            else
            {
               this._V_8.dispatch(this._1wZ_(_1O_I_._G_6,{"player":param1.name_}));
            }
            return false;
         }
         map_.gs_.gsc_.teleport(param1.objectId_);
         this._Z_z = getTimer() + _16U_;
         return true;
      }
      
      private function _1wZ_(param1:String, param2:Object = null) : ChatMessage
      {
         return ChatMessage.make(Parameters.ErrorText,param1,-1,-1,"",false,param2);
      }
      
      public function _at(param1:String, param2:Boolean = true) : void
      {
         if(param2)
         {
            this._o8();
         }
         var _loc3_:_qP_ = new _qP_(this,new _dU_().setParams(param1),65280,2000);
         map_.mapOverlay_.addQueuedText(_loc3_);
      }
      
      public function _0R_t(param1:Boolean) : void
      {
         SFX.play("level_up");
         if(param1)
         {
            this._at(_1O_I_._1bU_,false);
            this._at(_1O_I_._0K_v);
         }
         else
         {
            this._at(_1O_I_._0K_v);
         }
      }
      
      public function _o8(param1:uint = 4.27825536E9) : void
      {
         map_.addObj(new LevelUpEffect(this,param1,20),x_,y_);
      }
      
      public function _1pl(param1:int) : void
      {
         if(level_ == 20)
         {
            return;
         }
         var _loc2_:_13g = new _13g(this,65280,1000);
         _loc2_.setStringBuilder(new _dU_().setParams(_1O_I_._1qz,{"exp":param1}));
         map_.mapOverlay_.addStatusText(_loc2_);
      }
      
      private function _N_8() : com.company.assembleegameclient.objects.Merchant
      {
         var _loc1_:Point = null;
         var _loc2_:com.company.assembleegameclient.objects.Merchant = null;
         var _loc3_:int = x_ - int(x_) > 0.5?1:-1;
         var _loc4_:int = y_ - int(y_) > 0.5?1:-1;
         for each(_loc1_ in _0iH_)
         {
            this._14W_.x_ = x_ + _loc3_ * _loc1_.x;
            this._14W_.y_ = y_ + _loc4_ * _loc1_.y;
            _loc2_ = map_.merchLookup_[this._14W_];
            if(_loc2_ != null)
            {
               return PointUtil.getDistanceSqr(_loc2_.x_,_loc2_.y_,x_,y_) < 1?_loc2_:null;
            }
         }
         return null;
      }
      
      override public function moveTo(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Boolean = super.moveTo(param1,param2);
         if(map_.gs_.evalIsNotInCombatMapArea())
         {
            this._O_D_ = this._N_8();
         }
         return _loc3_;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Vector.<uint> = null;
         if(this.lootTierTime_ && !isPaused())
         {
            this.lootTierTime_ = this.lootTierTime_ - param2;
            if(this.lootTierTime_ < 0)
            {
               this.lootTierTime_ = 0;
            }
         }
         if(this.dropRateTime_ && !isPaused())
         {
            this.dropRateTime_ = this.dropRateTime_ - param2;
            if(this.dropRateTime_ < 0)
            {
               this.dropRateTime_ = 0;
            }
         }
         if(this.xpBoostTime_ && !isPaused())
         {
            this.xpBoostTime_ = this.xpBoostTime_ - param2;
            if(this.xpBoostTime_ < 0)
            {
               this.xpBoostTime_ = 0;
            }
         }
         if(isHealing() && !isPaused())
         {
            if(this._0mE_ == null)
            {
               this._0mE_ = new HealingEffect(this);
               map_.addObj(this._0mE_,x_,y_);
            }
         }
         else if(this._0mE_ != null)
         {
            map_.removeObj(this._0mE_.objectId_);
            this._0mE_ = null;
         }
         var _loc8_:com.company.assembleegameclient.objects.GameObject = this.commune != null && !(this.commune is Player)?this.commune:this;
         if(_loc8_.movDir != null)
         {
            _loc3_ = Parameters.data_.cameraAngle;
            if(_loc8_.rotateDir != 0)
            {
               _loc3_ = _loc3_ + param2 * Parameters._0B_c * _loc8_.rotateDir;
               Parameters.data_.cameraAngle = _loc3_;
            }
         }
         if(map_.player_ == this && isPaused() && (this.commune == null || this.commune is Player))
         {
            return true;
         }
         if(_loc8_.movDir != null)
         {
            _loc8_.collisionBlockMove(param2,this.playerSpeed());
         }
         else if(!super.update(param1,param2))
         {
            return false;
         }
         if(map_.player_ == this && isPaused())
         {
            return true;
         }
         if(map_.player_ == this && square_.props_.maxDamage_ > 0 && square_.lastDamage_ + 500 < param1 && !isInvincible() && (square_.obj_ == null || !square_.obj_.props_.protectFromGroundDamage_))
         {
            _loc6_ = map_.gs_.gsc_.getNextDamage(square_.props_.minDamage_,square_.props_.maxDamage_);
            _loc7_ = new Vector.<uint>();
            _loc7_.push(ConditionEffect._1F_f);
            damage(-1,_loc6_,_loc7_,false,null);
            map_.gs_.gsc_.groundDamage(param1,x_,y_);
            square_.lastDamage_ = param1;
         }
         return true;
      }
      
      private function playerSpeed() : Number
      {
         if(isSlowed())
         {
            return _0wY_ * this._kP_;
         }
         var _loc1_:Number = _0wY_ + this.speed_ / 75 * (_nB_ - _0wY_);
         if(isSpeedy() || isNinjaSpeedy())
         {
            _loc1_ = _loc1_ * 1.5;
         }
         return _loc1_ * this._kP_;
      }
      
      public function _K_U_() : void
      {
         if(map_ == null)
         {
            return;
         }
         var _loc1_:Square = map_.getSquare(x_,y_);
         if(_loc1_.props_.sinking_)
         {
            sinkOffset_ = Math.min(sinkOffset_ + 1,Parameters._18x);
            this._kP_ = 0.1 + (1 - sinkOffset_ / Parameters._18x) * (_loc1_.props_.speed_ - 0.1);
         }
         else
         {
            sinkOffset_ = 0;
            this._kP_ = _loc1_.props_.speed_;
         }
      }
      
      override protected function makeNameBitmapData() : BitmapData
      {
         var _loc1_:_1eo = new SText(name_);
         var _loc2_:_0ke = GameContext.getInjector().getInstance(_0ke);
         var _loc3_:BitmapData = _loc2_.make(_loc1_,16,this._1jH_(),true,_07C_,true);
         _loc3_.draw(Star.getPlayerRankIcon(this.numStars_,this.admin_),_x8);
         return _loc3_;
      }
      
      private function _1jH_() : uint
      {
         if(this._0xU_)
         {
            return Parameters._0O_7;
         }
         if(this.nameChosen_)
         {
            return Parameters._1pF_;
         }
         return 16777215;
      }
      
      protected function _1iW_(param1:Vector.<IGraphicsData>, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this._02x == null)
         {
            this._Y_x = new GraphicsSolidFill();
            this._0nq = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
            this._9q = new GraphicsSolidFill(2542335);
            this._02x = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         }
         if(this.breath_ <= Parameters.LowBreath)
         {
            _loc3_ = (Parameters.LowBreath - this.breath_) / Parameters.LowBreath;
            this._Y_x.color = MoreColorUtil._J_A_(5526612,16711680,Math.abs(Math.sin(param2 / 300)) * _loc3_);
         }
         else
         {
            this._Y_x.color = 5526612;
         }
         var _loc5_:int = 20;
         var _loc6_:int = 8;
         var _loc7_:int = 6;
         this._0nq.data.length = 0;
         this._0nq.data.push(_P_c[0] - _loc5_,_P_c[1] + _loc6_,_P_c[0] + _loc5_,_P_c[1] + _loc6_,_P_c[0] + _loc5_,_P_c[1] + _loc6_ + _loc7_,_P_c[0] - _loc5_,_P_c[1] + _loc6_ + _loc7_);
         param1.push(this._Y_x);
         param1.push(this._0nq);
         param1.push(GraphicHelper.END_FILL);
         if(this.breath_ > 0)
         {
            _loc4_ = this.breath_ / 100 * 2 * _loc5_;
            this._02x.data.length = 0;
            this._02x.data.push(_P_c[0] - _loc5_,_P_c[1] + _loc6_,_P_c[0] - _loc5_ + _loc4_,_P_c[1] + _loc6_,_P_c[0] - _loc5_ + _loc4_,_P_c[1] + _loc6_ + _loc7_,_P_c[0] - _loc5_,_P_c[1] + _loc6_ + _loc7_);
            param1.push(this._9q);
            param1.push(this._02x);
            param1.push(GraphicHelper.END_FILL);
         }
         HWAccelerate.addSolidFill(this._9q,true);
         HWAccelerate.addSolidFill(this._Y_x,true);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         super.draw(param1,param2,param3);
         if(this != map_.player_)
         {
            if(!Parameters.HideHud)
            {
               _1si(param1,param2);
            }
         }
         else if(this.breath_ >= 0)
         {
            this._1iW_(param1,param3);
         }
      }
      
      public function _0x() : Number
      {
         if(isDazed())
         {
            return _lw;
         }
         var _loc1_:Number = _lw + this.dexterity_ / 75 * (_N_7 - _lw);
         if(isBerserk())
         {
            _loc1_ = _loc1_ * 1.5;
         }
         return _loc1_;
      }
      
      private function _0P_O_() : Number
      {
         if(isWeak())
         {
            return _1d9;
         }
         var _loc1_:Number = _1d9 + this.attack_ / 75 * (_1D_p - _1d9);
         if(isDamaging())
         {
            _loc1_ = _loc1_ * 1.5;
         }
         return _loc1_;
      }
      
      private function _07g() : void
      {
         var _loc1_:_18Q_ = this.skin.imageFromAngle(0,_Z_4._M_J_,0);
         _1vr = this.skin;
         texture_ = _loc1_.image_;
         mask_ = _loc1_.mask_;
         this._08X_ = true;
      }
      
      private function _0R_q() : void
      {
         var _loc1_:Vector.<XML> = ObjectLibrary._1cw;
         var _loc2_:uint = Math.floor(Math.random() * _loc1_.length);
         var _loc3_:int = _loc1_[_loc2_].@type;
         var _loc4_:_sV_ = ObjectLibrary._1eh[_loc3_];
         texture_ = _loc4_.texture_;
         mask_ = _loc4_.mask_;
         _1vr = _loc4_._1vr;
         this._08X_ = false;
      }
      
      override protected function getTexture(param1:View, param2:int) : BitmapData
      {
         var _loc3_:_18Q_ = null;
         var _loc4_:int = 0;
         var _loc5_:Dictionary = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:ColorTransform = null;
         var _loc13_:BitmapData = null;
         var _loc9_:Number = 0;
         var _loc10_:int = _Z_4._M_J_;
         if(this.isShooting || param2 < _0J_v + this._K_1)
         {
            _0v3 = _1ct;
            _loc9_ = (param2 - _0J_v) % this._K_1 / this._K_1;
            _loc10_ = _Z_4._t4;
         }
         else if(moveVec_.x != 0 || moveVec_.y != 0)
         {
            _loc4_ = 3.5 / this.playerSpeed();
            if(moveVec_.y != 0 || moveVec_.x != 0)
            {
               _0v3 = Math.atan2(moveVec_.y,moveVec_.x);
            }
            _loc9_ = param2 % _loc4_ / _loc4_;
            _loc10_ = _Z_4._E_S_;
         }
         if(this._nF_())
         {
            this._08X_ && this._0R_q();
         }
         else if(!this._08X_)
         {
            this._07g();
         }
         if(param1.Hallucinating)
         {
            _loc3_ = new _18Q_(getRandomCharBitmap(),null);
         }
         else if(param1.PartyVision)
         {
            if(clownSkin == null)
            {
               clownSkin = AnimatedLibrary._0B_e("customSkins8x8",0);
            }
            _loc3_ = clownSkin.imageFromFacing(_0v3,param1,_loc10_,_loc9_);
         }
         else if(param1.XMasVision)
         {
            if(playerXMasSkin == null)
            {
               playerXMasSkin = AnimatedLibrary._0B_e("customSkins8x8",1);
            }
            if(adminXMasSkin == null)
            {
               adminXMasSkin = AnimatedLibrary._0B_e("playerskins16",6);
            }
            if(this.admin_)
            {
               _loc3_ = adminXMasSkin.imageFromFacing(_0v3,param1,_loc10_,_loc9_);
            }
            else
            {
               _loc3_ = playerXMasSkin.imageFromFacing(_0v3,param1,_loc10_,_loc9_);
            }
         }
         else
         {
            _loc3_ = _1vr.imageFromFacing(_0v3,param1,_loc10_,_loc9_);
         }
         var _loc11_:int = tex1Id_;
         var _loc12_:int = tex2Id_;
         if(this._O_D_)
         {
            _loc5_ = _1zo[this._O_D_];
            if(_loc5_ == null)
            {
               _1zo[this._O_D_] = new Dictionary();
            }
            else
            {
               _loc13_ = _loc5_[_loc3_];
            }
            _loc11_ = this._O_D_.getTex1Id(tex1Id_);
            _loc12_ = this._O_D_.getTex2Id(tex2Id_);
         }
         else
         {
            _loc13_ = _1zo[_loc3_];
         }
         if(_loc13_ == null)
         {
            _loc13_ = TextureRedrawer.resize(_loc3_.image_,_loc3_.mask_,size_,false,_loc11_,_loc12_);
            if(this._O_D_ != null)
            {
               _1zo[this._O_D_][_loc3_] = _loc13_;
            }
            else
            {
               _1zo[_loc3_] = _loc13_;
            }
         }
         if(hp_ < maxHp_ * 0.2)
         {
            _loc6_ = int(Math.abs(Math.sin(param2 / 200)) * 10) / 10;
            _loc7_ = 128;
            _loc8_ = new ColorTransform(1,1,1,1,_loc6_ * _loc7_,-_loc6_ * _loc7_,-_loc6_ * _loc7_);
            _loc13_ = _1eD_._6U_(_loc13_,_loc8_);
         }
         var _loc14_:BitmapData = _1zo[_loc13_];
         if(_loc14_ == null)
         {
            _loc14_ = _0R_c._1iY_(_loc13_,this.glowing_);
            _1zo[_loc13_] = _loc14_;
         }
         if(isPetrify() || isPaused() || isStasis())
         {
            _loc14_ = _1eD_._1L_(_loc14_,_y1);
         }
         else if(isInvisible())
         {
            _loc14_ = _1eD_._0X_O_(_loc14_,0.4);
         }
         return _loc14_;
      }
      
      override public function getPortrait() : BitmapData
      {
         var _loc1_:_18Q_ = null;
         var _loc2_:int = 0;
         if(_0P_q == null)
         {
            _loc1_ = _1vr.imageFromDir(_Z_4.RIGHT,_Z_4._M_J_,0);
            _loc2_ = 4 / _loc1_.image_.width * 100;
            _0P_q = TextureRedrawer.resize(_loc1_.image_,_loc1_.mask_,_loc2_,true,tex1Id_,tex2Id_);
            _0P_q = _0R_c._1iY_(_0P_q,0);
         }
         return _0P_q;
      }
      
      public function useAltWeapon(param1:Number, param2:Number, param3:int) : Boolean
      {
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(map_ == null || isPaused())
         {
            return false;
         }
         var _loc9_:int = inventory_[1];
         if(_loc9_ == -1)
         {
            return false;
         }
         var _loc10_:XML = ObjectLibrary.XmlData[_loc9_];
         if(_loc10_ == null || !_loc10_.hasOwnProperty("Usable"))
         {
            return false;
         }
         var _loc11_:Point = map_.pSTopW(param1,param2);
         if(_loc11_ == null)
         {
            SFX.play("error");
            return false;
         }
         for each(_loc4_ in _loc10_.Activate)
         {
            if(_loc4_.toString() == ActivateEffect.TELEPORT)
            {
               if(!this.regionUnblocked(_loc11_.x,_loc11_.y))
               {
                  SFX.play("error");
                  return false;
               }
            }
         }
         _loc5_ = getTimer();
         if(param3 == _7o._0V_V_)
         {
            if(_loc5_ < this._0sw)
            {
               SFX.play("error");
               return false;
            }
            _loc7_ = int(_loc10_.MpCost);
            if(_loc7_ > this.mp_)
            {
               SFX.play("no_mana");
               return false;
            }
            _loc8_ = 500;
            if(_loc10_.hasOwnProperty("Cooldown"))
            {
               _loc8_ = Number(_loc10_.Cooldown) * 1000;
            }
            this._0sw = _loc5_ + _loc8_;
            map_.gs_.gsc_.useItem(_loc5_,objectId_,1,_loc9_,_loc11_.x,_loc11_.y,param3);
            if(_loc10_.Activate == ActivateEffect.SHOOT)
            {
               _loc6_ = Math.atan2(param2,param1);
               this._ts(_loc5_,_loc9_,_loc10_,Parameters.data_.cameraAngle + _loc6_,false);
            }
         }
         else if(_loc10_.hasOwnProperty("MultiPhase"))
         {
            map_.gs_.gsc_.useItem(_loc5_,objectId_,1,_loc9_,_loc11_.x,_loc11_.y,param3);
            _loc7_ = int(_loc10_.MpEndCost);
            if(_loc7_ <= this.mp_)
            {
               _loc6_ = Math.atan2(param2,param1);
               this._ts(_loc5_,_loc9_,_loc10_,Parameters.data_.cameraAngle + _loc6_,false);
            }
         }
         return true;
      }
      
      public function _0J_(param1:Number) : void
      {
         this.shoot(Parameters.data_.cameraAngle + param1);
      }
      
      override public function setAttack(param1:int, param2:Number) : void
      {
         var _loc3_:XML = ObjectLibrary.XmlData[param1];
         if(_loc3_ == null || !_loc3_.hasOwnProperty("RateOfFire"))
         {
            return;
         }
         var _loc4_:Number = Number(_loc3_.RateOfFire);
         this._K_1 = 1 / this._0x() * (1 / _loc4_);
         super.setAttack(param1,param2);
      }
      
      private function shoot(param1:Number) : void
      {
         if(map_ == null || isStunned() || (isPaused() || isPetrify()))
         {
            return;
         }
         var _loc2_:int = inventory_[0];
         if(_loc2_ == -1)
         {
            return;
         }
         var _loc3_:XML = ObjectLibrary.XmlData[_loc2_];
         var _loc4_:int = getTimer();
         var _loc5_:Number = Number(_loc3_.RateOfFire);
         this._K_1 = 1 / this._0x() * (1 / _loc5_);
         if(_loc4_ < _0J_v + this._K_1)
         {
            return;
         }
         doneAction(map_.gs_,Tutorial._0ol);
         _1ct = param1;
         _0J_v = _loc4_;
         this._ts(_0J_v,_loc2_,_loc3_,_1ct,true);
      }
      
      private function _ts(param1:int, param2:int, param3:XML, param4:Number, param5:Boolean) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:Projectile = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc16_:int = 0;
         var _loc12_:int = !!param3.hasOwnProperty("NumProjectiles")?int(int(param3.NumProjectiles)):1;
         var _loc13_:Number = (!!param3.hasOwnProperty("ArcGap")?Number(param3.ArcGap):11.25) * Trig._P_0;
         var _loc14_:Number = _loc13_ * (_loc12_ - 1);
         var _loc15_:Number = param4 - _loc14_ / 2;
         while(_loc16_ < _loc12_)
         {
            _loc6_ = _q5();
            _loc7_ = _1C_q._1I_j(Projectile) as Projectile;
            if(param5 && this._sB_ != "")
            {
               _loc7_.reset(param2,0,objectId_,_loc6_,_loc15_,param1,this._sB_,this._0vn);
            }
            else
            {
               _loc7_.reset(param2,0,objectId_,_loc6_,_loc15_,param1);
            }
            _loc8_ = !!param5?int(this.damageMin_):int(int(_loc7_.projProps_.minDamage_));
            _loc9_ = !!param5?int(this.damageMax_):int(int(_loc7_.projProps_.maxDamage_));
            _loc10_ = this._0P_O_();
            _loc11_ = map_.gs_.gsc_.getNextDamage(_loc8_,_loc9_) * _loc10_;
            if(param1 > map_.gs_.moveRecords_.lastClearTime_ + 600)
            {
               _loc11_ = 0;
            }
            _loc7_._0jS_(_loc11_);
            if(_loc16_ == 0 && _loc7_._1uT_ != null)
            {
               SFX.play(_loc7_._1uT_,0.75,false);
            }
            map_.addObj(_loc7_,x_ + Math.cos(param4) * 0.3,y_ + Math.sin(param4) * 0.3);
            map_.gs_.gsc_.playerShoot(param1,_loc7_);
            _loc15_ = _loc15_ + _loc13_;
            _loc16_++;
         }
      }
      
      public function _nF_() : Boolean
      {
         return (condition_[ConditionEffect.FirstOrder] & ConditionEffect.Hexed) != 0;
      }
      
      public function _1H_9() : Boolean
      {
         var _loc1_:int = inventory_.length;
         var _loc2_:uint = 4;
         while(_loc2_ < _loc1_)
         {
            if(inventory_[_loc2_] <= 0)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function nextAvailableInventorySlot() : int
      {
         var _loc1_:int = !!this.hasBackpack_?int(inventory_.length):int(inventory_.length - _1Y_F_._16J_);
         var _loc2_:uint = 4;
         while(_loc2_ < _loc1_)
         {
            if(inventory_[_loc2_] <= 0)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function swapInventoryIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this.hasBackpack_)
         {
            return -1;
         }
         if(param1 == _1K_S_._069)
         {
            _loc2_ = _1Y_F_._J_p;
            _loc3_ = _1Y_F_._J_p + _1Y_F_._16J_;
         }
         else
         {
            _loc2_ = _1Y_F_._J_p + _1Y_F_._16J_;
            _loc3_ = inventory_.length;
         }
         var _loc4_:uint = _loc2_;
         while(_loc4_ < _loc3_)
         {
            if(inventory_[_loc4_] <= 0)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function getPotionCount(param1:int) : int
      {
         switch(param1)
         {
            case _I_I_._1__7:
               return this.healthStackCount_;
            case _I_I_._11C_:
               return this.magicStackCount_;
            default:
               return 0;
         }
      }
      
      public function getTex1() : int
      {
         return tex1Id_;
      }
      
      public function getTex2() : int
      {
         return tex2Id_;
      }
   }
}
