package Packets.Client
{
   import _jQ_.Message;
   import flash.utils.IDataInput;
   
   public class ClientPacket extends Message
   {
       
      
      public function ClientPacket(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public final function parseFromInput(param1:IDataInput) : void
      {
         throw new Error("Client should not receive " + id + " messages");
      }
   }
}
