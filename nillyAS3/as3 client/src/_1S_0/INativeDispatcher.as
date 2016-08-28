package _1S_0
{
   import _f7._1D_y;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   
   public interface INativeDispatcher extends _1D_y
   {
       
      
      function get eventType() : String;
      
      function get eventClass() : Class;
      
      function get target() : IEventDispatcher;
      
      function set target(param1:IEventDispatcher) : void;
      
      function dispatchEvent(param1:Event) : Boolean;
   }
}
