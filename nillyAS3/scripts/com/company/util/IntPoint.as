package com.company.util
{
   import flash.geom.Point;
   import flash.geom.Matrix;
   
   public class IntPoint
   {
       
      
      public var x_:int;
      
      public var y_:int;
      
      public function IntPoint(param1:int = 0, param2:int = 0)
      {
         super();
         this.x_ = param1;
         this.y_ = param2;
      }
      
      public static function _03() : void
      {
         var _loc1_:UnitTest = new UnitTest();
      }
      
      public static function _sL_(param1:Point) : IntPoint
      {
         return new IntPoint(Math.round(param1.x),Math.round(param1.y));
      }
      
      public function x() : int
      {
         return this.x_;
      }
      
      public function y() : int
      {
         return this.y_;
      }
      
      public function _E_z(param1:int) : void
      {
         this.x_ = param1;
      }
      
      public function _dH_(param1:int) : void
      {
         this.y_ = param1;
      }
      
      public function clone() : IntPoint
      {
         return new IntPoint(this.x_,this.y_);
      }
      
      public function _4F_(param1:IntPoint) : Boolean
      {
         return this.x_ == param1.x_ && this.y_ == param1.y_;
      }
      
      public function _1O_w(param1:IntPoint) : int
      {
         var _loc2_:int = param1.x_ - this.x_;
         var _loc3_:int = param1.y_ - this.y_;
         return Math.round(Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_));
      }
      
      public function _0fi(param1:IntPoint) : Number
      {
         var _loc2_:int = param1.x_ - this.x_;
         var _loc3_:int = param1.y_ - this.y_;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function _1zR_(param1:Point) : Number
      {
         var _loc2_:int = param1.x - this.x_;
         var _loc3_:int = param1.y - this.y_;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function trunc1000() : IntPoint
      {
         return new IntPoint(int(this.x_ / 1000) * 1000,int(this.y_ / 1000) * 1000);
      }
      
      public function round1000() : IntPoint
      {
         return new IntPoint(Math.round(this.x_ / 1000) * 1000,Math.round(this.y_ / 1000) * 1000);
      }
      
      public function _4(param1:IntPoint) : int
      {
         var _loc2_:int = param1.x() - this.x_;
         var _loc3_:int = param1.y() - this.y_;
         return _loc2_ * _loc2_ + _loc3_ * _loc3_;
      }
      
      public function _1O_q() : Point
      {
         return new Point(this.x_,this.y_);
      }
      
      public function transform(param1:Matrix) : IntPoint
      {
         var _loc2_:Point = param1.transformPoint(this._1O_q());
         return new IntPoint(Math.round(_loc2_.x),Math.round(_loc2_.y));
      }
      
      public function toString() : String
      {
         return "(" + this.x_ + ", " + this.y_ + ")";
      }
   }
}

import com.company.util.IntPoint;

class UnitTest
{
    
   
   function UnitTest()
   {
      var _loc1_:IntPoint = null;
      var _loc2_:IntPoint = null;
      var _loc3_:Number = NaN;
      super();
      _loc1_ = new IntPoint(999,1001);
      _loc2_ = _loc1_.round1000();
      if(_loc2_.x() != 1000 || _loc2_.y() != 1000)
      {
      }
      _loc1_ = new IntPoint(500,400);
      _loc2_ = _loc1_.round1000();
      if(_loc2_.x() != 1000 || _loc2_.y() != 0)
      {
      }
      _loc1_ = new IntPoint(-400,-500);
      _loc2_ = _loc1_.round1000();
      if(_loc2_.x() != 0 || _loc2_.y() != 0)
      {
      }
      _loc1_ = new IntPoint(-501,-999);
      _loc2_ = _loc1_.round1000();
      if(_loc2_.x() != -1000 || _loc2_.y() != -1000)
      {
      }
      _loc1_ = new IntPoint(-1000,-1001);
      _loc2_ = _loc1_.round1000();
      if(_loc2_.x() != -1000 || _loc2_.y() != -1000)
      {
      }
      _loc1_ = new IntPoint(999,1001);
      _loc2_ = _loc1_.trunc1000();
      if(_loc2_.x() != 0 || _loc2_.y() != 1000)
      {
      }
      _loc1_ = new IntPoint(500,400);
      _loc2_ = _loc1_.trunc1000();
      if(_loc2_.x() != 0 || _loc2_.y() != 0)
      {
      }
      _loc1_ = new IntPoint(-400,-500);
      _loc2_ = _loc1_.trunc1000();
      if(_loc2_.x() != 0 || _loc2_.y() != 0)
      {
      }
      _loc1_ = new IntPoint(-501,-999);
      _loc2_ = _loc1_.trunc1000();
      if(_loc2_.x() != 0 || _loc2_.y() != 0)
      {
      }
      _loc1_ = new IntPoint(-1000,-1001);
      _loc2_ = _loc1_.trunc1000();
      if(_loc2_.x() != -1000 || _loc2_.y() != -1000)
      {
      }
      _loc3_ = 0.9999998;
      if(int(_loc3_) != 0)
      {
      }
      _loc3_ = 0.5;
      if(int(_loc3_) != 0)
      {
      }
      _loc3_ = 0.499999;
      if(int(_loc3_) != 0)
      {
      }
      _loc3_ = -0.499999;
      if(int(_loc3_) != 0)
      {
      }
      _loc3_ = -0.5;
      if(int(_loc3_) != 0)
      {
      }
      _loc3_ = -0.99999;
      if(int(_loc3_) != 0)
      {
      }
   }
}
