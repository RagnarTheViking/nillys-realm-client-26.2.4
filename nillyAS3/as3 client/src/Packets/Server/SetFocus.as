package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class SetFocus extends ServerPacket
   {
       
      
      public var objId_:int;
      
      public function SetFocus(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.objId_ = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("SETFOCUS","objId_");
      }
   }
}
