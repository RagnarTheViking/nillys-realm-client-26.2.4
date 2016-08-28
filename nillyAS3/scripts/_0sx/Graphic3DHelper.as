package _0sx
{
   import _wi.Injector;
   import _0cW_._054;
   import _0cW_._0iA_;
   
   public class Graphic3DHelper
   {
       
      
      public function Graphic3DHelper()
      {
         super();
      }
      
      public static function map(param1:Injector) : void
      {
         _0aM_(param1);
         _cJ_(param1);
      }
      
      private static function _0aM_(param1:Injector) : void
      {
         var _loc2_:_0jf = param1.getInstance(_0jf);
         param1.map(_054)._0K_M_(_loc2_);
      }
      
      private static function _cJ_(param1:Injector) : void
      {
         var _loc2_:_0__8 = param1.getInstance(_0__8);
         param1.map(_0iA_)._0K_M_(_loc2_);
      }
   }
}
