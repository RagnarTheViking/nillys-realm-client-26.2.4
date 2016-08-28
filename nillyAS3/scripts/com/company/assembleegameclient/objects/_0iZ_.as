package com.company.assembleegameclient.objects
{
   import _1xa._1eo;
   import _1xa._4l;
   
   public class _0iZ_
   {
      
      public static const _0P_G_:RegExp = /(.+)\s\((.+)\)/;
       
      
      public function _0iZ_()
      {
         super();
      }
      
      public function parse(param1:String) : String
      {
         var _loc2_:Array = param1.match(_0P_G_);
         if(_loc2_ == null)
         {
            return this._y4(param1);
         }
         return this._0nS_(_loc2_);
      }
      
      private function _y4(param1:String) : String
      {
         if(param1.charAt(0) == "{" && param1.charAt(param1.length - 1) == "}")
         {
            return param1;
         }
         return "{" + param1 + "}";
      }
      
      private function _0nS_(param1:Array) : String
      {
         var _loc2_:* = "{" + param1[1] + "}";
         if(param1.length > 1)
         {
            _loc2_ = _loc2_ + (" (" + param1[2] + ")");
         }
         return _loc2_;
      }
      
      public function makeBuilder(param1:String) : _1eo
      {
         return new _4l().setPattern(this.parse(param1));
      }
   }
}
