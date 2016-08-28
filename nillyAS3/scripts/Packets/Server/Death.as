package Packets.Server
{
   import flash.display.BitmapData;
   import flash.utils.IDataInput;
   
   public class Death extends ServerPacket
   {
       
      
      public var accountId_:String;
      
      public var charId_:int;
      
      public var killedBy_:String;
      
      public var _0vo:int;
      
      public var _09L_:int;
      
      public var _0W_1:Boolean;
      
      public var background:BitmapData;
      
      public function Death(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      public function _16a() : void
      {
         this.background && this.background.dispose();
         this.background = null;
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.accountId_ = String(param1.readInt());
         this.charId_ = param1.readInt();
         this.killedBy_ = param1.readUTF();
         this._09L_ = param1.readInt();
         this._0vo = param1.readInt();
         this._0W_1 = this._0vo != -1;
      }
      
      override public function toString() : String
      {
         return formatToString("DEATH","accountId_","charId_","killedBy_");
      }
   }
}
