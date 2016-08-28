package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class Cheating extends ClientPacket
   {
       
      
      public var cheatId:int;
      
      public function Cheating(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.cheatId);
      }
      
      override public function toString() : String
      {
         return formatToString("CHEATING");
      }
   }
}
