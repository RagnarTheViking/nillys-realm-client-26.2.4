package _0bE_
{
   import flash.display.Sprite;
   import _Y_M_.Menu;
   import flash.display.DisplayObjectContainer;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.Shape;
   import ToolTips.ToolTip;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.display.StageScaleMode;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.map.View;
   import com.company.util._t__;
   import com.company.util.Trig;
   import flash.display.Graphics;
   import flash.filters.DropShadowFilter;
   
   public class _1Y_ extends Sprite
   {
      
      public static const _0L_T_:int = 8;
      
      public static const _hJ_:int = 11;
      
      public static const _U_z:int = 3;
      
      private static var _X_y:Menu = null;
       
      
      public var _pn:DisplayObjectContainer;
      
      public var _0kc:uint;
      
      public var _1nZ_:uint;
      
      public var go_:GameObject = null;
      
      public var _3P_:Vector.<GameObject>;
      
      public var _0K_Q_:Boolean = false;
      
      private var _1O_X_:Boolean;
      
      private var _0S_H_:Shape;
      
      public var _1mG_:ToolTip = null;
      
      private var _hg:Point;
      
      public function _1Y_(param1:uint, param2:uint, param3:Boolean)
      {
         this._3P_ = new Vector.<GameObject>();
         this._0S_H_ = new Shape();
         this._hg = new Point();
         super();
         this._0kc = param1;
         this._1nZ_ = param2;
         this._1O_X_ = param3;
         addChild(this._0S_H_);
         this._0pU_();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         filters = [new DropShadowFilter(0,0,0,1,8,8)];
         visible = false;
      }
      
      public static function _4q() : void
      {
         if(_X_y != null)
         {
            if(_X_y.parent != null)
            {
               _X_y.parent.removeChild(_X_y);
            }
            _X_y = null;
         }
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this._0K_Q_ = true;
         this._0pU_();
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         this._0K_Q_ = false;
         this._0pU_();
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function _0kI_(param1:ToolTip) : void
      {
         this._O_t();
         this._1mG_ = param1;
         if(this._1mG_ != null)
         {
            addChild(this._1mG_);
            this._1tk(this._1mG_);
         }
      }
      
      protected function _O_t() : void
      {
         if(this._1mG_ != null)
         {
            if(this._1mG_.parent != null)
            {
               this._1mG_.parent.removeChild(this._1mG_);
            }
            this._1mG_ = null;
         }
      }
      
      protected function _24(param1:Menu) : void
      {
         this._O_t();
         _X_y = param1;
         this._pn.addChild(_X_y);
      }
      
      public function _1G_B_(param1:GameObject) : void
      {
         if(this.go_ != param1)
         {
            this.go_ = param1;
         }
         this._3P_.length = 0;
         if(this.go_ == null)
         {
            visible = false;
         }
      }
      
      public function _1qY_(param1:GameObject) : void
      {
         this._3P_.push(param1);
      }
      
      public function correctQuestNote(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = param1.clone();
         if(stage.scaleMode == StageScaleMode.NO_SCALE)
         {
            if(Parameters.data_["uiscale"] || false)
            {
               this.scaleY = this.scaleX = (stage.stageWidth < stage.stageHeight?stage.stageWidth:stage.stageHeight) / Parameters.data_["mscale"] / 600;
            }
            else
            {
               this.scaleX = this.scaleY = 1;
            }
            _loc2_.right = _loc2_.right - (800 - this.go_.map_.gs_.hudView.x) * stage.stageWidth / Parameters.data_["mscale"] / 800;
         }
         else
         {
            this.scaleX = this.scaleY = 1;
         }
         return _loc2_;
      }
      
      public function draw(param1:int, param2:View) : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.go_ == null)
         {
            visible = false;
            return;
         }
         this.go_.initObjBoundary(param2);
         _loc3_ = this.correctQuestNote(param2.rect);
         _loc4_ = this.go_._P_c[0];
         _loc5_ = this.go_._P_c[1];
         if(!_t__._1ux(_loc3_,0,0,_loc4_,_loc5_,this._hg))
         {
            this.go_ = null;
            visible = false;
            return;
         }
         x = this._hg.x;
         y = this._hg.y;
         var _loc6_:Number = Trig._0M_c(270 - Trig._0qM_ * Math.atan2(_loc4_,_loc5_));
         if(this._hg.x < _loc3_.left + 5)
         {
            if(_loc6_ > 45)
            {
               _loc6_ = 45;
            }
            if(_loc6_ < -45)
            {
               _loc6_ = -45;
            }
         }
         else if(this._hg.x > _loc3_.right - 5)
         {
            if(_loc6_ > 0)
            {
               if(_loc6_ < 135)
               {
                  _loc6_ = 135;
               }
            }
            else if(_loc6_ > -135)
            {
               _loc6_ = -135;
            }
         }
         if(this._hg.y < _loc3_.top + 5)
         {
            if(_loc6_ < 45)
            {
               _loc6_ = 45;
            }
            if(_loc6_ > 135)
            {
               _loc6_ = 135;
            }
         }
         else if(this._hg.y > _loc3_.bottom - 5)
         {
            if(_loc6_ > -45)
            {
               _loc6_ = -45;
            }
            if(_loc6_ < -135)
            {
               _loc6_ = -135;
            }
         }
         this._0S_H_.rotation = _loc6_;
         if(this._1mG_ != null)
         {
            this._1tk(this._1mG_);
         }
         visible = true;
      }
      
      private function _1tk(param1:ToolTip) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = this._0S_H_.rotation;
         var _loc5_:int = _U_z + _hJ_ + 12;
         var _loc6_:Number = _loc5_ * Math.cos(_loc4_ * Trig._P_0);
         var _loc7_:Number = _loc5_ * Math.sin(_loc4_ * Trig._P_0);
         var _loc8_:Number = param1._15U_;
         var _loc9_:Number = param1._6v;
         if(_loc4_ >= 45 && _loc4_ <= 135)
         {
            _loc2_ = _loc6_ + _loc8_ / Math.tan(_loc4_ * Trig._P_0);
            param1.x = (_loc6_ + _loc2_) / 2 - _loc8_ / 2;
            param1.y = _loc7_;
         }
         else if(_loc4_ <= -45 && _loc4_ >= -135)
         {
            _loc2_ = _loc6_ - _loc8_ / Math.tan(_loc4_ * Trig._P_0);
            param1.x = (_loc6_ + _loc2_) / 2 - _loc8_ / 2;
            param1.y = _loc7_ - _loc9_;
         }
         else if(_loc4_ < 45 && _loc4_ > -45)
         {
            param1.x = _loc6_;
            _loc3_ = _loc7_ + _loc9_ * Math.tan(_loc4_ * Trig._P_0);
            param1.y = (_loc7_ + _loc3_) / 2 - _loc9_ / 2;
         }
         else
         {
            param1.x = _loc6_ - _loc8_;
            _loc3_ = _loc7_ - _loc9_ * Math.tan(_loc4_ * Trig._P_0);
            param1.y = (_loc7_ + _loc3_) / 2 - _loc9_ / 2;
         }
      }
      
      private function _0pU_() : void
      {
         var _loc1_:Graphics = this._0S_H_.graphics;
         _loc1_.clear();
         var _loc2_:int = this._1O_X_ || this._0K_Q_?int(_hJ_):int(_0L_T_);
         _loc1_.lineStyle(1,this._0kc);
         _loc1_.beginFill(this._1nZ_);
         _loc1_.moveTo(_U_z,0);
         _loc1_.lineTo(_loc2_ + _U_z,_loc2_);
         _loc1_.lineTo(_loc2_ + _U_z,-_loc2_);
         _loc1_.lineTo(_U_z,0);
         _loc1_.endFill();
         _loc1_.lineStyle();
      }
   }
}
