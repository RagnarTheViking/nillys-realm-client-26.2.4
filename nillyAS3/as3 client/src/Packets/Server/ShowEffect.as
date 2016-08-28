package Packets.Server
{
   import _7m._H_Q_;
   import flash.utils.IDataInput;
   
   public class ShowEffect extends ServerPacket
   {
      
      public static const _C_s:int = 0;
      
      public static const Potion:int = 1;
      
      public static const Teleport:int = 2;
      
      public static const Stream:int = 3;
      
      public static const Throw:int = 4;
      
      public static const AreaBlast:int = 5;
      
      public static const Dead:int = 6;
      
      public static const Trail:int = 7;
      
      public static const Diffuse:int = 8;
      
      public static const Flow:int = 9;
      
      public static const Trap:int = 10;
      
      public static const Lightning:int = 11;
      
      public static const Concentrate:int = 12;
      
      public static const BlastWave:int = 13;
      
      public static const Earthquake:int = 14;
      
      public static const Flashing:int = 15;
      
      public static const BeachBall:int = 16;
      
      public static const _S_H_:int = 17;
      
      public static const _P_x:int = 18;
      
      public static const _iR_:int = 19;
       
      
      public var effectType_:uint;
      
      public var targetObjectId_:int;
      
      public var pos1_:_H_Q_;
      
      public var pos2_:_H_Q_;
      
      public var color_:int;
      
      public function ShowEffect(param1:uint, param2:Function)
      {
         this.pos1_ = new _H_Q_();
         this.pos2_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.effectType_ = param1.readUnsignedByte();
         this.targetObjectId_ = param1.readInt();
         this.pos1_.parseFromInput(param1);
         this.pos2_.parseFromInput(param1);
         this.color_ = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("SHOW_EFFECT","effectType_","targetObjectId_","pos1_","pos2_","color_");
      }
   }
}
