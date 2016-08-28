package Packets.Client
{
   import _7m.ObjectSlot;
   import _7m._H_Q_;
   import flash.utils.IDataOutput;
   
   public class UseItem extends ClientPacket
   {
       
      
      public var time_:int;
      
      public var slotObject_:ObjectSlot;
      
      public var itemUsePos_:_H_Q_;
      
      public var useType_:int;
      
      public function UseItem(param1:uint, param2:Function)
      {
         this.slotObject_ = new ObjectSlot();
         this.itemUsePos_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
         this.slotObject_.writeToOutput(param1);
         this.itemUsePos_.writeToOutput(param1);
         param1.writeByte(this.useType_);
      }
      
      override public function toString() : String
      {
         return formatToString("USEITEM","slotObject_","itemUsePos_","useType_");
      }
   }
}
