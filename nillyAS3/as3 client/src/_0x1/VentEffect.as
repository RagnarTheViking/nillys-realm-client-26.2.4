package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._1C_q;
   
   public class VentEffect extends ParticleEffect
   {
      
      private static const _2r:int = 50;
       
      
      public var go_:GameObject;
      
      public var lastUpdate_:int = -1;
      
      public function VentEffect(param1:GameObject)
      {
         super();
         this.go_ = param1;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:VentParticle = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.go_.map_ == null)
         {
            return false;
         }
         if(this.lastUpdate_ < 0)
         {
            this.lastUpdate_ = Math.max(0,param1 - 400);
         }
         x_ = this.go_.x_;
         y_ = this.go_.y_;
         var _loc9_:int = int(this.lastUpdate_ / _2r);
         while(_loc9_ < int(param1 / _2r))
         {
            _loc3_ = _loc9_ * _2r;
            _loc4_ = _1C_q._1I_j(VentParticle) as VentParticle;
            _loc4_.restart(_loc3_,param1);
            _loc5_ = Math.random() * Math.PI;
            _loc6_ = Math.random() * 0.4;
            _loc7_ = this.go_.x_ + _loc6_ * Math.cos(_loc5_);
            _loc8_ = this.go_.y_ + _loc6_ * Math.sin(_loc5_);
            map_.addObj(_loc4_,_loc7_,_loc8_);
            _loc9_++;
         }
         this.lastUpdate_ = param1;
         return true;
      }
   }
}

import _0x1.Particle;
import com.company.assembleegameclient.util._1C_q;

class VentParticle extends Particle
{
    
   
   public var startTime_:int;
   
   public var speed_:int;
   
   function VentParticle()
   {
      var _loc1_:Number = Math.random();
      super(2542335,0,75 + _loc1_ * 50);
      this.speed_ = 2.5 - _loc1_ * 1.5;
   }
   
   public function restart(param1:int, param2:int) : void
   {
      this.startTime_ = param1;
      var _loc3_:Number = (param2 - this.startTime_) / 1000;
      z_ = 0 + this.speed_ * _loc3_;
   }
   
   override public function removeFromMap() : void
   {
      super.removeFromMap();
      _1C_q._4B_(this);
   }
   
   override public function update(param1:int, param2:int) : Boolean
   {
      var _loc3_:Number = (param1 - this.startTime_) / 1000;
      z_ = 0 + this.speed_ * _loc3_;
      return z_ < 1;
   }
}
