package com.company.assembleegameclient.objects
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.engine3d._1J_M_;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.display.GraphicsGradientFill;
   import flash.display.GraphicsPath;
   import com.company.util.Trig;
   import com.company.assembleegameclient.map.Map;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.map.Square;
   import com.company.assembleegameclient.util._1C_q;
   import com.company.assembleegameclient.util._1R_b;
   import _0x1.HitEffect;
   import com.company.assembleegameclient.tutorial.doneAction;
   import com.company.assembleegameclient.tutorial.Tutorial;
   import com.company.assembleegameclient.util.ConditionEffect;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0x1._O_y;
   import com.company.assembleegameclient.util._0xp;
   import com.company.util.GraphicHelper;
   import flash.display.GradientType;
   import flash.geom.Matrix;
   
   public class Projectile extends BasicObject
   {
      
      private static var _0R_J_:Dictionary = new Dictionary();
       
      
      public var props_:com.company.assembleegameclient.objects.ObjectProperties;
      
      public var _0uN_:com.company.assembleegameclient.objects.ObjectProperties;
      
      public var projProps_:com.company.assembleegameclient.objects.ProjectileProperties;
      
      public var texture_:BitmapData;
      
      public var bulletId_:uint;
      
      public var ownerId_:int;
      
      public var containerType_:int;
      
      public var bulletType_:uint;
      
      public var allyOwnedProj:Boolean;
      
      public var enemyOwnedProj:Boolean;
      
      public var damage_:int;
      
      public var _1uT_:String;
      
      public var startingX:Number;
      
      public var startingY:Number;
      
      public var startTime_:int;
      
      public var angle_:Number = 0;
      
      public var _78:Dictionary;
      
      public var _1F_P_:_1J_M_;
      
      private var _position:Point;
      
      private var _0O_0:Vector3D;
      
      protected var _yH_:GraphicsGradientFill;
      
      protected var _0I_B_:GraphicsPath;
      
      public function Projectile()
      {
         this._1F_P_ = new _1J_M_(100);
         this._position = new Point();
         this._0O_0 = new Vector3D();
         this._yH_ = new GraphicsGradientFill(GradientType.RADIAL,[0,0],[0.5,0],null,new Matrix());
         this._0I_B_ = new GraphicsPath(GraphicHelper.RECT_PATH_COMMANDS,new Vector.<Number>());
         super();
      }
      
      public static function _0B_F_(param1:int, param2:uint) : int
      {
         return _0R_J_[param2 << 24 | param1];
      }
      
      public static function _1fP_(param1:int, param2:uint) : int
      {
         var _loc3_:int = _03v();
         _0R_J_[param2 << 24 | param1] = _loc3_;
         return _loc3_;
      }
      
      public static function _0F_Y_(param1:int, param2:uint) : void
      {
         delete _0R_J_[param2 << 24 | param1];
      }
      
      public static function dispose() : void
      {
         _0R_J_ = new Dictionary();
      }
      
      public function reset(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:int, param7:String = "", param8:String = "") : void
      {
         var _loc9_:Number = NaN;
         clear();
         this.containerType_ = param1;
         this.bulletType_ = param2;
         this.ownerId_ = param3;
         this.bulletId_ = param4;
         this.angle_ = Trig._D___(param5);
         this.startTime_ = param6;
         objectId_ = _1fP_(this.ownerId_,this.bulletId_);
         z_ = 0.5;
         this._0uN_ = ObjectLibrary._01A_[this.containerType_];
         this.projProps_ = this._0uN_._0hB_[param2];
         var _loc10_:String = param7 != "" && this.projProps_.objectId_ == param8?param7:this.projProps_.objectId_;
         this.props_ = ObjectLibrary._1pW_(_loc10_);
         hasShadow = this.props_.shadowSize_ > 0;
         var _loc11_:_sV_ = ObjectLibrary._1eh[this.props_.type_];
         this.texture_ = _loc11_.getTexture(objectId_);
         this.enemyOwnedProj = this._0uN_.isEnemy_;
         this.allyOwnedProj = !this.enemyOwnedProj;
         this._1uT_ = this._0uN_.oldSound_;
         this._78 = !!this.projProps_.multiHit_?new Dictionary():null;
         if(this.projProps_.size_ >= 0)
         {
            _loc9_ = this.projProps_.size_;
         }
         else
         {
            _loc9_ = ObjectLibrary._0ye(this.containerType_);
         }
         this._1F_P_.setSize(8 * (_loc9_ / 100));
         this.damage_ = 0;
      }
      
      public function _0jS_(param1:int) : void
      {
         this.damage_ = param1;
      }
      
      override public function addTo(param1:Map, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:Player = null;
         this.startingX = param2;
         this.startingY = param3;
         if(!super.addTo(param1,param2,param3))
         {
            return false;
         }
         if(!this._0uN_.flying_ && square_.sink_)
         {
            z_ = 0.1;
         }
         else
         {
            _loc4_ = param1.goDict_[this.ownerId_] as Player;
            if(_loc4_ != null && _loc4_.sinkOffset_ > 0)
            {
               z_ = 0.5 - 0.4 * (_loc4_.sinkOffset_ / Parameters._18x);
            }
         }
         return true;
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
         square_ = _loc3_;
         return true;
      }
      
      override public function removeFromMap() : void
      {
         super.removeFromMap();
         _0F_Y_(this.ownerId_,this.bulletId_);
         this._78 = null;
         _1C_q._4B_(this);
      }
      
      private function updatePos(param1:int, param2:Point) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         param2.x = this.startingX;
         param2.y = this.startingY;
         var _loc5_:Number = param1 * this.projProps_.speed_ / 10000;
         var _loc6_:Number = this.bulletId_ % 2 == 0?Number(0):Number(Math.PI);
         if(this.projProps_.wavy_)
         {
            _loc7_ = 6 * Math.PI;
            _loc8_ = Math.PI / 64;
            _loc9_ = this.angle_ + _loc8_ * Math.sin(_loc6_ + _loc7_ * param1 / 1000);
            param2.x = param2.x + _loc5_ * Math.cos(_loc9_);
            param2.y = param2.y + _loc5_ * Math.sin(_loc9_);
            return;
         }
         if(this.projProps_.parametric_)
         {
            _loc10_ = param1 / this.projProps_.lifetime_ * 2 * Math.PI;
            _loc11_ = Math.sin(_loc10_) * (!!(this.bulletId_ % 2)?1:-1);
            _loc12_ = Math.sin(2 * _loc10_) * (this.bulletId_ % 4 < 2?1:-1);
            _loc13_ = Math.sin(this.angle_);
            _loc14_ = Math.cos(this.angle_);
            param2.x = param2.x + (_loc11_ * _loc14_ - _loc12_ * _loc13_) * this.projProps_.magnitude_;
            param2.y = param2.y + (_loc11_ * _loc13_ + _loc12_ * _loc14_) * this.projProps_.magnitude_;
            return;
         }
         if(this.projProps_.boomerang_)
         {
            _loc3_ = this.projProps_.lifetime_ * this.projProps_.speed_ / 10000 / 2;
            if(_loc5_ > _loc3_)
            {
               _loc5_ = _loc3_ - (_loc5_ - _loc3_);
            }
         }
         param2.x = param2.x + _loc5_ * Math.cos(this.angle_);
         param2.y = param2.y + _loc5_ * Math.sin(this.angle_);
         if(this.projProps_.amtitude_ != 0)
         {
            _loc4_ = this.projProps_.amtitude_ * Math.sin(_loc6_ + param1 / this.projProps_.lifetime_ * this.projProps_.frequency_ * 2 * Math.PI);
            param2.x = param2.x + _loc4_ * Math.cos(this.angle_ + Math.PI / 2);
            param2.y = param2.y + _loc4_ * Math.sin(this.angle_ + Math.PI / 2);
         }
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Vector.<uint> = null;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc4_:int = param1 - this.startTime_;
         if(_loc4_ > this.projProps_.lifetime_)
         {
            return false;
         }
         var _loc5_:Point = this._position;
         this.updatePos(_loc4_,_loc5_);
         if(!this.moveTo(_loc5_.x,_loc5_.y) || square_.tileType_ == 65535)
         {
            if(this.enemyOwnedProj)
            {
               map_.gs_.gsc_.squareHit(param1,this.bulletId_,this.ownerId_);
            }
            else if(square_.obj_ != null)
            {
               _loc3_ = _1R_b._1B_O_(this.texture_);
               map_.addObj(new HitEffect(_loc3_,100,3,this.angle_,this.projProps_.speed_),_loc5_.x,_loc5_.y);
            }
            return false;
         }
         if(square_.obj_ != null && (!square_.obj_.props_.isEnemy_ || !this.allyOwnedProj) && (square_.obj_.props_.enemyOccupySquare_ || !this.projProps_.passesCover_ && square_.obj_.props_.occupySquare_))
         {
            if(this.enemyOwnedProj)
            {
               map_.gs_.gsc_.otherHit(param1,this.bulletId_,this.ownerId_,square_.obj_.objectId_);
            }
            else
            {
               _loc3_ = _1R_b._1B_O_(this.texture_);
               map_.addObj(new HitEffect(_loc3_,100,3,this.angle_,this.projProps_.speed_),_loc5_.x,_loc5_.y);
            }
            return false;
         }
         var _loc6_:Player = map_.player_;
         if(_loc6_ != null && _loc6_.isHidden() && this.ownerId_ == _loc6_.objectId_)
         {
            return true;
         }
         var _loc7_:GameObject = this.checkForCollision(_loc5_.x,_loc5_.y);
         if(_loc7_ != null)
         {
            _loc8_ = _loc7_.props_.isEnemy_;
            if(_loc6_ != null && !_loc6_.isPaused() && (this.enemyOwnedProj || _loc8_ && this.ownerId_ == _loc6_.objectId_))
            {
               _loc9_ = GameObject.GetDamage(this.damage_,_loc7_.defense_,this.projProps_.armorPiercing,_loc7_.condition_);
               _loc10_ = false;
               if(_loc7_.hp_ <= _loc9_)
               {
                  _loc10_ = true;
                  if(_loc7_.props_.isEnemy_)
                  {
                     doneAction(map_.gs_,Tutorial._T_O_);
                  }
               }
               if(_loc7_ == _loc6_)
               {
                  map_.gs_.gsc_.playerHit(this.bulletId_,this.ownerId_);
                  _loc7_.damage(this.containerType_,_loc9_,this.projProps_.effects_,false,this);
               }
               else if(_loc7_.props_.isEnemy_)
               {
                  map_.gs_.gsc_.enemyHit(param1,this.bulletId_,_loc7_.objectId_,_loc10_);
                  _loc7_.damage(this.containerType_,_loc9_,this.projProps_.effects_,_loc10_,this);
               }
               else if(!this.projProps_.multiHit_)
               {
                  map_.gs_.gsc_.otherHit(param1,this.bulletId_,this.ownerId_,_loc7_.objectId_);
               }
            }
            if(this.projProps_.multiHit_)
            {
               this._78[_loc7_] = true;
            }
            else
            {
               return false;
            }
         }
         return true;
      }
      
      public function checkForCollision(param1:Number, param2:Number) : GameObject
      {
         var _loc4_:GameObject = null;
         var _loc5_:GameObject = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc3_:Number = Number.MAX_VALUE;
         for each(_loc5_ in map_.visibleHitObjs)
         {
            if(!((_loc6_ = Math.abs(_loc5_.x_ - param1)) > _loc5_.radius_ || (_loc7_ = Math.abs(_loc5_.y_ - param2)) > _loc5_.radius_ || _loc5_.dying_ || _loc5_.condition_[ConditionEffect.FirstOrder] & ConditionEffect.IgnoreProjEffect || map_.goDict_[_loc5_.objectId_] == null))
            {
               if(this.enemyOwnedProj && _loc5_.props_.isPlayer_ || this.allyOwnedProj && _loc5_.props_.isEnemy_)
               {
                  if(!this.projProps_.multiHit_ || this._78[_loc5_] == null)
                  {
                     if(_loc5_ == map_.player_)
                     {
                        return _loc5_;
                     }
                     _loc8_ = _loc6_ * _loc6_ + _loc7_ * _loc7_;
                     if(_loc8_ < _loc3_)
                     {
                        _loc3_ = _loc8_;
                        _loc4_ = _loc5_;
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         if(!Parameters.data_.allyProjectiles && this.allyOwnedProj && this.ownerId_ != map_.player_.objectId_)
         {
            return;
         }
         if(!Parameters._xI_)
         {
            return;
         }
         var _loc6_:BitmapData = this.texture_;
         if(Parameters._191 != 0)
         {
            switch(Parameters._191)
            {
               case 1:
                  _loc4_ = 16777100;
                  _loc5_ = 16777215;
                  break;
               case 2:
                  _loc4_ = 16777100;
                  _loc5_ = 16777100;
                  break;
               case 3:
                  _loc4_ = 16711680;
                  _loc5_ = 16711680;
                  break;
               case 4:
                  _loc4_ = 255;
                  _loc5_ = 255;
                  break;
               case 5:
                  _loc4_ = 16777215;
                  _loc5_ = 16777215;
                  break;
               case 6:
                  _loc4_ = 0;
                  _loc5_ = 0;
            }
            _loc6_ = TextureRedrawer.redraw(_loc6_,120,true,_loc5_);
         }
         var _loc7_:Number = this.props_.rotation_ == 0?Number(0):Number(param3 / this.props_.rotation_);
         this._0O_0.x = x_;
         this._0O_0.y = y_;
         this._0O_0.z = z_;
         this._1F_P_.draw(param1,this._0O_0,this.angle_ - param2.angleRad_ + this.props_.angleCorrection_ + _loc7_,param2.wToS_,param2,_loc6_);
         if(this.projProps_.particleTrail_)
         {
            map_.addObj(new _O_y(100,this.projProps_.particleTrailColor_,600,0.5,_0xp._0__x(3),_0xp._0__x(3)),x_,y_);
            map_.addObj(new _O_y(100,this.projProps_.particleTrailColor_,600,0.5,_0xp._0__x(3),_0xp._0__x(3)),x_,y_);
            map_.addObj(new _O_y(100,this.projProps_.particleTrailColor_,600,0.5,_0xp._0__x(3),_0xp._0__x(3)),x_,y_);
         }
      }
      
      override public function drawShadow(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         if(!Parameters.data_.allyProjectiles && this.allyOwnedProj && this.ownerId_ != map_.player_.objectId_)
         {
            return;
         }
         if(!Parameters._xI_)
         {
            return;
         }
         var _loc4_:Number = this.props_.shadowSize_ / 400;
         var _loc5_:Number = 30 * _loc4_;
         var _loc6_:Number = 15 * _loc4_;
         this._yH_.matrix.createGradientBox(_loc5_ * 2,_loc6_ * 2,0,_P_c[0] - _loc5_,_P_c[1] - _loc6_);
         param1.push(this._yH_);
         this._0I_B_.data.length = 0;
         Vector.<Number>(this._0I_B_.data).push(_P_c[0] - _loc5_,_P_c[1] - _loc6_,_P_c[0] + _loc5_,_P_c[1] - _loc6_,_P_c[0] + _loc5_,_P_c[1] + _loc6_,_P_c[0] - _loc5_,_P_c[1] + _loc6_);
         param1.push(this._0I_B_);
         param1.push(GraphicHelper.END_FILL);
      }
   }
}
