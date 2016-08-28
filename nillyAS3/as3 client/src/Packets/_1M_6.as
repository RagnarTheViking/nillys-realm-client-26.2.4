package Packets
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class _1M_6 extends ServerPacket
   {
       
      
      public var type:int;
      
      public function _1M_6(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.type = param1.readInt();
      }
   }
}
