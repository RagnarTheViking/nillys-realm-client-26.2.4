package Packets.Server
{
   import _7m._H_Q_;
   import flash.utils.IDataInput;
   
   public class Goto extends ServerPacket
   {
       
      
      public var objectId_:int;
      
      public var pos_:_H_Q_;
      
      public function Goto(param1:uint, param2:Function)
      {
         this.pos_ = new _H_Q_();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.objectId_ = param1.readInt();
         this.pos_.parseFromInput(param1);
      }
      
      override public function toString() : String
      {
         return formatToString("GOTO","objectId_","pos_");
      }
   }
}
