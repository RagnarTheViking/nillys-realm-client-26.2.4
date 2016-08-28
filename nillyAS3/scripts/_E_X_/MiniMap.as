package _E_X_
{
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import ToolTips._1D_l;
   import _Y_M_._02U_;
   import flash.geom.Matrix;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.map._76;
   import com.company.util.TextureLibrary;
   import flash.geom.ColorTransform;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.company.assembleegameclient.map.GroundLibrary;
   import flash.display.Graphics;
   import com.company.util.PointUtil;
   import com.company.assembleegameclient.objects.Character;
   import com.company.assembleegameclient.objects.Portal;
   import com.company.assembleegameclient.objects.GuildHallPortal;
   import com.company.util._t__;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class MiniMap extends _0I_Y_
   {
      
      public static const _0M___:int = 5 * 5;
      
      private static var _1D_K_:Dictionary = new Dictionary();
       
      
      public var _1Y_4:int;
      
      public var _height:int;
      
      public var _0oh:int = 0;
      
      public var _05:Rectangle;
      
      public var active:Boolean = true;
      
      public var _1U_R_:Point;
      
      public var _P_l:BitmapData;
      
      public var _T_h:Vector.<Number>;
      
      public var _cb:BitmapData;
      
      public var _zd:Shape;
      
      public var _P_V_:Shape;
      
      private var focus:GameObject;
      
      private var _1C_W_:_E_X_._oW_;
      
      private var _vi:Boolean = false;
      
      private var tooltip:_1D_l = null;
      
      private var menu:_02U_ = null;
      
      private var _0aV_:Matrix;
      
      private var _H_W_:Matrix;
      
      private var _06v:Vector.<Player>;
      
      private var _hg:Point;
      
      public function MiniMap(param1:int, param2:int)
      {
         this._T_h = new Vector.<Number>();
         this._0aV_ = new Matrix();
         this._H_W_ = new Matrix();
         this._06v = new Vector.<Player>();
         this._hg = new Point();
         super();
         this._1Y_4 = param1;
         this._height = param2;
         this._1T_F_();
         this._1f1();
      }
      
      public static function _1P_v(param1:GameObject) : uint
      {
         var _loc2_:* = param1.objectType_;
         if(!_1D_K_.hasOwnProperty(_loc2_))
         {
            _1D_K_[_loc2_] = param1.getColor();
         }
         return _1D_K_[_loc2_];
      }
      
      override public function setMap(param1:_76) : void
      {
         this.map = param1;
         this._0Q_O_();
      }
      
      override public function setFocus(param1:GameObject) : void
      {
         this.focus = param1;
      }
      
      private function _0Q_O_() : void
      {
         this._05 = new Rectangle(-this._1Y_4 / 2,-this._height / 2,this._1Y_4,this._height);
         this._1U_R_ = new Point(map.width_,map.height_);
         this._P_l = new _1wr(this._1U_R_.x,this._1U_R_.y,false,0);
         var _loc1_:Number = Math.max(this._1Y_4 / this._1U_R_.x,this._height / this._1U_R_.y);
         var _loc2_:Number = 4;
         while(_loc2_ > _loc1_)
         {
            this._T_h.push(_loc2_);
            _loc2_ = _loc2_ / 2;
         }
         this._T_h.push(_loc1_);
         this._1C_W_ && this._1C_W_._M_A_(this._T_h.length);
      }
      
      private function _1T_F_() : void
      {
         this._cb = TextureLibrary.getBitmap("lofiInterface",54).clone();
         this._cb.colorTransform(this._cb.rect,new ColorTransform(0,0,1));
         graphics.clear();
         graphics.beginFill(1776411);
         graphics.drawRect(0,0,this._1Y_4,this._height);
         graphics.endFill();
         this._zd = new Shape();
         this._zd.x = this._1Y_4 / 2;
         this._zd.y = this._height / 2;
         addChild(this._zd);
         this._P_V_ = new Shape();
         this._P_V_.x = this._1Y_4 / 2;
         this._P_V_.y = this._height / 2;
         addChild(this._P_V_);
         this._1C_W_ = new _E_X_._oW_();
         this._1C_W_.x = this._1Y_4 - 20;
         this._1C_W_._ah.add(this._0Z_p);
         this._1C_W_._M_A_(this._T_h.length);
         addChild(this._1C_W_);
      }
      
      private function _1f1() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.CLICK,this._8P_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.active = false;
         this._wS_();
      }
      
      public function dispose() : void
      {
         this._P_l.dispose();
         this._P_l = null;
         this._wS_();
      }
      
      private function _0Z_p(param1:int) : void
      {
         this._0oh = param1;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._vi = true;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._vi = false;
      }
      
      private function _8P_(param1:MouseEvent) : void
      {
         if(this.tooltip == null || this.tooltip.parent == null || this.tooltip._06v == null || this.tooltip._06v.length == 0)
         {
            return;
         }
         this._4q();
         this._1J_Z_();
         this._O_t();
      }
      
      private function _1J_Z_() : void
      {
         this.menu = new _02U_(map,this.tooltip._06v);
         this.menu.x = this.tooltip.x + 12;
         this.menu.y = this.tooltip.y;
         _pn.addChild(this.menu);
      }
      
      override public function setGroundTile(param1:int, param2:int, param3:uint) : void
      {
         var _loc4_:uint = GroundLibrary.getColor(param3);
         this._P_l.setPixel(param1,param2,_loc4_);
      }
      
      override public function setGameObjectTile(param1:int, param2:int, param3:GameObject) : void
      {
         var _loc4_:uint = _1P_v(param3);
         this._P_l.setPixel(param1,param2,_loc4_);
      }
      
      private function _wS_() : void
      {
         this._O_t();
         this._4q();
      }
      
      private function _O_t() : void
      {
         if(this.tooltip != null)
         {
            if(this.tooltip.parent != null)
            {
               this.tooltip.parent.removeChild(this.tooltip);
            }
            this.tooltip = null;
         }
      }
      
      private function _4q() : void
      {
         if(this.menu != null)
         {
            if(this.menu.parent != null)
            {
               this.menu.parent.removeChild(this.menu);
            }
            this.menu = null;
         }
      }
      
      override public function draw() : void
      {
         var _loc1_:Graphics = null;
         var _loc2_:GameObject = null;
         var _loc3_:uint = 0;
         var _loc4_:Player = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         this._zd.graphics.clear();
         this._P_V_.graphics.clear();
         if(!this.focus)
         {
            return;
         }
         if(!this.active)
         {
            return;
         }
         var _loc10_:Number = this._T_h[this._0oh];
         this._0aV_.identity();
         this._0aV_.translate(-this.focus.x_,-this.focus.y_);
         this._0aV_.scale(_loc10_,_loc10_);
         var _loc11_:Point = this._0aV_.transformPoint(PointUtil._17Q_);
         var _loc12_:Point = this._0aV_.transformPoint(this._1U_R_);
         var _loc13_:Number = 0;
         if(_loc11_.x > this._05.left)
         {
            _loc13_ = this._05.left - _loc11_.x;
         }
         else if(_loc12_.x < this._05.right)
         {
            _loc13_ = this._05.right - _loc12_.x;
         }
         var _loc14_:Number = 0;
         if(_loc11_.y > this._05.top)
         {
            _loc14_ = this._05.top - _loc11_.y;
         }
         else if(_loc12_.y < this._05.bottom)
         {
            _loc14_ = this._05.bottom - _loc12_.y;
         }
         this._0aV_.translate(_loc13_,_loc14_);
         _loc11_ = this._0aV_.transformPoint(PointUtil._17Q_);
         var _loc15_:Rectangle = new Rectangle();
         _loc15_.x = Math.max(this._05.x,_loc11_.x);
         _loc15_.y = Math.max(this._05.y,_loc11_.y);
         _loc15_.right = Math.min(this._05.right,_loc11_.x + this._1U_R_.x * _loc10_);
         _loc15_.bottom = Math.min(this._05.bottom,_loc11_.y + this._1U_R_.y * _loc10_);
         _loc1_ = this._zd.graphics;
         _loc1_.beginBitmapFill(this._P_l,this._0aV_,false);
         _loc1_.drawRect(_loc15_.x,_loc15_.y,_loc15_.width,_loc15_.height);
         _loc1_.endFill();
         _loc1_ = this._P_V_.graphics;
         var _loc16_:Number = mouseX - this._1Y_4 / 2;
         var _loc17_:Number = mouseY - this._height / 2;
         this._06v.length = 0;
         for each(_loc2_ in map.goDict_)
         {
            if(!(_loc2_.props_.noMiniMap_ || _loc2_ == this.focus))
            {
               _loc4_ = _loc2_ as Player;
               if(_loc4_ != null)
               {
                  if(_loc4_.isPaused())
                  {
                     _loc3_ = 8355711;
                  }
                  else if(_loc4_.rank_ >= 100)
                  {
                     _loc3_ = 16777215;
                  }
                  else if(_loc4_.rank_ >= 90)
                  {
                     _loc3_ = 0;
                  }
                  else if(_loc4_.rank_ >= 80)
                  {
                     _loc3_ = 16737792;
                  }
                  else if(_loc4_._0xU_)
                  {
                     _loc3_ = 65280;
                  }
                  else
                  {
                     _loc3_ = 16776960;
                  }
               }
               else if(_loc2_ is Character)
               {
                  if(_loc2_.props_.isEnemy_)
                  {
                     _loc3_ = 16711680;
                  }
                  else
                  {
                     _loc3_ = _1P_v(_loc2_);
                  }
               }
               else if(_loc2_ is Portal || _loc2_ is GuildHallPortal)
               {
                  _loc3_ = 255;
               }
               else
               {
                  continue;
               }
               _loc5_ = this._0aV_.a * _loc2_.x_ + this._0aV_.c * _loc2_.y_ + this._0aV_.tx;
               _loc6_ = this._0aV_.b * _loc2_.x_ + this._0aV_.d * _loc2_.y_ + this._0aV_.ty;
               if(_loc5_ <= -this._1Y_4 / 2 || _loc5_ >= this._1Y_4 / 2 || _loc6_ <= -this._height / 2 || _loc6_ >= this._height / 2)
               {
                  _t__._1ux(this._05,0,0,_loc5_,_loc6_,this._hg);
                  _loc5_ = this._hg.x;
                  _loc6_ = this._hg.y;
               }
               if(_loc4_ != null && this._vi && (this.menu == null || this.menu.parent == null))
               {
                  _loc7_ = _loc16_ - _loc5_;
                  _loc8_ = _loc17_ - _loc6_;
                  _loc9_ = _loc7_ * _loc7_ + _loc8_ * _loc8_;
                  if(_loc9_ < _0M___)
                  {
                     this._06v.push(_loc4_);
                  }
               }
               _loc1_.beginFill(_loc3_);
               _loc1_.drawRect(_loc5_ - 2,_loc6_ - 2,4,4);
               _loc1_.endFill();
            }
         }
         if(this._06v.length != 0)
         {
            if(this.tooltip == null)
            {
               this.tooltip = new _1D_l(this._06v);
               _pn.addChild(this.tooltip);
            }
            else if(!this._0D_c(this.tooltip._06v,this._06v))
            {
               this.tooltip._1wJ_(this._06v);
            }
         }
         else if(this.tooltip != null)
         {
            if(this.tooltip.parent != null)
            {
               this.tooltip.parent.removeChild(this.tooltip);
            }
            this.tooltip = null;
         }
         var _loc18_:Number = this.focus.x_;
         var _loc19_:Number = this.focus.y_;
         var _loc20_:Number = this._0aV_.a * _loc18_ + this._0aV_.c * _loc19_ + this._0aV_.tx;
         var _loc21_:Number = this._0aV_.b * _loc18_ + this._0aV_.d * _loc19_ + this._0aV_.ty;
         this._H_W_.identity();
         this._H_W_.translate(-4,-5);
         this._H_W_.scale(8 / this._cb.width,32 / this._cb.height);
         this._H_W_.rotate(Parameters.data_.cameraAngle);
         this._H_W_.translate(_loc20_,_loc21_);
         _loc1_.beginBitmapFill(this._cb,this._H_W_,false);
         _loc1_.drawRect(_loc20_ - 16,_loc21_ - 16,32,32);
         _loc1_.endFill();
      }
      
      private function _0D_c(param1:Vector.<Player>, param2:Vector.<Player>) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.length;
         if(_loc3_ != param2.length)
         {
            return false;
         }
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_] != param2[_loc4_])
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      override public function zoomIn() : void
      {
         this._0oh = this._1C_W_._L_o(this._0oh - 1);
      }
      
      override public function zoomOut() : void
      {
         this._0oh = this._1C_W_._L_o(this._0oh + 1);
      }
      
      override public function deactivate() : void
      {
      }
   }
}
