package Packets.Client
{
   import _7m._H_Q_;
   import flash.utils.IDataOutput;
   
   public class PlayerShoot extends ClientPacket
   {
       
      
      public var time_:int;
      
      public var bulletId_:uint;
      
      public var containerType_:int;
      
      public var startingPos_:_H_Q_;
      
      public var angle_:Number;
      
      public function PlayerShoot(param1:uint, param2:Function)
      {
         this.startingPos_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.time_);
         param1.writeByte(this.bulletId_);
         param1.writeShort(this.containerType_);
         this.startingPos_.writeToOutput(param1);
         param1.writeFloat(this.angle_);
      }
      
      override public function toString() : String
      {
         return formatToString("PLAYERSHOOT","time_","bulletId_","containerType_","startingPos_","angle_");
      }
   }
}