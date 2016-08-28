package com.company.assembleegameclient.objects
{
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import com.company.assembleegameclient.util.ConditionEffect;
   import com.company.util.MoreColorUtil;
   import flash.display.BitmapData;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import _0x1._3E_;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.engine3d._1ee;
   import _0gO_.Object3D;
   import _0x1.ParticleEffect;
   import _0cH_.Animations;
   import flash.utils.Dictionary;
   import flash.geom.Vector3D;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsGradientFill;
   import _ll.SFX;
   import com.company.util.BitmapUtil;
   import _7m._H_Q_;
   import com.company.assembleegameclient.map.Map;
   import com.company.assembleegameclient.map.Square;
   import _113._13g;
   import _1xa.SText;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1F_z._0P_4;
   import _1F_z._1Z_D_;
   import _0H_6.GameContext;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util._1R_b;
   import _0x1.ExplosionEffect;
   import _0x1.HitEffect;
   import _1xa._1eo;
   import _1gF_._0ke;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.util.GraphicHelper;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.util._1eD_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0R_W_._0R_c;
   import flash.utils.getTimer;
   import _V_E_.HWAccelerate;
   import flash.geom.ColorTransform;
   import flash.display.GradientType;
   import flash.utils.getQualifiedClassName;
   import com.company.assembleegameclient.engine3d._1aW_;
   import _0cH_._1O_F_;
   import com.company.util.ConversionUtil;
   
   public class GameObject extends BasicObject
   {
      
      protected static const _y1:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
      
      protected static const _10c:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._1rD_);
      
      protected static const _0L_P_:Matrix = new Matrix();
      
      private static const CollisionSkipBoundary:Number = 0.4;
      
      private static const _1P_F_:Number = 0.00001;
      
      private static const _ty:Number = -_1P_F_;
      
      public static const _1pY_:int = 300;
      
      private static var loc:Point = new Point();
       
      
      private var mobInfoShown:Boolean = false;
      
      private var mobSpd:String;
      
      private var lastPoint:Point;
      
      public var _11b:BitmapData = null;
      
      private var _1L_P_:GraphicsBitmapFill = null;
      
      private var _1iI_:GraphicsPath = null;
      
      public var _sT_:_3E_;
      
      private var _1A_R_:Boolean;
      
      private var _1vU_:Boolean = false;
      
      private var _K_k:Boolean;
      
      private var _0gA_:Boolean = false;
      
      public var props_:com.company.assembleegameclient.objects.ObjectProperties;
      
      public var name_:String;
      
      public var radius_:Number = 0.5;
      
      public var _0v3:Number = 0;
      
      public var flying_:Boolean = false;
      
      public var _1ct:Number = 0;
      
      public var _0J_v:int = 0;
      
      public var _1vr:_Z_4 = null;
      
      public var texture_:BitmapData = null;
      
      public var mask_:BitmapData = null;
      
      public var _L_4:Vector.<com.company.assembleegameclient.objects._sV_> = null;
      
      public var _0oI_:_1ee = null;
      
      public var _f9:Object3D = null;
      
      public var effect_:ParticleEffect = null;
      
      public var _1s8:Animations = null;
      
      public var dying_:Boolean = false;
      
      protected var _0P_q:BitmapData = null;
      
      public var _1zo:Dictionary = null;
      
      public var maxHp_:int = 200;
      
      public var hp_:int = 200;
      
      public var size_:int = 100;
      
      public var level_:int = -1;
      
      public var defense_:int = 0;
      
      public var _01e:Vector.<int> = null;
      
      public var inventory_:Vector.<int> = null;
      
      public var condition_:Vector.<uint>;
      
      protected var tex1Id_:int = 0;
      
      protected var tex2Id_:int = 0;
      
      public var _1kM_:Boolean = false;
      
      public var objectType_:int;
      
      private var _19y:uint = 1;
      
      private var _0ix:Number = 1;
      
      public var sinkOffset_:int = 0;
      
      public var _1ek:BitmapData = null;
      
      public var _1bO_:com.company.assembleegameclient.objects._T_k = null;
      
      public var objectConnection:int = -1;
      
      private var _0dk:Boolean = false;
      
      private var _V_Z_:Boolean = false;
      
      private var _aY_:Boolean = false;
      
      public var movDir:Point = null;
      
      public var rotateDir:Number = 0;
      
      protected var _3__:int = 0;
      
      protected var _aX_:int = -1;
      
      protected var _0aA_:Point;
      
      protected var _0F_B_:Point;
      
      protected var moveVec_:Vector3D;
      
      protected var bitmapFill_:GraphicsBitmapFill;
      
      protected var path_:GraphicsPath;
      
      protected var vS_:Vector.<Number>;
      
      protected var _0oD_:Vector.<Number>;
      
      protected var _1T_f:Matrix;
      
      private var _0kP_:GraphicsSolidFill = null;
      
      private var _1U_W_:GraphicsPath = null;
      
      private var _n__:GraphicsSolidFill = null;
      
      private var _qK_:GraphicsPath = null;
      
      private var condEffectIcons:Vector.<BitmapData> = null;
      
      private var _9j:Vector.<GraphicsBitmapFill> = null;
      
      private var _s:Vector.<GraphicsPath> = null;
      
      protected var _yH_:GraphicsGradientFill = null;
      
      protected var _0I_B_:GraphicsPath = null;
      
      public function GameObject(param1:XML)
      {
         var _loc2_:int = 0;
         this.props_ = ObjectLibrary._0Y_5;
         this.condition_ = new <uint>[0,0];
         this._0aA_ = new Point();
         this._0F_B_ = new Point();
         this.moveVec_ = new Vector3D();
         this.bitmapFill_ = new GraphicsBitmapFill(null,null,false,false);
         this.path_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,null);
         this.vS_ = new Vector.<Number>();
         this._0oD_ = new Vector.<Number>();
         this._1T_f = new Matrix();
         super();
         if(param1 == null)
         {
            return;
         }
         this.objectType_ = int(param1.@type);
         this.props_ = ObjectLibrary._01A_[this.objectType_];
         hasShadow = this.props_.shadowSize_ > 0;
         var _loc3_:com.company.assembleegameclient.objects._sV_ = ObjectLibrary._1eh[this.objectType_];
         this.texture_ = _loc3_.texture_;
         this.mask_ = _loc3_.mask_;
         this._1vr = _loc3_._1vr;
         this._L_4 = _loc3_._L_4;
         if(_loc3_._0K_7 != null)
         {
            this.effect_ = ParticleEffect._gb(_loc3_._0K_7,this);
         }
         if(this.texture_ != null)
         {
            this._0ix = this.texture_.height / 8;
         }
         if(param1.hasOwnProperty("Model"))
         {
            this._0oI_ = _1aW_._N_T_(String(param1.Model));
            this._f9 = _1aW_._05M_(String(param1.Model));
            if(this.texture_ != null)
            {
               this._f9._sW_(this.texture_);
            }
         }
         var _loc4_:_1O_F_ = ObjectLibrary._0ld[this.objectType_];
         if(_loc4_ != null)
         {
            this._1s8 = new Animations(_loc4_);
         }
         z_ = this.props_.z_;
         this.flying_ = this.props_.flying_;
         if(param1.hasOwnProperty("MaxHitPoints"))
         {
            this.hp_ = this.maxHp_ = int(param1.MaxHitPoints);
         }
         if(param1.hasOwnProperty("Defense"))
         {
            this.defense_ = int(param1.Defense);
         }
         if(param1.hasOwnProperty("SlotTypes"))
         {
            this._01e = ConversionUtil._1b5(param1.SlotTypes);
            this.inventory_ = new Vector.<int>(this._01e.length);
            _loc2_ = 0;
            while(_loc2_ < this.inventory_.length)
            {
               this.inventory_[_loc2_] = -1;
               _loc2_++;
            }
         }
         if(param1.hasOwnProperty("Tex1"))
         {
            this.tex1Id_ = int(param1.Tex1);
         }
         if(param1.hasOwnProperty("Tex2"))
         {
            this.tex2Id_ = int(param1.Tex2);
         }
         if(param1.hasOwnProperty("StunImmune"))
         {
            this._0dk = true;
         }
         if(param1.hasOwnProperty("ParalyzeImmune"))
         {
            this._V_Z_ = true;
         }
         if(param1.hasOwnProperty("DazedImmune"))
         {
            this._aY_ = true;
         }
         this.props_._Z_N_();
      }
      
      public static function GetDamage(param1:int, param2:int, param3:Boolean, param4:Vector.<uint>) : int
      {
         var _loc5_:int = param2;
         if(param3 || (param4[ConditionEffect.FirstOrder] & ConditionEffect.ArmorBroken) != 0)
         {
            _loc5_ = 0;
         }
         else if((param4[ConditionEffect.FirstOrder] & ConditionEffect.Armored) != 0)
         {
            _loc5_ = _loc5_ * 2;
         }
         var _loc6_:int = param1 * 0.25;
         var _loc7_:int = Math.max(_loc6_,param1 - _loc5_);
         if((param4[ConditionEffect.FirstOrder] & ConditionEffect.Invulnerable) != 0)
         {
            _loc7_ = 0;
         }
         if((param4[ConditionEffect.SecondOrder] & ConditionEffect.Petrify) != 0)
         {
            _loc7_ = _loc7_ * 0.9;
         }
         if((param4[ConditionEffect.SecondOrder] & ConditionEffect.Curse) != 0)
         {
            _loc7_ = _loc7_ * 1.2;
         }
         return _loc7_;
      }
      
      public function setObjectId(param1:int) : void
      {
         var _loc2_:com.company.assembleegameclient.objects._sV_ = null;
         objectId_ = param1;
         if(this._L_4 != null)
         {
            _loc2_ = this._L_4[objectId_ % this._L_4.length];
            this.texture_ = _loc2_.texture_;
            this.mask_ = _loc2_.mask_;
            this._1vr = _loc2_._1vr;
            if(this._f9 != null)
            {
               this._f9._sW_(this.texture_);
            }
         }
      }
      
      public function setAltTexture(param1:int) : void
      {
         var _loc2_:com.company.assembleegameclient.objects._sV_ = null;
         var _loc3_:com.company.assembleegameclient.objects._sV_ = ObjectLibrary._1eh[this.objectType_];
         if(param1 == 0)
         {
            _loc2_ = _loc3_;
         }
         else
         {
            _loc2_ = _loc3_.getAltTextureData(param1);
            if(_loc2_ == null)
            {
               return;
            }
         }
         this.texture_ = _loc2_.texture_;
         this.mask_ = _loc2_.mask_;
         this._1vr = _loc2_._1vr;
         if(this.effect_ != null)
         {
            map_.removeObj(this.effect_.objectId_);
            this.effect_ = null;
         }
         if(_loc2_._0K_7 != null)
         {
            this.effect_ = ParticleEffect._gb(_loc2_._0K_7,this);
            if(map_ != null)
            {
               map_.addObj(this.effect_,x_,y_);
            }
         }
      }
      
      public function setTex1(param1:int) : void
      {
         if(param1 == this.tex1Id_)
         {
            return;
         }
         this.tex1Id_ = param1;
         this._1zo = new Dictionary();
         this._0P_q = null;
      }
      
      public function setTex2(param1:int) : void
      {
         if(param1 == this.tex2Id_)
         {
            return;
         }
         this.tex2Id_ = param1;
         this._1zo = new Dictionary();
         this._0P_q = null;
      }
      
      public function setSize(param1:int) : void
      {
         if(param1 == this.size_)
         {
            return;
         }
         this.size_ = param1;
         this._1zo = new Dictionary();
         this._0P_q = null;
      }
      
      public function _fd(param1:int) : void
      {
         SFX.play(this.props_._R_q[param1]);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Object = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Dictionary = null;
         var _loc4_:Object = null;
         var _loc5_:BitmapData = null;
         super.dispose();
         this.texture_ = null;
         if(this._0P_q != null)
         {
            this._0P_q.dispose();
            this._0P_q = null;
         }
         if(this._1zo != null)
         {
            for each(_loc1_ in this._1zo)
            {
               _loc2_ = _loc1_ as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               else
               {
                  _loc3_ = _loc1_ as Dictionary;
                  for each(_loc4_ in _loc3_)
                  {
                     _loc5_ = _loc4_ as BitmapData;
                     if(_loc5_ != null)
                     {
                        _loc5_.dispose();
                     }
                  }
               }
            }
            this._1zo = null;
         }
         if(this._0oI_ != null)
         {
            this._0oI_.dispose();
            this._0oI_ = null;
         }
         if(this._f9 != null)
         {
            this._f9.dispose();
            this._f9 = null;
         }
         this._01e = null;
         this.inventory_ = null;
         if(this._11b != null)
         {
            this._11b.dispose();
            this._11b = null;
         }
         this._1L_P_ = null;
         this._1iI_ = null;
         this.bitmapFill_ = null;
         this.path_.commands = null;
         this.path_.data = null;
         this.vS_ = null;
         this._0oD_ = null;
         this._1T_f = null;
         this.condEffectIcons = null;
         this._9j = null;
         this._s = null;
         this._yH_ = null;
         if(this._0I_B_ != null)
         {
            this._0I_B_.commands = null;
            this._0I_B_.data = null;
            this._0I_B_ = null;
         }
      }
      
      public function isQuiet() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Quiet) != 0;
      }
      
      public function isWeak() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Weak) != 0;
      }
      
      public function isSlowed() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Slowed) != 0;
      }
      
      public function isSick() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Sick) != 0;
      }
      
      public function isDazed() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Dazed) != 0;
      }
      
      public function isStunned() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Stunned) != 0;
      }
      
      public function isBlind() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Blind) != 0;
      }
      
      public function isDrunk() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Drunk) != 0;
      }
      
      public function isConfused() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Confused) != 0;
      }
      
      public function isStunImmune() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.StunImmune) != 0 || this._0dk;
      }
      
      public function isInvisible() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Invisible) != 0;
      }
      
      public function isParalyzed() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Paralyzed) != 0;
      }
      
      public function isSpeedy() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Speedy) != 0;
      }
      
      public function isNinjaSpeedy() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.NinjaSpeedy) != 0;
      }
      
      public function isHallucinating() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Hallucinating) != 0;
      }
      
      public function isPartyVision() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.PartyVision) != 0;
      }
      
      public function isXMasVision() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.XMasVision) != 0;
      }
      
      public function isHealing() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Healing) != 0;
      }
      
      public function isDamaging() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Damaging) != 0;
      }
      
      public function isBerserk() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Berserk) != 0;
      }
      
      public function isPaused() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Paused) != 0;
      }
      
      public function isStasis() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Stasis) != 0;
      }
      
      public function isInvincible() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Invincible) != 0;
      }
      
      public function isInvulnerable() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Invulnerable) != 0;
      }
      
      public function isArmored() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Armored) != 0;
      }
      
      public function isArmorBroken() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.ArmorBroken) != 0;
      }
      
      public function isArmorBrokenImmune() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.ArmorBrokenImmune) != 0;
      }
      
      public function isSlowedImmune() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.SlowedImmune) != 0;
      }
      
      public function isUnstable() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Unstable) != 0;
      }
      
      public function isPetDisable() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.PetDisable) != 0;
      }
      
      public function isDarkness() : Boolean
      {
         return (this.condition_[ConditionEffect.FirstOrder] & ConditionEffect.Darkness) != 0;
      }
      
      public function isParalyzedImmune() : Boolean
      {
         return this._V_Z_ || (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.ParalyzedImmune) != 0;
      }
      
      public function isDazedImmune() : Boolean
      {
         return this._aY_ || (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.DazedImmune) != 0;
      }
      
      public function isPetrify() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.Petrify) != 0;
      }
      
      public function isPetrifyImmune() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.PetrifyImmune) != 0;
      }
      
      public function isCurse() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.Curse) != 0;
      }
      
      public function isCurseImmune() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.CurseImmune) != 0;
      }
      
      public function isHidden() : Boolean
      {
         return (this.condition_[ConditionEffect.SecondOrder] & ConditionEffect.Hidden) != 0;
      }
      
      public function _1M_j(param1:int = 20) : Boolean
      {
         var _loc2_:GameObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc2_ in map_.goDict_)
         {
            if(_loc2_ is Character && _loc2_.props_.isEnemy_)
            {
               _loc3_ = x_ > _loc2_.x_?int(x_ - _loc2_.x_):int(_loc2_.x_ - x_);
               _loc4_ = y_ > _loc2_.y_?int(y_ - _loc2_.y_):int(_loc2_.y_ - y_);
               if(_loc3_ < param1 && _loc4_ < param1)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function getName() : String
      {
         return this.name_ == null || this.name_ == ""?ObjectLibrary._O_S_[this.objectType_]:this.name_;
      }
      
      public function getColor() : uint
      {
         return BitmapUtil._05c(this.texture_);
      }
      
      public function _q5() : uint
      {
         var _loc1_:uint = this._19y;
         this._19y = (this._19y + 1) % 128;
         return _loc1_;
      }
      
      public function _T_V_(param1:_H_Q_) : Number
      {
         var _loc2_:Number = param1.x_ - x_;
         var _loc3_:Number = param1.y_ - y_;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function _lG_(param1:Boolean) : void
      {
         if(param1)
         {
            this._1A_R_ = true;
         }
         else
         {
            this._1A_R_ = false;
            this._1vU_ = false;
         }
      }
      
      public function _1Z_9(param1:Boolean) : void
      {
         if(param1)
         {
            this._K_k = true;
         }
         else
         {
            this._K_k = false;
            this._0gA_ = false;
         }
      }
      
      override public function addTo(param1:Map, param2:Number, param3:Number) : Boolean
      {
         map_ = param1;
         this._0aA_.x = this._0F_B_.x = param2;
         this._0aA_.y = this._0F_B_.y = param3;
         if(!this.moveTo(param2,param3))
         {
            map_ = null;
            return false;
         }
         if(this.effect_ != null)
         {
            map_.addObj(this.effect_,param2,param3);
         }
         return true;
      }
      
      override public function removeFromMap() : void
      {
         if(this.props_.static_ && square_ != null)
         {
            if(square_.obj_ == this)
            {
               square_.obj_ = null;
            }
            square_ = null;
         }
         if(this.effect_ != null)
         {
            map_.removeObj(this.effect_.objectId_);
         }
         super.removeFromMap();
         this.dispose();
      }
      
      public function moveTo(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Square = map_.getSquare(param1,param2);
         if(_loc3_ == null)
         {
            return false;
         }
         x_ = param1;
         y_ = param2;
         if(this.props_.static_)
         {
            if(square_ != null)
            {
               square_.obj_ = null;
            }
            _loc3_.obj_ = this;
         }
         square_ = _loc3_;
         if(this._0oI_ != null)
         {
            this._0oI_.setPosition(x_,y_,0,this.props_.rotation_);
         }
         if(this._f9 != null)
         {
            this._f9.setPosition(x_,y_,0,this.props_.rotation_);
         }
         return true;
      }
      
      private function mobInfo(param1:String) : void
      {
         var _loc2_:_13g = new _13g(this,65280,1);
         _loc2_.setStringBuilder(new SText(param1));
         map_.mapOverlay_.addStatusText(_loc2_);
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         if(WebMain.debug && this is Character && !(this is Player))
         {
            _loc7_ = int(this._0aA_.subtract(new Point(this.map_.player_.x_,this.map_.player_.y_)).length * 100) / 100;
            this.mobInfo(this.props_.id_ + "\nSpd: " + this.mobSpd + " Dis: " + _loc7_);
         }
         if(map_.player_.commune != this || map_.player_.commune is Player)
         {
            if(!(this.moveVec_.x == 0 && this.moveVec_.y == 0))
            {
               if(this._aX_ < map_.gs_.gsc_.lastTickId_)
               {
                  this.moveVec_.x = 0;
                  this.moveVec_.y = 0;
                  this.moveTo(this._0F_B_.x,this._0F_B_.y);
               }
               else
               {
                  _loc3_ = param1 - this._3__;
                  _loc4_ = this._0aA_.x + _loc3_ * this.moveVec_.x;
                  _loc5_ = this._0aA_.y + _loc3_ * this.moveVec_.y;
                  this.moveTo(_loc4_,_loc5_);
                  _loc6_ = true;
               }
            }
         }
         if(this.props_.whileMovingProps_ != null)
         {
            if(!_loc6_)
            {
               z_ = this.props_.z_;
               this.flying_ = this.props_.flying_;
            }
            else
            {
               z_ = this.props_.whileMovingProps_.z_;
               this.flying_ = this.props_.whileMovingProps_.flying_;
            }
         }
         return true;
      }
      
      public function _0H_1(param1:Number, param2:Number, param3:int) : void
      {
         this.moveTo(param1,param2);
         this._3__ = param3;
         this._0F_B_.x = param1;
         this._0F_B_.y = param2;
         this._0aA_.x = param1;
         this._0aA_.y = param2;
         this.moveVec_.x = 0;
         this.moveVec_.y = 0;
      }
      
      public function _rl(param1:Number, param2:Number, param3:int, param4:int) : void
      {
         if(this._aX_ < map_.gs_.gsc_.lastTickId_)
         {
            this.moveTo(this._0F_B_.x,this._0F_B_.y);
         }
         this._3__ = map_.gs_.lastUpdate_;
         this._0F_B_.x = param1;
         this._0F_B_.y = param2;
         this._0aA_.x = x_;
         this._0aA_.y = y_;
         this.moveVec_.x = (this._0F_B_.x - this._0aA_.x) / param3;
         this.moveVec_.y = (this._0F_B_.y - this._0aA_.y) / param3;
         this._aX_ = param4;
         if(WebMain.debug)
         {
            if(this.lastPoint != null)
            {
               this.mobSpd = new String(int(this._0F_B_.subtract(this.lastPoint).length / param3 * 1000 * 100) / 100);
            }
            this.lastPoint = new Point(this._0F_B_.x,this._0F_B_.y);
         }
      }
      
      private function calcMoveVec(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(this.movDir.x != 0 || this.movDir.y != 0)
         {
            _loc3_ = Math.atan2(this.movDir.y,this.movDir.x);
            this.moveVec_.x = param2 * Math.cos(param1 + _loc3_);
            this.moveVec_.y = param2 * Math.sin(param1 + _loc3_);
         }
         else
         {
            this.moveVec_.x = 0;
            this.moveVec_.y = 0;
         }
         if(square_ != null && square_.props_.push_)
         {
            this.moveVec_.x = this.moveVec_.x - square_.props_.animate_.dx_ / 1000;
            this.moveVec_.y = this.moveVec_.y - square_.props_.animate_.dy_ / 1000;
         }
      }
      
      public function collisionBlockMove(param1:int, param2:Number) : Boolean
      {
         this.calcMoveVec(Parameters.data_.cameraAngle,param2);
         var _loc3_:Number = x_ + param1 * this.moveVec_.x;
         var _loc4_:Number = y_ + param1 * this.moveVec_.y;
         this.getNewLocation(_loc3_,_loc4_,loc);
         return this.moveTo(loc.x,loc.y);
      }
      
      public function getNewLocation(param1:Number, param2:Number, param3:Point) : void
      {
         var _loc8_:Boolean = false;
         if(this.isPetrify() || this.isParalyzed())
         {
            param3.x = x_;
            param3.y = y_;
            return;
         }
         var _loc4_:Number = param1 - x_;
         var _loc5_:Number = param2 - y_;
         if(_loc4_ < CollisionSkipBoundary && _loc4_ > -CollisionSkipBoundary && _loc5_ < CollisionSkipBoundary && _loc5_ > -CollisionSkipBoundary)
         {
            this.calcNewLocation(param1,param2,param3);
            return;
         }
         var _loc6_:Number = CollisionSkipBoundary / Math.max(Math.abs(_loc4_),Math.abs(_loc5_));
         var _loc7_:Number = 0;
         param3.x = x_;
         param3.y = y_;
         while(!_loc8_)
         {
            if(_loc7_ + _loc6_ >= 1)
            {
               _loc6_ = 1 - _loc7_;
               _loc8_ = true;
            }
            this.calcNewLocation(param3.x + _loc4_ * _loc6_,param3.y + _loc5_ * _loc6_,param3);
            _loc7_ = _loc7_ + _loc6_;
         }
      }
      
      public function calcNewLocation(param1:Number, param2:Number, param3:Point) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = x_ % 0.5 == 0 && param1 != x_ || int(x_ / 0.5) != int(param1 / 0.5);
         var _loc7_:Boolean = y_ % 0.5 == 0 && param2 != y_ || int(y_ / 0.5) != int(param2 / 0.5);
         if(!_loc6_ && !_loc7_ || this.regionUnblocked(param1,param2))
         {
            param3.x = param1;
            param3.y = param2;
            return;
         }
         if(_loc6_)
         {
            _loc4_ = param1 > x_?Number(int(param1 * 2) / 2):Number(int(x_ * 2) / 2);
            if(int(_loc4_) > int(x_))
            {
               _loc4_ = _loc4_ - 0.01;
            }
         }
         if(_loc7_)
         {
            _loc5_ = param2 > y_?Number(int(param2 * 2) / 2):Number(int(y_ * 2) / 2);
            if(int(_loc5_) > int(y_))
            {
               _loc5_ = _loc5_ - 0.01;
            }
         }
         if(!_loc6_)
         {
            param3.x = param1;
            param3.y = _loc5_;
            return;
         }
         if(!_loc7_)
         {
            param3.x = _loc4_;
            param3.y = param2;
            return;
         }
         var _loc8_:Number = param1 > x_?Number(param1 - _loc4_):Number(_loc4_ - param1);
         var _loc9_:Number = param2 > y_?Number(param2 - _loc5_):Number(_loc5_ - param2);
         if(_loc8_ > _loc9_)
         {
            if(this.regionUnblocked(param1,_loc5_))
            {
               param3.x = param1;
               param3.y = _loc5_;
               return;
            }
            if(this.regionUnblocked(_loc4_,param2))
            {
               param3.x = _loc4_;
               param3.y = param2;
               return;
            }
         }
         else
         {
            if(this.regionUnblocked(_loc4_,param2))
            {
               param3.x = _loc4_;
               param3.y = param2;
               return;
            }
            if(this.regionUnblocked(param1,_loc5_))
            {
               param3.x = param1;
               param3.y = _loc5_;
               return;
            }
         }
         param3.x = _loc4_;
         param3.y = _loc5_;
      }
      
      public function regionUnblocked(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Square = map_.getSquare(param1,param2);
         if(square_ != _loc3_ && (_loc3_ == null || !_loc3_.passable()))
         {
            return false;
         }
         var _loc4_:Number = param1 - int(param1);
         var _loc5_:Number = param2 - int(param2);
         if(_loc4_ < 0.5)
         {
            if(this.squareOccupied(param1 - 1,param2))
            {
               return false;
            }
            if(_loc5_ < 0.5)
            {
               if(this.squareOccupied(param1,param2 - 1) || this.squareOccupied(param1 - 1,param2 - 1))
               {
                  return false;
               }
            }
            else if(_loc5_ > 0.5)
            {
               if(this.squareOccupied(param1,param2 + 1) || this.squareOccupied(param1 - 1,param2 + 1))
               {
                  return false;
               }
            }
         }
         else if(_loc4_ > 0.5)
         {
            if(this.squareOccupied(param1 + 1,param2))
            {
               return false;
            }
            if(_loc5_ < 0.5)
            {
               if(this.squareOccupied(param1,param2 - 1) || this.squareOccupied(param1 + 1,param2 - 1))
               {
                  return false;
               }
            }
            else if(_loc5_ > 0.5)
            {
               if(this.squareOccupied(param1,param2 + 1) || this.squareOccupied(param1 + 1,param2 + 1))
               {
                  return false;
               }
            }
         }
         else if(_loc5_ < 0.5)
         {
            if(this.squareOccupied(param1,param2 - 1))
            {
               return false;
            }
         }
         else if(_loc5_ > 0.5)
         {
            if(this.squareOccupied(param1,param2 + 1))
            {
               return false;
            }
         }
         return true;
      }
      
      public function squareOccupied(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Square = map_.lookupSquare(param1,param2);
         return _loc3_ == null || _loc3_.tileType_ == 255 || _loc3_.obj_ != null && _loc3_.obj_.props_.fullOccupy_;
      }
      
      public function damage(param1:int, param2:int, param3:Vector.<uint>, param4:Boolean, param5:Projectile) : void
      {
         var _loc6_:int = 0;
         var _loc7_:uint = 0;
         var _loc8_:ConditionEffect = null;
         var _loc9_:_13g = null;
         var _loc10_:_0P_4 = null;
         var _loc11_:_1Z_D_ = null;
         var _loc12_:String = null;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         if(param4)
         {
            this.dying_ = true;
         }
         else if(param3 != null)
         {
            _loc6_ = 0;
            for each(_loc7_ in param3)
            {
               _loc8_ = null;
               if(param5 != null && param5.projProps_.conditionEffects_ && param5.projProps_.conditionEffects_[_loc7_])
               {
                  _loc10_ = GameContext.getInjector().getInstance(_0P_4);
                  _loc11_ = _loc10_._0T_T_();
                  if(_loc11_ != null)
                  {
                     _loc8_ = ConditionEffect.effects_[_loc7_];
                     this._08G_(_loc6_,_loc8_.name_);
                     _loc6_ = _loc6_ + 500;
                  }
               }
               else
               {
                  switch(_loc7_)
                  {
                     case ConditionEffect.NothingIndex:
                        break;
                     case ConditionEffect.QuietIndex:
                     case ConditionEffect.WeakIndex:
                     case ConditionEffect.SickIndex:
                     case ConditionEffect.BlindIndex:
                     case ConditionEffect.HallucinatingIndex:
                     case ConditionEffect.DrunkIndex:
                     case ConditionEffect.ConfusedIndex:
                     case ConditionEffect.StunImmuneIndex:
                     case ConditionEffect.InvisibleIndex:
                     case ConditionEffect.SpeedyIndex:
                     case ConditionEffect.BleedingIndex:
                     case ConditionEffect.StasisIndex:
                     case ConditionEffect.StasisImmuneIndex:
                     case ConditionEffect.NinjaSpeedyIndex:
                     case ConditionEffect.UnstableIndex:
                     case ConditionEffect.DarknessIndex:
                     case ConditionEffect.PetrifyImmuneIndex:
                        _loc8_ = ConditionEffect.effects_[_loc7_];
                        break;
                     case ConditionEffect.SlowedIndex:
                        if(this.isSlowedImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.ArmorBrokenIndex:
                        if(this.isArmorBrokenImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.StunnedIndex:
                        if(this.isStunImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.DazedIndex:
                        if(this.isDazedImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.ParalyzedIndex:
                        if(this.isParalyzedImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.Petrify:
                        if(this.isPetrifyImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect.Curse:
                        if(this.isCurseImmune())
                        {
                           _loc9_ = new _13g(this,16711680,3000);
                           _loc9_.setStringBuilder(new _dU_().setParams(_1O_I_._01n));
                           map_.mapOverlay_.addStatusText(_loc9_);
                        }
                        else
                        {
                           _loc8_ = ConditionEffect.effects_[_loc7_];
                        }
                        break;
                     case ConditionEffect._1F_f:
                        _loc14_ = true;
                  }
                  if(_loc8_ != null)
                  {
                     if(_loc7_ < ConditionEffect.SecondOrderOffset)
                     {
                        if((this.condition_[ConditionEffect.FirstOrder] | _loc8_.bit_) == this.condition_[ConditionEffect.FirstOrder])
                        {
                           continue;
                        }
                        this.condition_[ConditionEffect.FirstOrder] = this.condition_[ConditionEffect.FirstOrder] | _loc8_.bit_;
                     }
                     else
                     {
                        if((this.condition_[ConditionEffect.SecondOrder] | _loc8_.bit_) == this.condition_[ConditionEffect.SecondOrder])
                        {
                           continue;
                        }
                        this.condition_[ConditionEffect.SecondOrder] = this.condition_[ConditionEffect.SecondOrder] | _loc8_.bit_;
                     }
                     _loc12_ = _loc8_.sbName_;
                     this._0we(_loc6_,_loc12_);
                     _loc6_ = _loc6_ + 500;
                  }
               }
            }
         }
         var _loc15_:Vector.<uint> = _1R_b._1y8(this.objectType_,this.texture_,this.props_.bloodProb_,this.props_.bloodColor);
         if(this.dying_)
         {
            map_.addObj(new ExplosionEffect(_loc15_,this.size_,30),x_,y_);
         }
         else if(param5 != null)
         {
            map_.addObj(new HitEffect(_loc15_,this.size_,10,param5.angle_,param5.projProps_.speed_),x_,y_);
         }
         else
         {
            map_.addObj(new ExplosionEffect(_loc15_,this.size_,10),x_,y_);
         }
         if(param2 > 0)
         {
            _loc13_ = this.isArmorBroken() || param5 != null && param5.projProps_.armorPiercing || _loc14_;
            this._0V_X_(param2,_loc13_);
         }
      }
      
      public function _0we(param1:int, param2:String) : void
      {
         var _loc3_:_13g = new _13g(this,16711680,3000,param1);
         _loc3_.setStringBuilder(new _dU_().setParams(param2));
         map_.mapOverlay_.addStatusText(_loc3_);
      }
      
      public function _08G_(param1:int, param2:String) : void
      {
         var _loc3_:_13g = new _13g(this,16711680,3000,param1);
         _loc3_.setStringBuilder(new SText("Pet " + param2));
         map_.mapOverlay_.addStatusText(_loc3_);
      }
      
      public function statusTextMod(param1:int, param2:Boolean) : void
      {
         var _loc3_:Boolean = Parameters.data_.STDamage;
         var _loc4_:Boolean = Parameters.data_.STHealth;
         var _loc5_:int = this.hp_ - param1;
         _loc5_ = _loc5_ < 0?0:int(_loc5_);
         var _loc6_:int = !!param2?9437439:16711680;
         _loc6_ = !!Parameters.data_.STColor?int(Character.green2red(this.hp_ / this.maxHp_ * 100)):int(_loc6_);
         var _loc7_:String = (!!_loc3_?"-" + param1 + (!!_loc4_?" [":""):"") + (!!_loc4_?_loc5_ + (!!_loc3_?"]":""):"");
         var _loc8_:_13g = new _13g(this,_loc6_,1000);
         _loc8_.setStringBuilder(new SText(_loc7_));
         map_.mapOverlay_.addStatusText(_loc8_);
      }
      
      public function _0V_X_(param1:int, param2:Boolean) : void
      {
         this.statusTextMod(param1,param2);
      }
      
      protected function makeNameBitmapData() : BitmapData
      {
         var _loc1_:_1eo = new SText(this.name_);
         var _loc2_:_0ke = GameContext.getInjector().getInstance(_0ke);
         return _loc2_.make(_loc1_,16,16777215,true,_0L_P_,true);
      }
      
      public function _1si(param1:Vector.<IGraphicsData>, param2:View) : void
      {
         if(this._11b == null)
         {
            this._11b = this.makeNameBitmapData();
            this._1L_P_ = new GraphicsBitmapFill(null,new Matrix(),false,false);
            this._1iI_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         }
         var _loc3_:int = this._11b.width / 2 + 1;
         var _loc4_:int = 30;
         var _loc5_:Vector.<Number> = this._1iI_.data;
         _loc5_.length = 0;
         _loc5_.push(_P_c[0] - _loc3_,_P_c[1],_P_c[0] + _loc3_,_P_c[1],_P_c[0] + _loc3_,_P_c[1] + _loc4_,_P_c[0] - _loc3_,_P_c[1] + _loc4_);
         this._1L_P_.bitmapData = this._11b;
         var _loc6_:Matrix = this._1L_P_.matrix;
         _loc6_.identity();
         _loc6_.translate(_loc5_[0],_loc5_[1]);
         param1.push(this._1L_P_);
         param1.push(this._1iI_);
         param1.push(GraphicHelper.END_FILL);
      }
      
      protected function getRandomCharBitmap() : BitmapData
      {
         if(this._1ek == null)
         {
            this._1ek = TextureLibrary.getBitmap("lofiChar8x8",int(Math.random() * 239));
         }
         return this._1ek;
      }
      
      protected function getTexture(param1:View, param2:int) : BitmapData
      {
         var _loc3_:Pet = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:_18Q_ = null;
         var _loc7_:int = 0;
         var _loc8_:BitmapData = null;
         var _loc9_:int = 0;
         var _loc10_:BitmapData = null;
         var _loc13_:BitmapData = null;
         if(this is Pet)
         {
            _loc3_ = Pet(this);
            if(this.condition_[ConditionEffect.FirstOrder] != 0 && !this.isPaused())
            {
               if(_loc3_._0yP_ != 32912)
               {
                  _loc3_._S_E_(32912);
               }
            }
            else if(!_loc3_._08X_)
            {
               _loc3_._gM_();
            }
         }
         var _loc11_:BitmapData = this.texture_;
         var _loc12_:int = this.size_;
         if(this._1vr != null)
         {
            _loc4_ = 0;
            _loc5_ = _Z_4._M_J_;
            if(param2 < this._0J_v + _1pY_)
            {
               if(!this.props_.dontFaceAttacks_)
               {
                  this._0v3 = this._1ct;
               }
               _loc4_ = (param2 - this._0J_v) % _1pY_ / _1pY_;
               _loc5_ = _Z_4._t4;
            }
            else if(this.moveVec_.x != 0 || this.moveVec_.y != 0)
            {
               _loc7_ = 0.5 / this.moveVec_.length;
               _loc7_ = _loc7_ + (400 - _loc7_ % 400);
               if(this.moveVec_.x > _1P_F_ || this.moveVec_.x < _ty || this.moveVec_.y > _1P_F_ || this.moveVec_.y < _ty)
               {
                  this._0v3 = Math.atan2(this.moveVec_.y,this.moveVec_.x);
                  _loc5_ = _Z_4._E_S_;
               }
               else
               {
                  _loc5_ = _Z_4._M_J_;
               }
               _loc4_ = param2 % _loc7_ / _loc7_;
            }
            _loc6_ = this._1vr.imageFromFacing(this._0v3,param1,_loc5_,_loc4_);
            _loc11_ = _loc6_.image_;
            _loc13_ = _loc6_.mask_;
         }
         else if(this._1s8 != null)
         {
            _loc8_ = this._1s8.getTexture(param2);
            if(_loc8_ != null)
            {
               _loc11_ = _loc8_;
            }
         }
         if(this.props_.drawOnGround_ || this._0oI_ != null)
         {
            return _loc11_;
         }
         if(param1.Hallucinating)
         {
            _loc9_ = _loc11_ == null?8:int(_loc11_.width);
            _loc11_ = this.getRandomCharBitmap();
            _loc13_ = null;
            _loc12_ = this.size_ * Math.min(1.5,_loc9_ / _loc11_.width);
         }
         if(this.isCurse() && !(this is Pet))
         {
            _loc11_ = _1eD_._1L_(_loc11_,_10c);
         }
         if((this.isStasis() || this.isPetrify()) && !(this is Pet))
         {
            _loc11_ = _1eD_._1L_(_loc11_,_y1);
         }
         if(this.tex1Id_ == 0 && this.tex2Id_ == 0)
         {
            _loc11_ = TextureRedrawer.redraw(_loc11_,_loc12_,false,0);
         }
         else
         {
            _loc10_ = null;
            if(this._1zo == null)
            {
               this._1zo = new Dictionary();
            }
            else
            {
               _loc10_ = this._1zo[_loc11_];
            }
            if(_loc10_ == null)
            {
               _loc10_ = TextureRedrawer.resize(_loc11_,_loc13_,_loc12_,false,this.tex1Id_,this.tex2Id_);
               _loc10_ = _0R_c._1iY_(_loc10_,0);
               this._1zo[_loc11_] = _loc10_;
            }
            _loc11_ = _loc10_;
         }
         if(this.isInvisible() && !(this is Player))
         {
            _loc11_ = _1eD_._0X_O_(_loc11_,0.7);
         }
         return _loc11_;
      }
      
      public function _1U_f(param1:String, param2:int) : void
      {
         this.texture_ = TextureLibrary.getBitmap(param1,param2);
         this._0ix = this.texture_.height / 8;
      }
      
      public function getPortrait() : BitmapData
      {
         var _loc1_:BitmapData = null;
         var _loc2_:int = 0;
         if(this._0P_q == null)
         {
            _loc1_ = this.props_.portrait_ != null?this.props_.portrait_.getTexture():this.texture_;
            _loc2_ = 4 / _loc1_.width * 100;
            this._0P_q = TextureRedrawer.resize(_loc1_,this.mask_,_loc2_,true,this.tex1Id_,this.tex2Id_);
            this._0P_q = _0R_c._1iY_(this._0P_q,0);
         }
         return this._0P_q;
      }
      
      public function setAttack(param1:int, param2:Number) : void
      {
         this._1ct = param2;
         this._0J_v = getTimer();
      }
      
      override public function draw3d(param1:Vector.<Object3D>) : void
      {
         if(this._f9 != null)
         {
            param1.push(this._f9);
         }
      }
      
      protected function _0se(param1:Vector.<IGraphicsData>, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this._qK_ == null)
         {
            this._0kP_ = new GraphicsSolidFill();
            this._1U_W_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
            this._n__ = new GraphicsSolidFill(1113856);
            this._qK_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         }
         var _loc5_:Number = this.maxHp_;
         if(this.hp_ <= _loc5_)
         {
            _loc3_ = (_loc5_ - this.hp_) / _loc5_;
            this._0kP_.color = MoreColorUtil._J_A_(5526612,16711680,Math.abs(Math.sin(param2 / 300)) * _loc3_);
         }
         else
         {
            this._0kP_.color = 5526612;
         }
         var _loc6_:int = 20;
         var _loc7_:int = 4;
         var _loc8_:int = 6;
         this._1U_W_.data.length = 0;
         this._1U_W_.data.push(_P_c[0] - _loc6_,_P_c[1] + _loc7_,_P_c[0] + _loc6_,_P_c[1] + _loc7_,_P_c[0] + _loc6_,_P_c[1] + _loc7_ + _loc8_,_P_c[0] - _loc6_,_P_c[1] + _loc7_ + _loc8_);
         param1.push(this._0kP_);
         param1.push(this._1U_W_);
         param1.push(GraphicHelper.END_FILL);
         if(this.hp_ > 0)
         {
            _loc4_ = this.hp_ / this.maxHp_ * 2 * _loc6_;
            this._qK_.data.length = 0;
            this._qK_.data.push(_P_c[0] - _loc6_,_P_c[1] + _loc7_,_P_c[0] - _loc6_ + _loc4_,_P_c[1] + _loc7_,_P_c[0] - _loc6_ + _loc4_,_P_c[1] + _loc7_ + _loc8_,_P_c[0] - _loc6_,_P_c[1] + _loc7_ + _loc8_);
            param1.push(this._n__);
            param1.push(this._qK_);
            param1.push(GraphicHelper.END_FILL);
         }
         HWAccelerate.addSolidFill(this._n__,true);
         HWAccelerate.addSolidFill(this._0kP_,true);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = this.getTexture(param2,param3);
         if(this.props_.drawOnGround_)
         {
            if(square_.faces_.length == 0)
            {
               return;
            }
            this.path_.data = square_.faces_[0].face_.vout_;
            this.bitmapFill_.bitmapData = _loc5_;
            square_.baseTexMatrix_.calculateTextureMatrix(this.path_.data);
            this.bitmapFill_.matrix = square_.baseTexMatrix_.tToS_;
            param1.push(this.bitmapFill_);
            param1.push(this.path_);
            param1.push(GraphicHelper.END_FILL);
            return;
         }
         if(this._0oI_ != null && !Parameters.hwAccel())
         {
            this._0oI_.draw(param1,param2,this.props_.color_,_loc5_);
            return;
         }
         if(this._0oI_ != null && Parameters.hwAccel())
         {
            param1.push(null);
            return;
         }
         var _loc6_:int = _loc5_.width;
         var _loc7_:int = _loc5_.height;
         var _loc8_:int = square_.sink_ + this.sinkOffset_;
         if(_loc8_ > 0 && (this.flying_ || square_.obj_ != null && square_.obj_.props_.protectFromSink_))
         {
            _loc8_ = 0;
         }
         if(Parameters.hwAccel())
         {
            if(_loc8_ != 0)
            {
               HWAccelerate._r9(this.bitmapFill_,Math.max(_loc8_ / _loc7_ * 1.65 - 0.02,0));
               _loc8_ = -_loc8_ + 0.02;
            }
            else if(_loc8_ == 0 && HWAccelerate._ad(this.bitmapFill_) != 0)
            {
               HWAccelerate._1F_r(this.bitmapFill_);
            }
         }
         this.vS_.length = 0;
         this.vS_.push(_P_c[3] - _loc6_ / 2,_P_c[4] - _loc7_ + _loc8_,_P_c[3] + _loc6_ / 2,_P_c[4] - _loc7_ + _loc8_,_P_c[3] + _loc6_ / 2,_P_c[4],_P_c[3] - _loc6_ / 2,_P_c[4]);
         this.path_.data = this.vS_;
         if(this._1bO_ != null)
         {
            if(!this._1bO_._1C_L_(param3))
            {
               if(Parameters.hwAccel())
               {
                  this._1bO_._uM_(_loc5_,param3);
               }
               else
               {
                  _loc5_ = this._1bO_.apply(_loc5_,param3);
               }
            }
            else
            {
               this._1bO_ = null;
            }
         }
         if(this._1A_R_ && !this._1vU_)
         {
            if(Parameters.hwAccel())
            {
               HWAccelerate._Q_T_(_loc5_,new ColorTransform(-1,-1,-1,1,255,255,255,0));
            }
            else
            {
               _loc4_ = _loc5_.clone();
               _loc4_.colorTransform(_loc4_.rect,new ColorTransform(-1,-1,-1,1,255,255,255,0));
               _loc4_ = _1eD_._1L_(_loc4_,new ColorMatrixFilter(MoreColorUtil._iz));
               _loc5_ = _loc4_;
            }
            this._1vU_ = true;
         }
         if(this._K_k && !this._0gA_)
         {
            if(Parameters.hwAccel())
            {
               HWAccelerate._Q_T_(_loc5_,new ColorTransform(1,1,1,1,255,255,255,0));
            }
            else
            {
               _loc4_ = _loc5_.clone();
               _loc4_.colorTransform(_loc4_.rect,new ColorTransform(1,1,1,1,255,255,255,0));
               _loc5_ = _loc4_;
            }
            this._0gA_ = true;
         }
         this.bitmapFill_.bitmapData = _loc5_;
         this._1T_f.identity();
         this._1T_f.translate(this.vS_[0],this.vS_[1]);
         this.bitmapFill_.matrix = this._1T_f;
         param1.push(this.bitmapFill_);
         param1.push(this.path_);
         param1.push(GraphicHelper.END_FILL);
         if(!this.isPaused() && (this.condition_[ConditionEffect.FirstOrder] || this.condition_[ConditionEffect.SecondOrder]) && !Parameters.HideHud && !(this is Pet))
         {
            this._kH_(param1,param2,param3);
         }
         if(this.props_.showName_ && this.name_ != null && this.name_.length != 0)
         {
            this._1si(param1,param2);
         }
      }
      
      public function _kH_(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:GraphicsBitmapFill = null;
         var _loc6_:GraphicsPath = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Matrix = null;
         var _loc14_:int = 0;
         if(this.condEffectIcons == null)
         {
            this.condEffectIcons = new Vector.<BitmapData>();
            this._9j = new Vector.<GraphicsBitmapFill>();
            this._s = new Vector.<GraphicsPath>();
         }
         this.condEffectIcons.length = 0;
         var _loc10_:int = param3 / 500;
         ConditionEffect.getConditionEffectIcons(this.condition_[ConditionEffect.FirstOrder],this.condEffectIcons,_loc10_);
         ConditionEffect.getConditionEffectIcons2(this.condition_[ConditionEffect.SecondOrder],this.condEffectIcons,_loc10_);
         var _loc11_:Number = _P_c[3];
         var _loc12_:Number = this.vS_[1];
         var _loc13_:int = this.condEffectIcons.length;
         while(_loc14_ < _loc13_)
         {
            _loc4_ = this.condEffectIcons[_loc14_];
            if(_loc14_ >= this._9j.length)
            {
               this._9j.push(new GraphicsBitmapFill(null,new Matrix(),false,false));
               this._s.push(new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>()));
            }
            _loc5_ = this._9j[_loc14_];
            _loc6_ = this._s[_loc14_];
            _loc5_.bitmapData = _loc4_;
            _loc7_ = _loc11_ - _loc4_.width * _loc13_ / 2 + _loc14_ * _loc4_.width;
            _loc8_ = _loc12_ - _loc4_.height / 2;
            _loc6_.data.length = 0;
            _loc6_.data.push(_loc7_,_loc8_,_loc7_ + _loc4_.width,_loc8_,_loc7_ + _loc4_.width,_loc8_ + _loc4_.height,_loc7_,_loc8_ + _loc4_.height);
            _loc9_ = _loc5_.matrix;
            _loc9_.identity();
            _loc9_.translate(_loc7_,_loc8_);
            param1.push(_loc5_);
            param1.push(_loc6_);
            param1.push(GraphicHelper.END_FILL);
            _loc14_++;
         }
      }
      
      override public function drawShadow(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         if(this._yH_ == null)
         {
            this._yH_ = new GraphicsGradientFill(GradientType.RADIAL,[this.props_.shadowColor_,this.props_.shadowColor_],[0.5,0],null,new Matrix());
            this._0I_B_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         }
         var _loc4_:Number = this.size_ / 100 * (this.props_.shadowSize_ / 100) * this._0ix;
         var _loc5_:Number = 30 * _loc4_;
         var _loc6_:Number = 15 * _loc4_;
         this._yH_.matrix.createGradientBox(_loc5_ * 2,_loc6_ * 2,0,_P_c[0] - _loc5_,_P_c[1] - _loc6_);
         param1.push(this._yH_);
         this._0I_B_.data.length = 0;
         this._0I_B_.data.push(_P_c[0] - _loc5_,_P_c[1] - _loc6_,_P_c[0] + _loc5_,_P_c[1] - _loc6_,_P_c[0] + _loc5_,_P_c[1] + _loc6_,_P_c[0] - _loc5_,_P_c[1] + _loc6_);
         param1.push(this._0I_B_);
         param1.push(GraphicHelper.END_FILL);
      }
      
      public function toString() : String
      {
         return "[" + getQualifiedClassName(this) + " id: " + objectId_ + " type: " + ObjectLibrary._O_S_[this.objectType_] + " pos: " + x_ + ", " + y_ + "]";
      }
   }
}
