package Packets.Server
{
   import _jQ_.Message;
   import flash.utils.IDataOutput;
   
   public class ServerPacket extends Message
   {
       
      
      public function ServerPacket(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public final function writeToOutput(param1:IDataOutput) : void
      {
         throw new Error("Client should not send " + id + " messages");
      }
   }
}
