package _0x1
{
   import _qR_._0Y_n;
   import flash.display.Sprite;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ParticleField extends _0Y_n
   {
       
      
      private const SMALL:String = "SMALL";
      
      private const LARGE:String = "LARGE";
      
      private var _rh:String;
      
      private var width:int;
      
      private var height:int;
      
      public var lifetime_:int;
      
      public var timeLeft_:int;
      
      private var _0sQ_:Sprite;
      
      private var _hx:Array;
      
      private var visibleHeight:Number;
      
      private var offset:Number;
      
      private var timer:Timer;
      
      private var _1vG_:Boolean;
      
      public function ParticleField(param1:Number, param2:Number)
      {
         this._0sQ_ = new Sprite();
         this._hx = [];
         this._an(param2,param1);
         this._0vN_();
         this._1__g();
         var _loc3_:BitmapData = new BitmapData(this.width,this.height,true,0);
         _loc3_.draw(this._0sQ_);
         super(_loc3_,0);
      }
      
      private function _1__g() : void
      {
         this.timer = new Timer(this._N_S_());
         this.timer.addEventListener(TimerEvent.TIMER,this._1xW_);
         this.timer.start();
      }
      
      private function _an(param1:Number, param2:Number) : void
      {
         this.visibleHeight = param1 * 5 + 40;
         this.offset = this.visibleHeight * 0.5;
         this.width = param2 * 5 + 40;
         this.height = this.visibleHeight + this.offset;
      }
      
      private function _0vN_() : void
      {
         this._rh = this.width == 8?this.SMALL:this.LARGE;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:uint = 0;
         if(this._1vG_)
         {
            return false;
         }
         var _loc4_:uint = this._hx.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this._hx[_loc3_])
            {
               this._hx[_loc3_].move();
            }
            _loc3_++;
         }
         _2n = new BitmapData(this.width,this.height,true,0);
         _2n.draw(this._0sQ_);
         return true;
      }
      
      private function _1xW_(param1:TimerEvent) : void
      {
         var _loc2_:Square = new Square(this._0el(),this._0e__(),this._0xP_());
         _loc2_.complete.add(this._J_T_);
         this._hx.push(_loc2_);
         this._0sQ_.addChild(_loc2_);
      }
      
      private function _0xP_() : uint
      {
         return this._rh == this.SMALL?uint(15):uint(30);
      }
      
      private function _N_S_() : uint
      {
         return this._rh == this.SMALL?uint(100):uint(50);
      }
      
      private function _J_T_(param1:Square) : void
      {
         param1.complete.removeAll();
         this._0sQ_.removeChild(param1);
         this._hx.splice(this._hx.indexOf(param1),1);
      }
      
      private function _0el() : Point
      {
         var _loc1_:Array = Math.random() < 0.5?["x","y","width","visibleHeight"]:["y","x","visibleHeight","width"];
         var _loc2_:Point = new Point(0,0);
         _loc2_[_loc1_[0]] = Math.random() * this[_loc1_[2]];
         _loc2_[_loc1_[1]] = Math.random() < 0.5?0:this[_loc1_[3]];
         return _loc2_;
      }
      
      private function _0e__() : Point
      {
         return new Point(this.width / 2,this.visibleHeight / 2);
      }
      
      public function destroy() : void
      {
         if(this.timer != null)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this._1xW_);
            this.timer.stop();
            this.timer = null;
         }
         this._0sQ_ = null;
         this._hx = [];
         this._1vG_ = true;
      }
   }
}

import flash.display.Shape;
import flash.geom.Point;
import _f7.Signal;

class Square extends Shape
{
    
   
   public var start:Point;
   
   public var end:Point;
   
   private var lifespan:uint;
   
   private var moveX:Number;
   
   private var moveY:Number;
   
   private var angle:Number;
   
   public var complete:Signal;
   
   function Square(param1:Point, param2:Point, param3:uint)
   {
      this.complete = new Signal();
      super();
      this.start = param1;
      this.end = param2;
      this.lifespan = param3;
      this.moveX = (param2.x - param1.x) / param3;
      this.moveY = (param2.y - param1.y) / param3;
      graphics.beginFill(16777215);
      graphics.drawRect(-2,-2,4,4);
      this.position();
   }
   
   private function position() : void
   {
      this.x = this.start.x;
      this.y = this.start.y;
   }
   
   public function move() : void
   {
      this.x = this.x + this.moveX;
      this.y = this.y + this.moveY;
      this.lifespan--;
      if(!this.lifespan)
      {
         this.complete.dispatch(this);
      }
   }
}
