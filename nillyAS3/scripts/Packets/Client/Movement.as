package Packets.Client
{
   import _7m._H_Q_;
   import _7m._dp;
   import flash.utils.IDataOutput;
   
   public class Movement extends ClientPacket
   {
       
      
      public var objectId_:int;
      
      public var tickId_:int;
      
      public var time_:int;
      
      public var newPosition_:_H_Q_;
      
      public var records_:Vector.<_dp>;
      
      public function Movement(param1:uint, param2:Function)
      {
         this.newPosition_ = new _H_Q_();
         this.records_ = new Vector.<_dp>();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeInt(this.objectId_);
         param1.writeInt(this.tickId_);
         param1.writeInt(this.time_);
         this.newPosition_.writeToOutput(param1);
         param1.writeShort(this.records_.length);
         while(_loc2_ < this.records_.length)
         {
            this.records_[_loc2_].writeToOutput(param1);
            _loc2_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("MOVE","objectId_","tickId_","time_","newPosition_","records_");
      }
   }
}
