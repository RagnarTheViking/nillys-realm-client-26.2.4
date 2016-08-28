package _1I_2
{
   import flash.events.Event;
   import flash.display.DisplayObjectContainer;
   
   public class _11M_ extends Event
   {
      
      public static const _0S_k:String = "containerAdd";
      
      public static const _1G_X_:String = "containerRemove";
      
      public static const _cz:String = "rootContainerAdd";
      
      public static const _0nx:String = "rootContainerRemove";
       
      
      private var _O_a:DisplayObjectContainer;
      
      public function _11M_(param1:String, param2:DisplayObjectContainer)
      {
         super(param1);
         this._O_a = param2;
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._O_a;
      }
      
      override public function clone() : Event
      {
         return new _11M_(type,this._O_a);
      }
   }
}
