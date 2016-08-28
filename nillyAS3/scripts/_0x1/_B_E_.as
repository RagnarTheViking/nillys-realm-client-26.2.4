package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import flash.geom.Vector3D;
   
   public class _B_E_ extends Particle
   {
       
      
      public var timeLeft_:int;
      
      public var go_:GameObject;
      
      public var angle_:Number;
      
      public var _1oc:Number;
      
      protected var moveVec_:Vector3D;
      
      public function _B_E_(param1:uint, param2:Number, param3:int, param4:int, param5:Number, param6:GameObject, param7:Number, param8:Number)
      {
         this.moveVec_ = new Vector3D();
         super(param1,param2,param3);
         this.moveVec_.z = param5;
         this.timeLeft_ = param4;
         this.go_ = param6;
         this.angle_ = param7;
         this._1oc = param8;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         this.timeLeft_ = this.timeLeft_ - param2;
         if(this.timeLeft_ <= 0)
         {
            return false;
         }
         x_ = this.go_.x_ + this._1oc * Math.cos(this.angle_);
         y_ = this.go_.y_ + this._1oc * Math.sin(this.angle_);
         z_ = z_ + this.moveVec_.z * param2 * 0.008;
         return true;
      }
   }
}
