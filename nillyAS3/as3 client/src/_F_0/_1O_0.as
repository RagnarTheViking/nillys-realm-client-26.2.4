package _F_0
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class _1O_0 extends Sprite
   {
      
      public static var _T_0:Boolean = false;
       
      
      public function _1O_0()
      {
         _T_0 = true;
         addEventListener(Event.REMOVED_FROM_STAGE,this._14X_);
         super();
      }
      
      public function _14X_(param1:Event) : void
      {
         _T_0 = false;
      }
   }
}
