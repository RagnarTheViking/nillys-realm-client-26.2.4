package _0S_w
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Matrix;
   import flash.display.Sprite;
   import flash.display.Bitmap;
   
   public class _pD_
   {
      
      private static const _dy:int = 256;
       
      
      public var width_:int;
      
      public var height_:int;
      
      public var _1nZ_:uint;
      
      private var _04M_:int;
      
      private var _0F_V_:int;
      
      private var _1rv:Vector.<BitmapData>;
      
      public function _pD_(param1:int, param2:int, param3:Boolean, param4:uint)
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         super();
         this.width_ = param1;
         this.height_ = param2;
         this._1nZ_ = param4;
         this._04M_ = Math.ceil(this.width_ / _dy);
         this._0F_V_ = Math.ceil(this.height_ / _dy);
         this._1rv = new Vector.<BitmapData>(this._04M_ * this._0F_V_,true);
         while(_loc8_ < this._04M_)
         {
            _loc5_ = 0;
            while(_loc5_ < this._0F_V_)
            {
               _loc6_ = Math.min(_dy,this.width_ - _loc8_ * _dy);
               _loc7_ = Math.min(_dy,this.height_ - _loc5_ * _dy);
               this._1rv[_loc8_ + _loc5_ * this._04M_] = new _1wr(_loc6_,_loc7_,param3,this._1nZ_);
               _loc5_++;
            }
            _loc8_++;
         }
      }
      
      public function copyTo(param1:BitmapData, param2:Rectangle, param3:Rectangle) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Number = param3.width / param2.width;
         var _loc8_:Number = param3.height / param2.height;
         var _loc9_:int = int(param3.x / _dy);
         var _loc10_:int = int(param3.y / _dy);
         var _loc11_:int = Math.ceil(param3.right / _dy);
         var _loc12_:int = Math.ceil(param3.bottom / _dy);
         var _loc13_:Matrix = new Matrix();
         var _loc14_:int = _loc9_;
         while(_loc14_ < _loc11_)
         {
            _loc4_ = _loc10_;
            while(_loc4_ < _loc12_)
            {
               _loc5_ = this._1rv[_loc14_ + _loc4_ * this._04M_];
               _loc13_.identity();
               _loc13_.scale(_loc7_,_loc8_);
               _loc13_.translate(param3.x - _loc14_ * _dy - param2.x * _loc7_,param3.y - _loc4_ * _dy - param2.x * _loc8_);
               _loc6_ = new Rectangle(param3.x - _loc14_ * _dy,param3.y - _loc4_ * _dy,param3.width,param3.height);
               _loc5_.draw(param1,_loc13_,null,null,_loc6_,false);
               _loc4_++;
            }
            _loc14_++;
         }
      }
      
      public function _0T_l(param1:Rectangle, param2:BitmapData, param3:Rectangle) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BitmapData = null;
         var _loc6_:Number = param3.width / param1.width;
         var _loc7_:Number = param3.height / param1.height;
         var _loc8_:int = Math.max(0,int(param1.x / _dy));
         var _loc9_:int = Math.max(0,int(param1.y / _dy));
         var _loc10_:int = Math.min(this._04M_ - 1,int(param1.right / _dy));
         var _loc11_:int = Math.min(this._0F_V_ - 1,int(param1.bottom / _dy));
         var _loc12_:Rectangle = new Rectangle();
         var _loc13_:Matrix = new Matrix();
         var _loc14_:int = _loc8_;
         while(_loc14_ <= _loc10_)
         {
            _loc4_ = _loc9_;
            while(_loc4_ <= _loc11_)
            {
               _loc5_ = this._1rv[_loc14_ + _loc4_ * this._04M_];
               _loc13_.identity();
               _loc13_.translate(param3.x / _loc6_ - param1.x + _loc14_ * _dy,param3.y / _loc7_ - param1.y + _loc4_ * _dy);
               _loc13_.scale(_loc6_,_loc7_);
               param2.draw(_loc5_,_loc13_,null,null,param3,false);
               _loc4_++;
            }
            _loc14_++;
         }
      }
      
      public function _L_V_(param1:Rectangle) : void
      {
         var _loc2_:int = 0;
         var _loc3_:BitmapData = null;
         var _loc4_:int = int(param1.x / _dy);
         var _loc5_:int = int(param1.y / _dy);
         var _loc6_:int = Math.ceil(param1.right / _dy);
         var _loc7_:int = Math.ceil(param1.bottom / _dy);
         var _loc8_:Rectangle = new Rectangle();
         var _loc9_:int = _loc4_;
         while(_loc9_ < _loc6_)
         {
            _loc2_ = _loc5_;
            while(_loc2_ < _loc7_)
            {
               _loc3_ = this._1rv[_loc9_ + _loc2_ * this._04M_];
               _loc8_.x = param1.x - _loc9_ * _dy;
               _loc8_.y = param1.y - _loc2_ * _dy;
               _loc8_.right = param1.right - _loc9_ * _dy;
               _loc8_.bottom = param1.bottom - _loc2_ * _dy;
               _loc3_.fillRect(_loc8_,this._1nZ_);
               _loc2_++;
            }
            _loc9_++;
         }
      }
      
      public function _F_7() : Sprite
      {
         var _loc1_:int = 0;
         var _loc2_:BitmapData = null;
         var _loc3_:Bitmap = null;
         var _loc5_:int = 0;
         var _loc4_:Sprite = new Sprite();
         while(_loc5_ < this._04M_)
         {
            _loc1_ = 0;
            while(_loc1_ < this._0F_V_)
            {
               _loc2_ = this._1rv[_loc5_ + _loc1_ * this._04M_];
               _loc3_ = new Bitmap(_loc2_);
               _loc3_.x = _loc5_ * _dy;
               _loc3_.y = _loc1_ * _dy;
               _loc4_.addChild(_loc3_);
               _loc1_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
