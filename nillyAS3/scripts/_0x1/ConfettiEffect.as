package _0x1
{
   import flash.geom.Point;
   import _7m._H_Q_;
   
   public class ConfettiEffect extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var end_:Point;
      
      public var color_:int;
      
      public var lifetime_:int;
      
      public var _0T_B_:Boolean = false;
      
      public function ConfettiEffect(param1:_H_Q_, param2:_H_Q_, param3:int, param4:int, param5:Boolean = false)
      {
         super();
         this.start_ = new Point(param1.x_,param1.y_);
         this.end_ = new Point(param2.x_,param2.y_);
         this.color_ = param3;
         this.lifetime_ = param4;
         this._0T_B_ = param5;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ConfettiParticle = null;
         var _loc8_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:int = 5;
         var _loc7_:Array = [65535,16711935,16776960,16777215];
         while(_loc8_ < _loc6_)
         {
            if(this._0T_B_)
            {
               _loc3_ = _loc7_[int(Math.floor(Math.random() * (_loc7_.length + 1)))];
            }
            else
            {
               _loc3_ = this.color_;
            }
            _loc4_ = (3 + int(Math.random() * 5)) * 20;
            _loc5_ = new ConfettiParticle(1.85,_loc4_,_loc3_,500 * this.lifetime_ + Math.random() * 500 * this.lifetime_,0.1 + Math.random() * 0.1,this.start_,this.end_);
            map_.addObj(_loc5_,x_,y_);
            _loc8_++;
         }
         return false;
      }
   }
}

import _0x1.Particle;
import flash.geom.Vector3D;
import flash.geom.Point;

class ConfettiParticle extends Particle
{
    
   
   public var timeLeft_:int;
   
   protected var moveVec_:Vector3D;
   
   public var start_:Point;
   
   public var end_:Point;
   
   public var dx_:Number;
   
   public var dy_:Number;
   
   public var pathX_:Number;
   
   public var pathY_:Number;
   
   public var xDeflect_:Number;
   
   public var yDeflect_:Number;
   
   public var period_:Number;
   
   function ConfettiParticle(param1:Number, param2:int, param3:int, param4:int, param5:Number, param6:Point, param7:Point)
   {
      this.moveVec_ = new Vector3D();
      super(param3,param1,param2);
      this.moveVec_.z = param5;
      this.timeLeft_ = param4;
      this.start_ = param6;
      this.end_ = param7;
      this.dx_ = (this.end_.x - this.start_.x) / this.timeLeft_;
      this.dy_ = (this.end_.y - this.start_.y) / this.timeLeft_;
      var _loc8_:Number = Point.distance(param6,param7) / this.timeLeft_;
      var _loc9_:Number = 0.25;
      this.xDeflect_ = this.dy_ / _loc8_ * _loc9_;
      this.yDeflect_ = -this.dx_ / _loc8_ * _loc9_;
      this.pathX_ = x_ = this.start_.x;
      this.pathY_ = y_ = this.start_.y;
      this.period_ = 0.25 + Math.random() * 0.5;
   }
   
   override public function update(param1:int, param2:int) : Boolean
   {
      this.timeLeft_ = this.timeLeft_ - param2;
      if(this.timeLeft_ <= 0)
      {
         return false;
      }
      this.pathX_ = this.pathX_ + this.dx_ * param2;
      this.pathY_ = this.pathY_ + this.dy_ * param2;
      var _loc3_:Number = Math.sin(this.timeLeft_ / 1000 / this.period_);
      _1pw(this.pathX_ + this.xDeflect_ * _loc3_,this.pathY_ + this.yDeflect_ * _loc3_);
      return true;
   }
}
