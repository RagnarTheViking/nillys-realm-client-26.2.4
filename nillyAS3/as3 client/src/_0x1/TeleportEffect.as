package _0x1
{
   public class TeleportEffect extends ParticleEffect
   {
       
      
      public function TeleportEffect()
      {
         super();
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:TeleportParticle = null;
         var _loc8_:int = 0;
         var _loc7_:int = 20;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = 2 * Math.PI * Math.random();
            _loc4_ = 0.7 * Math.random();
            _loc5_ = 500 + 1000 * Math.random();
            _loc6_ = new TeleportParticle(255,50,0.1,_loc5_);
            map_.addObj(_loc6_,x_ + _loc4_ * Math.cos(_loc3_),y_ + _loc4_ * Math.sin(_loc3_));
            _loc8_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:TeleportParticle = null;
         var _loc7_:int = 10;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = 2 * Math.PI * Math.random();
            _loc4_ = 0.7 * Math.random();
            _loc5_ = 5 + 500 * Math.random();
            _loc6_ = new TeleportParticle(255,50,0.1,_loc5_);
            map_.addObj(_loc6_,x_ + _loc4_ * Math.cos(_loc3_),y_ + _loc4_ * Math.sin(_loc3_));
            _loc8_++;
         }
         return false;
      }
   }
}

import _0x1.Particle;
import flash.geom.Vector3D;

class TeleportParticle extends Particle
{
    
   
   public var timeLeft_:int;
   
   protected var moveVec_:Vector3D;
   
   function TeleportParticle(param1:uint, param2:int, param3:Number, param4:int)
   {
      this.moveVec_ = new Vector3D();
      super(param1,0,param2);
      this.moveVec_.z = param3;
      this.timeLeft_ = param4;
   }
   
   override public function update(param1:int, param2:int) : Boolean
   {
      this.timeLeft_ = this.timeLeft_ - param2;
      if(this.timeLeft_ <= 0)
      {
         return false;
      }
      z_ = z_ + this.moveVec_.z * param2 * 0.008;
      return true;
   }
}
