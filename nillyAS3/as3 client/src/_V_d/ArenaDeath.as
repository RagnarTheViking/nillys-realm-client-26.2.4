package _V_d
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class ArenaDeath extends ServerPacket
   {
       
      
      public var cost:int;
      
      public function ArenaDeath(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.cost = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("ARENADEATH","cost");
      }
   }
}
