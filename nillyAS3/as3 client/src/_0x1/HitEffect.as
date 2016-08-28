package _0x1
{
   public class HitEffect extends ParticleEffect
   {
       
      
      public var _ip:Vector.<uint>;
      
      public var _P_r:int;
      
      public var angle_:Number;
      
      public var speed_:Number;
      
      public function HitEffect(param1:Vector.<uint>, param2:int, param3:int, param4:Number, param5:Number)
      {
         super();
         this._ip = param1;
         size_ = param2;
         this._P_r = param3;
         this.angle_ = param4;
         this.speed_ = param5;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:uint = 0;
         var _loc4_:Particle = null;
         var _loc7_:int = 0;
         if(this._ip.length == 0)
         {
            return false;
         }
         var _loc5_:Number = this.speed_ / 600 * Math.cos(this.angle_ + Math.PI);
         var _loc6_:Number = this.speed_ / 600 * Math.sin(this.angle_ + Math.PI);
         while(_loc7_ < this._P_r)
         {
            _loc3_ = this._ip[int(this._ip.length * Math.random())];
            _loc4_ = new HitParticle(_loc3_,0.5,size_,200 + Math.random() * 100,_loc5_ + (Math.random() - 0.5) * 0.4,_loc6_ + (Math.random() - 0.5) * 0.4,0);
            map_.addObj(_loc4_,x_,y_);
            _loc7_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:uint = 0;
         var _loc4_:Particle = null;
         if(this._ip.length == 0)
         {
            return false;
         }
         var _loc5_:Number = this.speed_ / 600 * Math.cos(this.angle_ + Math.PI);
         var _loc6_:Number = this.speed_ / 600 * Math.sin(this.angle_ + Math.PI);
         this._P_r = this._P_r * 0.2;
         var _loc7_:int = 0;
         while(_loc7_ < this._P_r)
         {
            _loc3_ = this._ip[int(this._ip.length * Math.random())];
            _loc4_ = new HitParticle(_loc3_,0.5,10,5 + Math.random() * 100,_loc5_ + (Math.random() - 0.5) * 0.4,_loc6_ + (Math.random() - 0.5) * 0.4,0);
            map_.addObj(_loc4_,x_,y_);
            _loc7_++;
         }
         return false;
      }
   }
}

import _0x1.Particle;
import flash.geom.Vector3D;

class HitParticle extends Particle
{
    
   
   public var lifetime_:int;
   
   public var timeLeft_:int;
   
   protected var moveVec_:Vector3D;
   
   function HitParticle(param1:uint, param2:Number, param3:int, param4:int, param5:Number, param6:Number, param7:Number)
   {
      this.moveVec_ = new Vector3D();
      super(param1,param2,param3);
      this.timeLeft_ = this.lifetime_ = param4;
      this.moveVec_.x = param5;
      this.moveVec_.y = param6;
      this.moveVec_.z = param7;
   }
   
   override public function update(param1:int, param2:int) : Boolean
   {
      this.timeLeft_ = this.timeLeft_ - param2;
      if(this.timeLeft_ <= 0)
      {
         return false;
      }
      x_ = x_ + this.moveVec_.x * param2 * 0.008;
      y_ = y_ + this.moveVec_.y * param2 * 0.008;
      z_ = z_ + this.moveVec_.z * param2 * 0.008;
      return true;
   }
}
