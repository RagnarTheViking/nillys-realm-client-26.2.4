package com.company.util
{
   import flash.display.BitmapData;
   
   public class _n5
   {
       
      
      public var _0D_y:Vector.<BitmapData>;
      
      public function _n5()
      {
         super();
         this._0D_y = new Vector.<BitmapData>();
      }
      
      public function add(param1:BitmapData) : void
      {
         this._0D_y.push(param1);
      }
      
      public function random() : BitmapData
      {
         return this._0D_y[int(Math.random() * this._0D_y.length)];
      }
      
      public function addFromBitmapData(param1:BitmapData, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:int = param1.width / param2;
         var _loc6_:int = param1.height / param3;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               this._0D_y.push(BitmapUtil._0P_V_(param1,_loc4_ * param2,_loc7_ * param3,param2,param3));
               _loc4_++;
            }
            _loc7_++;
         }
      }
   }
}
