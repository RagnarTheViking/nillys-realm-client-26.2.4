package com.company.util
{
   public class _1G_U_ implements _0ov
   {
       
      
      private var _1H_o:Array;
      
      private var _1A_J_:int;
      
      public function _1G_U_(param1:Array)
      {
         super();
         this._1H_o = param1;
         this._1A_J_ = 0;
      }
      
      public function reset() : void
      {
         this._1A_J_ = 0;
      }
      
      public function next() : Object
      {
         return this._1H_o[this._1A_J_++];
      }
      
      public function _N_o() : Boolean
      {
         return this._1A_J_ < this._1H_o.length;
      }
   }
}
