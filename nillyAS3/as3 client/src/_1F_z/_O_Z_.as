package _1F_z
{
   public class _O_Z_
   {
      
      private static var _u7:Object = _00h();
       
      
      public function _O_Z_()
      {
         super();
      }
      
      private static function _00h() : Object
      {
         _u7 = {};
         _u7[_1r__._1uO_.value] = 30;
         _u7[_1r__._b0.value] = 20;
         _u7[_1r__._06T_.value] = 20;
         _u7[_1r__._1Z_n.value] = 20;
         return _u7;
      }
      
      public static function _1yy(param1:_1Z_D_, param2:_1Z_D_) : Number
      {
         var _loc3_:Number = _xF_(param1);
         var _loc4_:Number = _xF_(param2);
         return _ks(_loc3_,_loc4_);
      }
      
      private static function _ks(param1:Number, param2:Number) : Number
      {
         return (param1 + param2) / 2;
      }
      
      private static function _xF_(param1:_1Z_D_) : Number
      {
         var _loc2_:int = _u7[param1._1b8()];
         var _loc3_:int = param1._0he() - _loc2_;
         var _loc4_:int = param1._0qB_[0].level - _loc3_;
         return _loc4_ / _loc2_;
      }
   }
}
