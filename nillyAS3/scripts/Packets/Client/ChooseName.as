package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class ChooseName extends ClientPacket
   {
       
      
      public var name_:String;
      
      public function ChooseName(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name_);
      }
      
      override public function toString() : String
      {
         return formatToString("CHOOSENAME","name_");
      }
   }
}
