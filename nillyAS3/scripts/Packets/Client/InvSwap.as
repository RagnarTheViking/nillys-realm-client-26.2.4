package Packets.Client
{
   import _7m._H_Q_;
   import _7m.ObjectSlot;
   import flash.utils.IDataOutput;
   
   public class InvSwap extends ClientPacket
   {
       
      
      public var time_:int;
      
      public var position_:_H_Q_;
      
      public var slotObject1_:ObjectSlot;
      
      public var slotObject2_:ObjectSlot;
      
      public function InvSwap(param1:uint, param2:Function)
      {
         this.position_ = new _H_Q_();
         this.slotObject1_ = new ObjectSlot();
         this.slotObject2_ = new ObjectSlot();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
         this.position_.writeToOutput(param1);
         this.slotObject1_.writeToOutput(param1);
         this.slotObject2_.writeToOutput(param1);
      }
      
      override public function toString() : String
      {
         return formatToString("INVSWAP","time_","position_","slotObject1_","slotObject2_");
      }
   }
}
