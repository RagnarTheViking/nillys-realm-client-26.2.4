package _qR_
{
   import _0x1.ParticleEffect;
   import flash.geom.Point;
   
   public class _1X_X_ extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var end_:Point;
      
      public var id_:uint;
      
      public function _1X_X_(param1:int, param2:Point, param3:Point)
      {
         super();
         this.start_ = param2;
         this.end_ = param3;
         this.id_ = param1;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc3_:* = 10000;
         var _loc4_:_1oi = new _1oi(this.id_,1500,this.start_,this.end_);
         map_.addObj(_loc4_,x_,y_);
         return false;
      }
   }
}
