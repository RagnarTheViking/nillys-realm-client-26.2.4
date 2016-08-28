package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.util._0xp;
   import com.company.assembleegameclient.objects.GameObject;
   import _7m._H_Q_;
   
   public class _0wv extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var end_:Point;
      
      public var color_:int;
      
      public function _0wv(param1:GameObject, param2:_H_Q_, param3:int)
      {
         super();
         this.start_ = new Point(param1.x_,param1.y_);
         this.end_ = new Point(param2.x_,param2.y_);
         this.color_ = param3;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Point = null;
         var _loc4_:Particle = null;
         var _loc6_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc5_:int = 30;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = Point.interpolate(this.start_,this.end_,_loc6_ / _loc5_);
            _loc4_ = new _O_y(100,this.color_,700,0.5,_0xp._0__x(1),_0xp._0__x(1));
            map_.addObj(_loc4_,_loc3_.x,_loc3_.y);
            _loc6_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Point = null;
         var _loc4_:Particle = null;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc5_:int = 5;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = Point.interpolate(this.start_,this.end_,_loc6_ / _loc5_);
            _loc4_ = new _O_y(100,this.color_,200,0.5,_0xp._0__x(1),_0xp._0__x(1));
            map_.addObj(_loc4_,_loc3_.x,_loc3_.y);
            _loc6_++;
         }
         return false;
      }
   }
}
