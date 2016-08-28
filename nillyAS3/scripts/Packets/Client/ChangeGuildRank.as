package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class ChangeGuildRank extends ClientPacket
   {
       
      
      public var name_:String;
      
      public var guildRank_:int;
      
      public function ChangeGuildRank(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeUTF(this.name_);
         param1.writeInt(this.guildRank_);
      }
      
      override public function toString() : String
      {
         return formatToString("CHANGEGUILDRANK","name_","guildRank_");
      }
   }
}
