package _L_K_
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class _C_L_ extends ServerPacket
   {
       
      
      public var _13R_:int;
      
      public function _C_L_(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this._13R_ = param1.readInt();
      }
   }
}
