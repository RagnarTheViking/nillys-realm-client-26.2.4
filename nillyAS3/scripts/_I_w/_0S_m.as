package _I_w
{
   import flash.utils.getQualifiedClassName;
   
   public class _0S_m
   {
      
      private static var _00W_:uint;
       
      
      public function _0S_m()
      {
         super();
      }
      
      public static function create(param1:* = null) : String
      {
         if(param1 is Class)
         {
            param1 = getQualifiedClassName(param1).split("::").pop();
         }
         return (!!param1?param1 + "-":"") + (_00W_++).toString(16) + "-" + (Math.random() * 255).toString(16);
      }
   }
}
