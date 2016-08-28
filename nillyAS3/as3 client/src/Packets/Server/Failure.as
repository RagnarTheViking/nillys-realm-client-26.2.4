package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class Failure extends ServerPacket
   {
      
      public static const ClientUpdateNeeded:int = 4;
      
      public static const MessageWithDisconnect:int = 5;
      
      public static const MessageWithImmediateReconnect:int = 6;
      
      public static const NoMessageDisconnect:int = 7;
      
      public static const JsonDialogDisconnect:int = 8;
       
      
      public var errorId_:int;
      
      public var errorDescription_:String;
      
      public function Failure(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.errorId_ = param1.readInt();
         this.errorDescription_ = param1.readUTF();
      }
      
      override public function toString() : String
      {
         return formatToString("FAILURE","errorId_","errorDescription_");
      }
   }
}
