package _V_d
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class ImminentArenaWave extends ServerPacket
   {
       
      
      public var currentRuntime:int;
      
      public var waveNumber:int;
      
      public function ImminentArenaWave(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.currentRuntime = param1.readInt();
         this.waveNumber = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("IMMINENTARENAWAVE","currentRuntime");
      }
   }
}
