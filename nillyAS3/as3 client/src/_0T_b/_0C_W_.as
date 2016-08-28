package _0T_b
{
   import _Y_9.DateField;
   
   public class _0C_W_
   {
       
      
      public function _0C_W_()
      {
         super();
      }
      
      public static function _1__6(param1:DateField) : uint
      {
         var _loc2_:Date = new Date(_1X_c(param1));
         var _loc3_:Date = new Date();
         var _loc4_:uint = Number(_loc3_.fullYear) - Number(_loc2_.fullYear);
         if(_loc2_.month > _loc3_.month || _loc2_.month == _loc3_.month && _loc2_.date > _loc3_.date)
         {
            _loc4_--;
         }
         return _loc4_;
      }
      
      public static function _1X_c(param1:DateField) : uint
      {
         var _loc2_:String = param1._1J_p.text + "/" + param1.days.text + "/" + param1._1xZ_.text;
         return Date.parse(_loc2_);
      }
   }
}
