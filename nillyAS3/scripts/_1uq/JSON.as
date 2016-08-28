package _1uq
{
   public class JSON
   {
       
      
      public function JSON()
      {
         super();
      }
      
      public static function encode(param1:Object) : String
      {
         var _loc2_:_U_n = new _U_n(param1);
         return _loc2_.getString();
      }
      
      public static function decode(param1:String) : *
      {
         var _loc2_:_13h = new _13h(param1);
         return _loc2_.getValue();
      }
   }
}
