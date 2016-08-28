package com.company.assembleegameclient.objects
{
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.map.Square;
   
   public class SpiderWeb extends GameObject
   {
       
      
      private var _cU_:Boolean = false;
      
      public function SpiderWeb(param1:XML)
      {
         super(param1);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         if(!this._cU_)
         {
            this._cU_ = this._0bz();
         }
         if(this._cU_)
         {
            super.draw(param1,param2,param3);
         }
      }
      
      private function _0bz() : Boolean
      {
         var _loc1_:Square = null;
         _loc1_ = map_.lookupSquare(x_ - 1,y_);
         if(_loc1_ != null && _loc1_.obj_ is Wall)
         {
            return true;
         }
         _loc1_ = map_.lookupSquare(x_,y_ - 1);
         if(_loc1_ != null && _loc1_.obj_ is Wall)
         {
            _0oI_.setPosition(x_,y_,0,90);
            return true;
         }
         _loc1_ = map_.lookupSquare(x_ + 1,y_);
         if(_loc1_ != null && _loc1_.obj_ is Wall)
         {
            _0oI_.setPosition(x_,y_,0,180);
            return true;
         }
         _loc1_ = map_.lookupSquare(x_,y_ + 1);
         if(_loc1_ != null && _loc1_.obj_ is Wall)
         {
            _0oI_.setPosition(x_,y_,0,270);
            return true;
         }
         return false;
      }
   }
}
