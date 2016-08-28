package Packets
{
   import Packets.Client.ClientPacket;
   import _7m.ObjectSlot;
   import flash.utils.IDataOutput;
   
   public class PetYardCommand extends ClientPacket
   {
      
      public static const _0E_O_:int = 0;
      
      public static const _1H_Y_:int = 1;
       
      
      public var _0bm:int;
      
      public var _1oy:int;
      
      public var _1vM_:int;
      
      public var objectId:int;
      
      public var _1J_S_:ObjectSlot;
      
      public var _T_Z_:int;
      
      public function PetYardCommand(param1:uint, param2:Function)
      {
         this._1J_S_ = new ObjectSlot();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeByte(this._0bm);
         param1.writeInt(this._1oy);
         param1.writeInt(this._1vM_);
         param1.writeInt(this.objectId);
         this._1J_S_.writeToOutput(param1);
         param1.writeByte(this._T_Z_);
      }
   }
}
