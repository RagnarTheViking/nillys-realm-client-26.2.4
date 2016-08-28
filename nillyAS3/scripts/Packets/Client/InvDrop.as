package Packets.Client
{
   import _7m.ObjectSlot;
   import flash.utils.IDataOutput;
   
   public class InvDrop extends ClientPacket
   {
       
      
      public var slotObject_:ObjectSlot;
      
      public function InvDrop(param1:uint, param2:Function)
      {
         this.slotObject_ = new ObjectSlot();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         this.slotObject_.writeToOutput(param1);
      }
      
      override public function toString() : String
      {
         return formatToString("INVDROP","slotObject_");
      }
   }
}
