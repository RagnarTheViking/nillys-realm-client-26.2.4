package _1M_z
{
   import Packets.Client.ClientPacket;
   import _7m.ObjectSlot;
   import flash.utils.IDataOutput;
   
   public class TinkerQuest extends ClientPacket
   {
       
      
      public var _1J_S_:ObjectSlot;
      
      public function TinkerQuest(param1:uint, param2:Function)
      {
         this._1J_S_ = new ObjectSlot();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         this._1J_S_.writeToOutput(param1);
      }
   }
}
