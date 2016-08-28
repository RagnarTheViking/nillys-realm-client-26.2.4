package _0x1
{
   import flash.geom.Point;
   
   public class _D_0 extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var _0cq:Number;
      
      public var color_:int;
      
      public function _D_0(param1:Point, param2:Number, param3:int)
      {
         super();
         this.start_ = param1;
         this._0cq = param2;
         this.color_ = param3;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         var _loc9_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:* = 40;
         var _loc7_:* = 200;
         var _loc8_:int = 4 + this._0cq * 2;
         while(_loc9_ < _loc8_)
         {
            _loc3_ = _loc9_ * 2 * Math.PI / _loc8_;
            _loc4_ = new Point(this.start_.x + this._0cq * Math.cos(_loc3_),this.start_.y + this._0cq * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc6_,this.color_,_loc7_,this.start_,_loc4_);
            map_.addObj(_loc5_,x_,y_);
            _loc9_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         var _loc9_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:* = 200;
         var _loc7_:* = 200;
         var _loc8_:int = 4 + this._0cq * 2;
         while(_loc9_ < _loc8_)
         {
            _loc3_ = _loc9_ * 2 * Math.PI / _loc8_;
            _loc4_ = new Point(this.start_.x + this._0cq * Math.cos(_loc3_),this.start_.y + this._0cq * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc6_,this.color_,_loc7_,this.start_,_loc4_);
            map_.addObj(_loc5_,x_,y_);
            _loc9_++;
         }
         return false;
      }
   }
}
