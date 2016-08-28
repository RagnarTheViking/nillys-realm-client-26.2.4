package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.util._0xp;
   import com.company.assembleegameclient.objects.GameObject;
   import _7m._H_Q_;
   
   public class _1D_9 extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var end_:Point;
      
      public var color_:int;
      
      public var _0I_8:int;
      
      public function _1D_9(param1:GameObject, param2:_H_Q_, param3:int, param4:int)
      {
         super();
         this.start_ = new Point(param1.x_,param1.y_);
         this.end_ = new Point(param2.x_,param2.y_);
         this.color_ = param3;
         this._0I_8 = param4;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Point = null;
         var _loc4_:Particle = null;
         var _loc5_:Number = NaN;
         var _loc8_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:Number = Point.distance(this.start_,this.end_);
         var _loc7_:int = _loc6_ * 3;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = Point.interpolate(this.start_,this.end_,_loc8_ / _loc7_);
            _loc4_ = new _O_y(this._0I_8,this.color_,1000 - _loc8_ / _loc7_ * 900,0.5,0,0);
            _loc5_ = Math.min(_loc8_,_loc7_ - _loc8_);
            map_.addObj(_loc4_,_loc3_.x + _0xp._0__x(_loc6_ / 200 * _loc5_),_loc3_.y + _0xp._0__x(_loc6_ / 200 * _loc5_));
            _loc8_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Point = null;
         var _loc4_:Particle = null;
         var _loc5_:Number = NaN;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:Number = Point.distance(this.start_,this.end_);
         var _loc7_:int = _loc6_ * 2;
         this._0I_8 = 80;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = Point.interpolate(this.start_,this.end_,_loc8_ / _loc7_);
            _loc4_ = new _O_y(this._0I_8,this.color_,750 - _loc8_ / _loc7_ * 675,0.5,0,0);
            _loc5_ = Math.min(_loc8_,_loc7_ - _loc8_);
            map_.addObj(_loc4_,_loc3_.x + _0xp._0__x(_loc6_ / 200 * _loc5_),_loc3_.y + _0xp._0__x(_loc6_ / 200 * _loc5_));
            _loc8_++;
         }
         return false;
      }
   }
}
