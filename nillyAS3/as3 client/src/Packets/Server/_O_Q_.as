package Packets.Server
{
   import _jQ_.Message;
   import flash.utils.IDataInput;
   
   public class _O_Q_ extends Message
   {
       
      
      public var type:int;
      
      public function _O_Q_(param1:uint, param2:Function = null)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.type = param1.readInt();
      }
   }
}
