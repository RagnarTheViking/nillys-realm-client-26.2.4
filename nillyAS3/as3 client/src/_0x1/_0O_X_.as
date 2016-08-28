package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _0O_X_ extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var _0cq:Number;
      
      public var color_:int;
      
      public function _0O_X_(param1:GameObject, param2:Number, param3:int)
      {
         super();
         this.start_ = new Point(param1.x_,param1.y_);
         this._0cq = param2;
         this.color_ = param3;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Particle = null;
         var _loc7_:int = 0;
         var _loc10_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc8_:int = 12;
         var _loc9_:* = 200;
         while(_loc10_ < _loc8_)
         {
            _loc3_ = _loc10_ * 2 * Math.PI / _loc8_;
            _loc4_ = new Point(this.start_.x + this._0cq * Math.cos(_loc3_),this.start_.y + this._0cq * Math.sin(_loc3_));
            _loc5_ = new Point(this.start_.x + this._0cq * 0.9 * Math.cos(_loc3_),this.start_.y + this._0cq * 0.9 * Math.sin(_loc3_));
            _loc6_ = new _0J_J_(_loc7_,this.color_,_loc9_,_loc5_,_loc4_);
            map_.addObj(_loc6_,x_,y_);
            _loc10_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Particle = null;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc7_:int = 0;
         var _loc8_:int = 10;
         var _loc9_:int = 50;
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc3_ = _loc10_ * 2 * Math.PI / _loc8_;
            _loc4_ = new Point(this.start_.x + this._0cq * Math.cos(_loc3_),this.start_.y + this._0cq * Math.sin(_loc3_));
            _loc5_ = new Point(this.start_.x + this._0cq * 0.9 * Math.cos(_loc3_),this.start_.y + this._0cq * 0.9 * Math.sin(_loc3_));
            _loc6_ = new _0J_J_(_loc7_,this.color_,_loc9_,_loc5_,_loc4_);
            map_.addObj(_loc6_,x_,y_);
            _loc10_++;
         }
         return false;
      }
   }
}
