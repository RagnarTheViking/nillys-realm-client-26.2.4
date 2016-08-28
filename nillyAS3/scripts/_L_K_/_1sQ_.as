package _L_K_
{
   import Packets.Server.ServerPacket;
   import flash.utils.IDataInput;
   
   public class _1sQ_ extends ServerPacket
   {
       
      
      public var petName:String;
      
      public var _0jt:int;
      
      public function _1sQ_(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.petName = param1.readUTF();
         this._0jt = param1.readInt();
      }
   }
}
