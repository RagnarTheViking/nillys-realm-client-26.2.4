package _0hJ_
{
   public final class _1ph
   {
      
      private static const _0z1:Number = 180 / Math.PI;
      
      private static const _1L_v:Number = Math.PI / 180;
      
      private static const _0m9:Number = 60 * 1.1515 * 1.609344 * 1000;
       
      
      public var _k0:Number;
      
      public var _0K_g:Number;
      
      public function _1ph(param1:Number, param2:Number)
      {
         super();
         this._k0 = param1;
         this._0K_g = param2;
      }
      
      public static function distance(param1:_1ph, param2:_1ph) : Number
      {
         var _loc3_:Number = _1L_v * (param1._0K_g - param2._0K_g);
         var _loc4_:Number = _1L_v * param1._k0;
         var _loc5_:Number = _1L_v * param2._k0;
         var _loc6_:Number = Math.sin(_loc4_) * Math.sin(_loc5_) + Math.cos(_loc4_) * Math.cos(_loc5_) * Math.cos(_loc3_);
         _loc6_ = _0z1 * Math.acos(_loc6_) * _0m9;
         return _loc6_;
      }
      
      public function toString() : String
      {
         return "(" + this._k0 + ", " + this._0K_g + ")";
      }
   }
}
