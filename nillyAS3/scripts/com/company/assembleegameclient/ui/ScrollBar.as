package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Graphics;
   import flash.display.IGraphicsData;
   import flash.geom.Rectangle;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.events.Event;
   import flash.utils.getTimer;
   import com.company.util.GraphicHelper;
   
   public class ScrollBar extends Sprite
   {
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var width_:int;
      
      private var height_:int;
      
      private var speed_:Number;
      
      private var _0E_p:Rectangle;
      
      private var _0I_N_:Number;
      
      private var background_:Sprite;
      
      private var _1B_X_:Sprite;
      
      private var _010:Sprite;
      
      private var _1y2:Sprite;
      
      private var _C_S_:int;
      
      private var _1U_y:Number;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      public function ScrollBar(param1:int, param2:int, param3:Number = 1)
      {
         this._0O_n = new GraphicsSolidFill(16777215,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0O_n,this.path_,GraphicHelper.END_FILL];
         super();
         this.background_ = new Sprite();
         this.background_.addEventListener(MouseEvent.MOUSE_DOWN,this._b1);
         addChild(this.background_);
         this._1B_X_ = this._0D_O_(this._1l__);
         addChild(this._1B_X_);
         this._010 = this._0D_O_(this._06b);
         addChild(this._010);
         this._1y2 = this._0D_O_(this._0Y_G_);
         addChild(this._1y2);
         this.resize(param1,param2,param3);
      }
      
      private static function _0pU_(param1:int, param2:int, param3:Graphics) : void
      {
         param3.clear();
         param3.beginFill(3487029,0.01);
         param3.drawRect(-param1 / 2,-param2 / 2,param1,param2);
         param3.endFill();
         param3.beginFill(16777215,1);
         param3.moveTo(-param1 / 2,-param2 / 2);
         param3.lineTo(param1 / 2,0);
         param3.lineTo(-param1 / 2,param2 / 2);
         param3.lineTo(-param1 / 2,-param2 / 2);
         param3.endFill();
      }
      
      public function _zH_() : Number
      {
         return (this._1y2.y - this._0E_p.y) / (this._0E_p.height - this._1y2.height);
      }
      
      public function _0jj(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:int = param2 == 0?int(this._0E_p.height):int(param1 / param2 * this._0E_p.height);
         _loc4_ = Math.min(this._0E_p.height,Math.max(this.width_,_loc4_));
         this._1Y_L_(this.width_,_loc4_,this._1y2.graphics);
         this._0I_N_ = param1 / (param2 - param1);
         if(param3)
         {
            this._1mX_(0);
         }
      }
      
      public function _1mX_(param1:Number) : void
      {
         param1 = Math.max(0,Math.min(1,param1));
         this._1y2.y = param1 * (this._0E_p.height - this._1y2.height) + this._0E_p.y;
         this._1X_l();
      }
      
      public function _Y_X_() : void
      {
         this._1mX_(this._zH_() - this._0I_N_);
      }
      
      public function _03s() : void
      {
         this._1mX_(this._zH_() + this._0I_N_);
      }
      
      private function _0D_O_(param1:Function) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,param1);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this._86);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         return _loc2_;
      }
      
      private function _86(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         _loc2_.transform.colorTransform = new ColorTransform(1,0.8627,0.5216);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         _loc2_.transform.colorTransform = new ColorTransform(1,1,1);
      }
      
      private function _b1(param1:MouseEvent) : void
      {
         if(param1.localY < this._1y2.y)
         {
            this._Y_X_();
         }
         else
         {
            this._03s();
         }
      }
      
      private function _1l__(param1:MouseEvent) : void
      {
         addEventListener(Event.ENTER_FRAME,this._1J_Q_);
         addEventListener(MouseEvent.MOUSE_UP,this._1hp);
         this._C_S_ = getTimer();
         this._1U_y = -this.speed_;
      }
      
      private function _06b(param1:MouseEvent) : void
      {
         addEventListener(Event.ENTER_FRAME,this._1J_Q_);
         addEventListener(MouseEvent.MOUSE_UP,this._1hp);
         this._C_S_ = getTimer();
         this._1U_y = this.speed_;
      }
      
      private function _1J_Q_(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:Number = (_loc2_ - this._C_S_) / 1000;
         var _loc4_:int = (this.height_ - this.width_ * 3) * _loc3_ * this._1U_y;
         this._1mX_((this._1y2.y + _loc4_ - this._0E_p.y) / (this._0E_p.height - this._1y2.height));
         this._C_S_ = _loc2_;
      }
      
      private function _1hp(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this._1J_Q_);
         removeEventListener(MouseEvent.MOUSE_UP,this._1hp);
      }
      
      private function _0Y_G_(param1:MouseEvent) : void
      {
         this._1y2.startDrag(false,new Rectangle(0,this._0E_p.y,0,this._0E_p.height - this._1y2.height));
         stage.addEventListener(MouseEvent.MOUSE_UP,this._1gc);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._8g);
         this._1X_l();
      }
      
      private function _1gc(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._1gc);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._8g);
         this._1y2.stopDrag();
         this._1X_l();
      }
      
      private function _8g(param1:MouseEvent) : void
      {
         this._1X_l();
      }
      
      private function _1X_l() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function resize(param1:int, param2:int, param3:Number = 1) : void
      {
         var _loc4_:int = 0;
         this.width_ = param1;
         this.height_ = param2;
         this.speed_ = param3;
         _loc4_ = this.width_ * 0.75;
         this._0E_p = new Rectangle(0,_loc4_ + 5,this.width_,this.height_ - _loc4_ * 2 - 10);
         var _loc5_:Graphics = this.background_.graphics;
         _loc5_.clear();
         _loc5_.beginFill(5526612,1);
         _loc5_.drawRect(this._0E_p.x,this._0E_p.y,this._0E_p.width,this._0E_p.height);
         _loc5_.endFill();
         _0pU_(_loc4_,this.width_,this._1B_X_.graphics);
         this._1B_X_.rotation = -90;
         this._1B_X_.x = this.width_ / 2;
         this._1B_X_.y = _loc4_ / 2;
         _0pU_(_loc4_,this.width_,this._010.graphics);
         this._010.x = this.width_ / 2;
         this._010.y = this.height_ - _loc4_ / 2;
         this._010.rotation = 90;
         this._1Y_L_(this.width_,this.height_,this._1y2.graphics);
         this._1y2.x = 0;
         this._1y2.y = this._0E_p.y;
      }
      
      private function _1Y_L_(param1:int, param2:int, param3:Graphics) : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,param1,param2,4,[1,1,1,1],this.path_);
         param3.clear();
         param3.drawGraphicsData(this.graphicsData_);
      }
   }
}
