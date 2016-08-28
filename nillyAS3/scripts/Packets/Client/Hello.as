package Packets.Client
{
   import flash.utils.ByteArray;
   import flash.utils.IDataOutput;
   
   public class Hello extends ClientPacket
   {
       
      
      public var buildVersion_:String;
      
      public var gameId_:int = 0;
      
      public var guid_:String;
      
      public var password_:String;
      
      public var secret_:String;
      
      public var keyTime_:int = 0;
      
      public var key_:ByteArray;
      
      public var _01H_:String;
      
      public var _1Q_J_:String = "";
      
      public var _1dT_:String = "";
      
      public var _0Q_u:String = "";
      
      public var _0fT_:String = "";
      
      public var _10f:String = "";
      
      public function Hello(param1:uint, param2:Function)
      {
         this.buildVersion_ = new String();
         this.guid_ = new String();
         this.password_ = new String();
         this.secret_ = new String();
         this.key_ = new ByteArray();
         this._01H_ = new String();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeUTF(this.buildVersion_);
         param1.writeInt(this.gameId_);
         param1.writeUTF(this.guid_);
         param1.writeUTF(this.password_);
         param1.writeUTF(this.secret_);
         param1.writeInt(this.keyTime_);
         param1.writeShort(this.key_.length);
         param1.writeBytes(this.key_);
         param1.writeInt(this._01H_.length);
         param1.writeUTFBytes(this._01H_);
         param1.writeUTF(this._1Q_J_);
         param1.writeUTF(this._1dT_);
         param1.writeUTF(this._0Q_u);
         param1.writeUTF(this._0fT_);
         param1.writeUTF(this._10f);
      }
      
      override public function toString() : String
      {
         return formatToString("HELLO","buildVersion_","gameId_","guid_","password_","secret_");
      }
   }
}
