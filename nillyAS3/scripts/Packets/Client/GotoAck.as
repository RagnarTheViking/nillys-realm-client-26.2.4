package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class GotoAck extends ClientPacket
   {
       
      
      public var time_:int;
      
      public function GotoAck(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
      }
      
      override public function toString() : String
      {
         return formatToString("GOTOACK","time_");
      }
   }
}
