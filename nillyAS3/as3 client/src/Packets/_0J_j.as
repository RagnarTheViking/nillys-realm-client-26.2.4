package Packets
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class _0J_j extends ServerPacket
   {
       
      
      public var _gh:int;
      
      public function _0J_j(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this._gh = param1.readInt();
      }
   }
}
