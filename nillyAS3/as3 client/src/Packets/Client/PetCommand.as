package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class PetCommand extends ClientPacket
   {
       
      
      public var _1T_n:uint;
      
      public var _1fG_:uint;
      
      public function PetCommand(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeByte(this._1T_n);
         param1.writeInt(this._1fG_);
      }
   }
}
