package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._1C_q;
   
   public class FountainEffectRed extends ParticleEffect
   {
       
      
      public var go_:GameObject;
      
      public var lastUpdate_:int = -1;
      
      public function FountainEffectRed(param1:GameObject)
      {
         super();
         this.go_ = param1;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:FountainParticleRed = null;
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
         var _loc5_:int = this.lastUpdate_ / 50;
         while(_loc5_ < param1 / 50)
         {
            _loc3_ = _loc5_ * 50;
            _loc4_ = _1C_q._1I_j(FountainParticleRed) as FountainParticleRed;
            _loc4_.restart(_loc3_,param1);
            map_.addObj(_loc4_,x_,y_);
            _loc5_++;
         }
         this.lastUpdate_ = param1;
         return true;
      }
   }
}

import _0x1.Particle;
import flash.geom.Vector3D;
import com.company.assembleegameclient.util._1C_q;

class FountainParticleRed extends Particle
{
   
   private static const G:Number = -4.9;
   
   private static const VI:Number = 6.5;
   
   private static const ZI:Number = 0.75;
    
   
   public var startTime_:int;
   
   protected var moveVec_:Vector3D;
   
   function FountainParticleRed()
   {
      this.moveVec_ = new Vector3D();
      super(16711680,ZI,100);
   }
   
   public function restart(param1:int, param2:int) : void
   {
      var _loc3_:int = 0;
      var _loc4_:Number = 2 * Math.PI * Math.random();
      this.moveVec_.x = Math.cos(_loc4_);
      this.moveVec_.y = Math.sin(_loc4_);
      this.startTime_ = param1;
      _loc3_ = param2 - this.startTime_;
      x_ = x_ + this.moveVec_.x * _loc3_ * 0.0008;
      y_ = y_ + this.moveVec_.y * _loc3_ * 0.0008;
      var _loc5_:Number = (param2 - this.startTime_) / 1000;
      z_ = 0.75 + VI * _loc5_ + G * (_loc5_ * _loc5_);
   }
   
   override public function removeFromMap() : void
   {
      super.removeFromMap();
      _1C_q._4B_(this);
   }
   
   override public function update(param1:int, param2:int) : Boolean
   {
      var _loc3_:Number = (param1 - this.startTime_) / 1000;
      moveTo(x_ + this.moveVec_.x * param2 * 0.0008,y_ + this.moveVec_.y * param2 * 0.0008);
      z_ = 0.75 + VI * _loc3_ + G * (_loc3_ * _loc3_);
      return z_ > 0;
   }
}
