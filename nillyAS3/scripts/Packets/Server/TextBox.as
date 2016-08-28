package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class TextBox extends ServerPacket
   {
       
      
      public var title_:String;
      
      public var msg_:String;
      
      public var button1_:String;
      
      public var button2_:String;
      
      public var type_:String;
      
      public function TextBox(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         this.title_ = param1.readUTF();
         this.msg_ = param1.readUTF();
         this.button1_ = param1.readUTF();
         this.button2_ = param1.readUTF();
         this.type_ = param1.readUTF();
      }
      
      override public function toString() : String
      {
         return formatToString("TEXTBOX","title_","msg_","button1_","button2_","type_");
      }
   }
}
