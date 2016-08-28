package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class BuyResult extends ServerPacket
   {
      
      public static const ErrorMessage:int = -1;
      
      public static const _0oN_:int = 0;
      
      public static const _0x__:int = 1;
      
      public static const _0__T_:int = 2;
      
      public static const NotEnoughGold:int = 3;
      
      public static const _Z_j:int = 4;
      
      public static const _12w:int = 5;
      
      public static const NotEnoughFame:int = 6;
      
      public static const _K_h:int = 7;
       
      
      public var result_:int;
      
      public var resultString_:String;
      
      public function BuyResult(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.result_ = param1.readInt();
         this.resultString_ = param1.readUTF();
      }
      
      override public function toString() : String
      {
         return formatToString("BUYRESULT","result_","resultString_");
      }
   }
}
