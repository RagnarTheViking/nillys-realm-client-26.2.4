package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class Ping extends ServerPacket
   {
       
      
      public var serial_:int;
      
      public function Ping(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.serial_ = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("PING","serial_");
      }
   }
}
