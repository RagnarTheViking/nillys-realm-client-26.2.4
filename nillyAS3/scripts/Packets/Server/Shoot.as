package Packets.Server
{
   import _7m._H_Q_;
   import flash.utils.IDataInput;
   
   public class Shoot extends ServerPacket
   {
       
      
      public var bulletId_:uint;
      
      public var ownerId_:int;
      
      public var containerType_:int;
      
      public var startingPos_:_H_Q_;
      
      public var angle_:Number;
      
      public var damage_:int;
      
      public function Shoot(param1:uint, param2:Function)
      {
         this.startingPos_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.bulletId_ = param1.readUnsignedByte();
         this.ownerId_ = param1.readInt();
         this.containerType_ = param1.readInt();
         this.startingPos_.parseFromInput(param1);
         this.angle_ = param1.readFloat();
         this.damage_ = param1.readShort();
      }
      
      override public function toString() : String
      {
         return formatToString("SHOOT","bulletId_","ownerId_","containerType_","startingPos_","angle_","damage_");
      }
   }
}
