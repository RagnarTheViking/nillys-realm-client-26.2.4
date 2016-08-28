package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class ReqLeaderUpdate extends ServerPacket
   {
       
      
      public function ReqLeaderUpdate(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
      }
      
      override public function toString() : String
      {
         return formatToString("REQLEADERUPDATE");
      }
   }
}
