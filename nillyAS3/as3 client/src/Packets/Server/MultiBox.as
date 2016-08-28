package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class MultiBox extends ServerPacket
   {
      
      public static var accountIds:Array = null;
       
      
      public function MultiBox(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = param1.readShort();
         accountIds = new Array(_loc2_);
         while(_loc3_ < _loc2_)
         {
            accountIds[_loc3_] = param1.readUTF();
            _loc3_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("MBPlayer","accountIds");
      }
   }
}
