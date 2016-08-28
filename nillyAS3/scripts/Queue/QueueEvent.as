package Queue
{
   import flash.events.Event;
   
   public class QueueEvent extends Event
   {
      
      public static const DESTROY:String = "QueueEvent_Destroy";
      
      public static const UPDATE_POSITION:String = "QueueEvent_Update_Position";
       
      
      public var result:Object;
      
      public function QueueEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.result = param2;
      }
      
      override public function clone() : Event
      {
         return new QueueEvent(type,this.result,bubbles,cancelable);
      }
   }
}
