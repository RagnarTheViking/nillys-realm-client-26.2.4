package _1I_2
{
   import flash.events.Event;
   
   public class _1sz extends Event
   {
      
      public static const _L_U_:String = "bindingEmpty";
       
      
      public function _1sz(param1:String)
      {
         super(param1);
      }
      
      override public function clone() : Event
      {
         return new _1sz(type);
      }
   }
}
