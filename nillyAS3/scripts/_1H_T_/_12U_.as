package _1H_T_
{
   import flash.events.Event;
   
   public class _12U_ extends Event
   {
      
      public static const ITEM_MOVE:String = "ITEM_MOVE";
      
      public static const ITEM_DOUBLE_CLICK:String = "ITEM_DOUBLE_CLICK";
      
      public static const ITEM_SHIFT_CLICK:String = "ITEM_SHIFT_CLICK";
      
      public static const ITEM_CLICK:String = "ITEM_CLICK";
      
      public static const ITEM_HOTKEY_PRESS:String = "ITEM_HOTKEY_PRESS";
      
      public static const ITEM_CTRL_CLICK:String = "ITEM_CTRL_CLICK";
       
      
      public var tile:_1H_T_._S_A_;
      
      public function _12U_(param1:String, param2:_1H_T_._S_A_)
      {
         super(param1,true);
         this.tile = param2;
      }
   }
}
