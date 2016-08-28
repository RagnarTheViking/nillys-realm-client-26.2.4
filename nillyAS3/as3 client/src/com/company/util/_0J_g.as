package com.company.util
{
   public class _0J_g
   {
       
      
      public var _H_6:Number;
      
      public var _1m2:Number;
      
      public var _I_O_:Number;
      
      public var _1Z_B_:Number;
      
      public function _0J_g()
      {
         super();
         this.clear();
      }
      
      public function add(param1:Number, param2:Number) : void
      {
         if(param1 < this._H_6)
         {
            this._H_6 = param1;
         }
         if(param2 < this._1m2)
         {
            this._1m2 = param2;
         }
         if(param1 > this._I_O_)
         {
            this._I_O_ = param1;
         }
         if(param2 > this._1Z_B_)
         {
            this._1Z_B_ = param2;
         }
      }
      
      public function clear() : void
      {
         this._H_6 = Number.MAX_VALUE;
         this._1m2 = Number.MAX_VALUE;
         this._I_O_ = Number.MIN_VALUE;
         this._1Z_B_ = Number.MIN_VALUE;
      }
      
      public function toString() : String
      {
         return "min:(" + this._H_6 + ", " + this._1m2 + ") max:(" + this._I_O_ + ", " + this._1Z_B_ + ")";
      }
   }
}
