package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.objects.GameObject;
   import _7m._H_Q_;
   
   public class _0zT_ extends ParticleEffect
   {
       
      
      public var center_:Point;
      
      public var _rm:Point;
      
      public var color_:int;
      
      public function _0zT_(param1:GameObject, param2:_H_Q_, param3:_H_Q_, param4:int)
      {
         super();
         this.center_ = new Point(param2.x_,param2.y_);
         this._rm = new Point(param3.x_,param3.y_);
         this.color_ = param4;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         var _loc10_:int = 0;
         x_ = this.center_.x;
         y_ = this.center_.y;
         var _loc6_:Number = Point.distance(this.center_,this._rm);
         var _loc7_:* = 300;
         var _loc8_:* = 200;
         var _loc9_:int = 24;
         while(_loc10_ < _loc9_)
         {
            _loc3_ = _loc10_ * 2 * Math.PI / _loc9_;
            _loc4_ = new Point(this.center_.x + _loc6_ * Math.cos(_loc3_),this.center_.y + _loc6_ * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc7_,this.color_,_loc8_,_loc4_,this.center_);
            map_.addObj(_loc5_,x_,y_);
            _loc10_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         x_ = this.center_.x;
         y_ = this.center_.y;
         var _loc6_:Number = Point.distance(this.center_,this._rm);
         var _loc7_:int = 50;
         var _loc8_:int = 150;
         var _loc9_:int = 8;
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc3_ = _loc10_ * 2 * Math.PI / _loc9_;
            _loc4_ = new Point(this.center_.x + _loc6_ * Math.cos(_loc3_),this.center_.y + _loc6_ * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc7_,this.color_,_loc8_,_loc4_,this.center_);
            map_.addObj(_loc5_,x_,y_);
            _loc10_++;
         }
         return false;
      }
   }
}
