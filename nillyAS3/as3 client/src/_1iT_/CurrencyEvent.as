package _1iT_
{
   import flash.events.Event;
   
   public class CurrencyEvent extends Event
   {
      
      public static const MONEY_CHANGED:String = "MONEY_CHANGED";
       
      
      public function CurrencyEvent()
      {
         super(MONEY_CHANGED,true);
      }
   }
}
