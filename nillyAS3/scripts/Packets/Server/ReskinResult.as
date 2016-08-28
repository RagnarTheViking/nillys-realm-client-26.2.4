package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class ReskinResult extends ServerPacket
   {
       
      
      public var skinID:int;
      
      public function ReskinResult(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.skinID = param1.readInt();
      }
      
      override public function toString() : String
      {
         return formatToString("RESKIN","skinID");
      }
   }
}
