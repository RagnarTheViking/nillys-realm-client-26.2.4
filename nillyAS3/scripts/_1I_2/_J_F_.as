package _1I_2
{
   import flash.events.Event;
   import flash.display.DisplayObject;
   
   public class _J_F_ extends Event
   {
      
      public static const _17x:String = "configureView";
       
      
      private var _08z:DisplayObject;
      
      public function _J_F_(param1:String, param2:DisplayObject = null)
      {
         super(param1,true,true);
         this._08z = param2;
      }
      
      public function get view() : DisplayObject
      {
         return this._08z;
      }
      
      override public function clone() : Event
      {
         return new _J_F_(type,this._08z);
      }
   }
}
