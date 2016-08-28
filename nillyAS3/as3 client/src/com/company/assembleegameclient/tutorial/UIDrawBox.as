package com.company.assembleegameclient.tutorial
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.display.Graphics;
   import com.company.util.ConversionUtil;
   
   public class UIDrawBox
   {
       
      
      public const _0vk:int = 500;
      
      public const _17Q_:Point = new Point(250,200);
      
      public var rect_:Rectangle;
      
      public var color_:uint;
      
      public function UIDrawBox(param1:XML)
      {
         super();
         this.rect_ = ConversionUtil._sQ_(param1);
         this.color_ = uint(param1.@color);
      }
      
      public function draw(param1:int, param2:Graphics, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = this.rect_.width - param1;
         var _loc7_:Number = this.rect_.height - param1;
         if(param3 < this._0vk)
         {
            _loc4_ = this._17Q_.x + (this.rect_.x - this._17Q_.x) * param3 / this._0vk;
            _loc5_ = this._17Q_.y + (this.rect_.y - this._17Q_.y) * param3 / this._0vk;
            _loc6_ = _loc6_ * (param3 / this._0vk);
            _loc7_ = _loc7_ * (param3 / this._0vk);
         }
         else
         {
            _loc4_ = this.rect_.x + param1 / 2;
            _loc5_ = this.rect_.y + param1 / 2;
         }
         param2.lineStyle(param1,this.color_);
         param2.drawRect(_loc4_,_loc5_,_loc6_,_loc7_);
      }
   }
}
