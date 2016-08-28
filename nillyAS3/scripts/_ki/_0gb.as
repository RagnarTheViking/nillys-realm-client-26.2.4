package _ki
{
   public class _0gb implements _yx
   {
       
      
      public function _0gb()
      {
         super();
      }
      
      public function stringify(param1:Object) : String
      {
         return _1uq.JSON.encode(param1);
      }
      
      public function parse(param1:String) : Object
      {
         return _1uq.JSON.decode(param1);
      }
   }
}
