package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class VerifyEmail extends ServerPacket
   {
       
      
      public function VerifyEmail(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
      }
      
      override public function toString() : String
      {
         return formatToString("VERIFYEMAIL","asdf","asdf");
      }
   }
}
