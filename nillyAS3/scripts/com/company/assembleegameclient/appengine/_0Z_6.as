package com.company.assembleegameclient.appengine
{
   import com.company.assembleegameclient.util.Star;
   
   public class _0Z_6
   {
       
      
      public var _sZ_:XML;
      
      public function _0Z_6(param1:XML)
      {
         super();
         this._sZ_ = param1;
      }
      
      public function bestLevel() : int
      {
         return this._sZ_.BestLevel;
      }
      
      public function _1hK_() : int
      {
         return this._sZ_.BestFame;
      }
      
      public function numStars() : int
      {
         return Star.numStars(int(this._sZ_.BestFame));
      }
   }
}
