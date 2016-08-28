package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class TextBoxButton extends ClientPacket
   {
       
      
      public var button_:int;
      
      public var type_:String;
      
      public function TextBoxButton(param1:uint, param2:Function)
      {
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         param1.writeInt(this.button_);
         param1.writeUTF(this.type_);
      }
      
      override public function toString() : String
      {
         return formatToString("TEXTBOXBUTTON","button_","type_");
      }
   }
}
