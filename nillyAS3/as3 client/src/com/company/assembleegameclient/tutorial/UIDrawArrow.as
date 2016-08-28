package com.company.assembleegameclient.tutorial
{
   import flash.geom.Point;
   import flash.display.Graphics;
   import com.company.util.PointUtil;
   import com.company.util.ConversionUtil;
   
   public class UIDrawArrow
   {
       
      
      public const _0vk:int = 500;
      
      public var p0_:Point;
      
      public var p1_:Point;
      
      public var color_:uint;
      
      public function UIDrawArrow(param1:XML)
      {
         super();
         var _loc2_:Array = ConversionUtil._use(param1);
         this.p0_ = _loc2_[0];
         this.p1_ = _loc2_[1];
         this.color_ = uint(param1.@color);
      }
      
      public function draw(param1:int, param2:Graphics, param3:int) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = new Point();
         if(param3 < this._0vk)
         {
            _loc5_.x = this.p0_.x + (this.p1_.x - this.p0_.x) * param3 / this._0vk;
            _loc5_.y = this.p0_.y + (this.p1_.y - this.p0_.y) * param3 / this._0vk;
         }
         else
         {
            _loc5_.x = this.p1_.x;
            _loc5_.y = this.p1_.y;
         }
         param2.lineStyle(param1,this.color_);
         param2.moveTo(this.p0_.x,this.p0_.y);
         param2.lineTo(_loc5_.x,_loc5_.y);
         var _loc6_:Number = PointUtil._f5(_loc5_,this.p0_);
         _loc4_ = PointUtil._1xy(_loc5_,_loc6_ + Math.PI / 8,30);
         param2.lineTo(_loc4_.x,_loc4_.y);
         _loc4_ = PointUtil._1xy(_loc5_,_loc6_ - Math.PI / 8,30);
         param2.moveTo(_loc5_.x,_loc5_.y);
         param2.lineTo(_loc4_.x,_loc4_.y);
      }
   }
}
