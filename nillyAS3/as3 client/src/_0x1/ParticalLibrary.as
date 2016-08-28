package _0x1
{
   public class ParticalLibrary
   {
      
      public static const _01A_:Object = {};
       
      
      public function ParticalLibrary()
      {
         super();
      }
      
      public static function add(param1:XML) : void
      {
         var _loc2_:XML = null;
         for each(_loc2_ in param1.Particle)
         {
            _01A_[_loc2_.@id] = new _m8(_loc2_);
         }
      }
   }
}
