package _0x1
{
   import flash.geom.Point;
   import _7m._H_Q_;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _0ts extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var _oo:_H_Q_;
      
      public var _h7:Number;
      
      public var color_:int;
      
      public function _0ts(param1:GameObject, param2:_H_Q_, param3:Number, param4:int)
      {
         super();
         this.start_ = new Point(param1.x_,param1.y_);
         this._oo = param2;
         this._h7 = param3;
         this.color_ = param4;
      }
      
      override public function runNormalRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         var _loc11_:int = 0;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:* = 200;
         var _loc7_:int = 100;
         var _loc8_:Number = Math.PI / 3;
         var _loc9_:int = 7;
         var _loc10_:Number = Math.atan2(this._oo.y_ - this.start_.y,this._oo.x_ - this.start_.x);
         while(_loc11_ < _loc9_)
         {
            _loc3_ = _loc10_ - _loc8_ / 2 + _loc11_ * _loc8_ / _loc9_;
            _loc4_ = new Point(this.start_.x + this._h7 * Math.cos(_loc3_),this.start_.y + this._h7 * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc6_,this.color_,_loc7_,this.start_,_loc4_);
            map_.addObj(_loc5_,x_,y_);
            _loc11_++;
         }
         return false;
      }
      
      override public function runEasyRendering(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Particle = null;
         x_ = this.start_.x;
         y_ = this.start_.y;
         var _loc6_:int = 50;
         var _loc7_:int = 10;
         var _loc8_:Number = Math.PI / 3;
         var _loc9_:int = 5;
         var _loc10_:Number = Math.atan2(this._oo.y_ - this.start_.y,this._oo.x_ - this.start_.x);
         var _loc11_:int = 0;
         while(_loc11_ < _loc9_)
         {
            _loc3_ = _loc10_ - _loc8_ / 2 + _loc11_ * _loc8_ / _loc9_;
            _loc4_ = new Point(this.start_.x + this._h7 * Math.cos(_loc3_),this.start_.y + this._h7 * Math.sin(_loc3_));
            _loc5_ = new _0J_J_(_loc6_,this.color_,_loc7_,this.start_,_loc4_);
            map_.addObj(_loc5_,x_,y_);
            _loc11_++;
         }
         return false;
      }
   }
}
