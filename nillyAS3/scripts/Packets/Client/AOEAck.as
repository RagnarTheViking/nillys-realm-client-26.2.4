package Packets.Client
{
   import _7m._H_Q_;
   import flash.utils.IDataOutput;
   
   public class AOEAck extends ClientPacket
   {
       
      
      public var time_:int;
      
      public var position_:_H_Q_;
      
      public function AOEAck(param1:uint, param2:Function)
      {
         this.position_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
         this.position_.writeToOutput(param1);
      }
      
      override public function toString() : String
      {
         return formatToString("AOEACK","time_","position_");
      }
   }
}
